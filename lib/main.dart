import 'package:flutter/material.dart';
import 'dart:ui' show PointerDeviceKind;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_japanese_restaurant_app/src/data/repository/repository.dart';
import 'package:flutter_japanese_restaurant_app/src/presentation/screen/home_screen.dart';
import 'package:flutter_japanese_restaurant_app/src/business_logic/blocs/food/food_bloc.dart';
import 'package:flutter_japanese_restaurant_app/src/business_logic/blocs/theme/theme_bloc.dart';
import 'package:flutter_japanese_restaurant_app/src/business_logic/blocs/category/category_bloc.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<Repository>(
      create: (context) => Repository(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider<FoodBloc>(
            create: (context) =>
                FoodBloc(repository: context.read<Repository>()),
          ),
          BlocProvider<CategoryBloc>(
            create: (context) =>
                CategoryBloc(repository: context.read<Repository>()),
          ),
          BlocProvider<ThemeBloc>(
            create: (context) => ThemeBloc(),
          ),
        ],
        child: BlocBuilder<ThemeBloc, ThemeState>(
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              scrollBehavior: const MaterialScrollBehavior().copyWith(
                dragDevices: {
                  PointerDeviceKind.mouse,
                  PointerDeviceKind.touch,
                },
              ),
              theme: state.theme,
              home: HomeScreen(),
            );
          },
        ),
      ),
    );
  }
}
