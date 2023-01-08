import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'src/business_logic/provider/category/category_provider.dart';
import 'src/business_logic/provider/food/food_provider.dart';
import 'src/business_logic/provider/theme/theme_provider.dart';
import 'src/data/repository/repository.dart';
import 'src/presentation/screen/home_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<Repository>(create: (context) => Repository()),
        ChangeNotifierProvider<FoodProvider>(
          create: (context) => FoodProvider(
            repository: context.read<Repository>(),
          ),
        ),
        ChangeNotifierProvider<CategoryProvider>(
          create: (context) => CategoryProvider(
            repository: context.read<Repository>(),
          ),
        ),
        ChangeNotifierProvider<ThemeProvider>(
          create: (context) => ThemeProvider(),
        ),
      ],
      child: Consumer<ThemeProvider>(
        builder: (_, themeProvider, __) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: themeProvider.state.theme,
          home: HomeScreen(),
        ),
      ),
    );
  }
}
