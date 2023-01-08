import 'package:flutter/material.dart';
import '../../../../core/app_extension.dart';
import '../../../core/app_color.dart';
import '../../../core/app_icon.dart';
import '../../business_logic/blocs/food/food_bloc.dart';
import '../../business_logic/blocs/theme/theme_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/food.dart';
import '../widget/empty_widget.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Food> favoriteFoods = context.watch<FoodBloc>().getFavoriteList;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Favorite screen",
          style: Theme.of(context).textTheme.headline2,
        ),
      ),
      body: EmptyWidget(
        type: EmptyWidgetType.favorite,
        title: "Empty favorite",
        condition: favoriteFoods.isNotEmpty,
        child: ListView.separated(
          padding: const EdgeInsets.all(15),
          itemCount: favoriteFoods.length,
          itemBuilder: (_, index) {
            Food food = favoriteFoods[index];
            return Card(
              color: context.read<ThemeBloc>().isLightTheme
                  ? Colors.white
                  : DarkThemeColor.primaryLight,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: ListTile(
                title: Text(food.name,
                    style: Theme.of(context).textTheme.headline4),
                leading: Image.asset(food.image),
                subtitle: Text(
                  food.description,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                trailing: const Icon(AppIcon.heart, color: Colors.redAccent),
              ),
            ).fadeAnimation(index * 0.6);
          },
          separatorBuilder: (BuildContext context, int index) {
            return const Padding(padding: EdgeInsets.only(bottom: 15));
          },
        ),
      ),
    );
  }
}
