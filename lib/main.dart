import 'package:flutter/material.dart';
import 'package:flutter_japanese_restaurant_app/src/business_logic/cubits/category/category_cubit.dart';
import 'package:flutter_japanese_restaurant_app/src/business_logic/cubits/food/food_cubit.dart';
import 'package:flutter_japanese_restaurant_app/src/business_logic/cubits/theme/theme_cubit.dart';
import 'package:flutter_japanese_restaurant_app/src/business_logic/cubits/theme/theme_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_japanese_restaurant_app/src/presentation/screen/home_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<FoodCubit>(
          create: (context) => FoodCubit(),
        ),
        BlocProvider<ThemeCubit>(
          create: (context) => ThemeCubit(),
        ),
        BlocProvider<CategoryCubit>(
          create: (context) => CategoryCubit(),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: state.theme,
            home: HomeScreen(),
          );
        },
      ),
    );
  }
}
