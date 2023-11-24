import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_japanese_restaurant_app/core/app_icon.dart';
import 'package:flutter_japanese_restaurant_app/core/app_color.dart';
import 'package:flutter_japanese_restaurant_app/core/app_extension.dart';
import 'package:flutter_japanese_restaurant_app/src/data/model/food.dart';
import 'package:flutter_japanese_restaurant_app/src/presentation/widget/empty_widget.dart';
import 'package:flutter_japanese_restaurant_app/src/business_logic/provider/food/food_provider.dart';
import 'package:flutter_japanese_restaurant_app/src/business_logic/provider/theme/theme_provider.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Food> favoriteFoods =
        context.watch<FoodProvider>().getFavoriteList;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Favorite screen",
          style: Theme.of(context).textTheme.displayMedium,
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
              color: context.read<ThemeProvider>().isLightTheme
                  ? Colors.white
                  : DarkThemeColor.primaryLight,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: ListTile(
                title: Text(
                  food.name,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                leading: Image.asset(food.image),
                subtitle: Text(
                  food.description,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                trailing: const Icon(AppIcon.heart, color: Colors.redAccent),
              ),
            ).fadeAnimation(index * 0.6);
          },
          separatorBuilder: (_,__) {
            return const Padding(padding: EdgeInsets.only(bottom: 15));
          },
        ),
      ),
    );
  }
}
