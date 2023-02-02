import 'package:flutter/material.dart';
import 'dart:ui' show PointerDeviceKind;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_japanese_restaurant_app/src/data/repository/repository.dart';
import 'package:flutter_japanese_restaurant_app/src/presentation/screen/home_screen.dart';
import 'package:flutter_japanese_restaurant_app/src/business_logic/cubits/food/food_cubit.dart';
import 'package:flutter_japanese_restaurant_app/src/business_logic/cubits/theme/theme_cubit.dart';
import 'package:flutter_japanese_restaurant_app/src/business_logic/cubits/theme/theme_state.dart';
import 'package:flutter_japanese_restaurant_app/src/business_logic/cubits/category/category_cubit.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<Repository>(
      create: (context) => Repository(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider<FoodCubit>(
            create: (context) =>
                FoodCubit(repository: context.read<Repository>()),
          ),
          BlocProvider<CategoryCubit>(
            create: (context) =>
                CategoryCubit(repository: context.read<Repository>()),
          ),
          BlocProvider<ThemeCubit>(
            create: (context) => ThemeCubit(),
          ),
        ],
        child: BlocBuilder<ThemeCubit, ThemeState>(
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
