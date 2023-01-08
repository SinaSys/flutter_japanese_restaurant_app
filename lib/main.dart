import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'src/business_logic/cubits/category/category_cubit.dart';
import 'src/business_logic/cubits/food/food_cubit.dart';
import 'src/business_logic/cubits/theme/theme_cubit.dart';
import 'src/business_logic/cubits/theme/theme_state.dart';
import 'src/data/repository/repository.dart';
import 'src/presentation/screen/home_screen.dart';

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
              theme: state.theme,
              home: HomeScreen(),
            );
          },
        ),
      ),
    );
  }
}
