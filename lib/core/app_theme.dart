import 'package:flutter/material.dart';
import 'app_color.dart';
import 'app_style.dart';

enum AppTheme { lightTheme, darkTheme }

class AppThemes {
  const AppThemes._();

  static final appThemeData = {
    AppTheme.lightTheme: ThemeData(
      scaffoldBackgroundColor: LightThemeColor.primaryLight,
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: LightThemeColor.accent),
      appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black45),
          centerTitle: true,
          titleTextStyle: h2Style),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all<Color>(LightThemeColor.accent),
      )),
      hintColor: Colors.black45,
      inputDecorationTheme: InputDecorationTheme(
        border: const OutlineInputBorder(borderSide: BorderSide.none),
        enabledBorder: textFieldStyle,
        focusedBorder: textFieldStyle,
        filled: true,
        contentPadding: const EdgeInsets.all(20),
        fillColor: Colors.white,
      ),
      bottomAppBarColor: Colors.white,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: LightThemeColor.accent),
      textTheme: const TextTheme(
        headline1: h1Style,
        headline2: h2Style,
        headline3: h3Style,
        headline4: h4StyleLight,
        headline5: h5StyleLight,
        bodyText1: bodyTextLight,
        subtitle1: subtitleLight,
      ),
      iconTheme: const IconThemeData(color: Colors.black45),
    ),
    AppTheme.darkTheme: ThemeData(
        canvasColor: DarkThemeColor.primaryDark,
        scaffoldBackgroundColor: DarkThemeColor.primaryDark,
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: LightThemeColor.accent),
        appBarTheme: const AppBarTheme(
            backgroundColor: Colors.transparent,
            elevation: 0,
            toolbarTextStyle: TextStyle(color: Colors.white),
            centerTitle: true,
            iconTheme: IconThemeData(color: Colors.white),
            titleTextStyle: h2Style),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all<Color>(LightThemeColor.accent),
        )),
        hintColor: Colors.white60,
        inputDecorationTheme: InputDecorationTheme(
          enabledBorder: textFieldStyle,
          focusedBorder: textFieldStyle,
          filled: true,
          contentPadding: const EdgeInsets.all(20),
          fillColor: DarkThemeColor.primaryLight,
        ),
        bottomAppBarColor: DarkThemeColor.primaryLight,
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            type: BottomNavigationBarType.fixed,
            backgroundColor: DarkThemeColor.primaryLight,
            selectedItemColor: LightThemeColor.accent,
            unselectedItemColor: Colors.white70),
        textTheme: TextTheme(
          headline1: h1Style.copyWith(color: Colors.white),
          headline2: h2Style.copyWith(color: Colors.white),
          headline3: h3Style.copyWith(color: Colors.white),
          headline4: h4StyleLight.copyWith(color: Colors.white),
          headline5: h5StyleLight.copyWith(color: Colors.white),
          bodyText1: bodyTextLight.copyWith(color: Colors.white),
          subtitle1: subtitleLight.copyWith(color: Colors.white60),
        ),
        iconTheme: const IconThemeData(color: Colors.white))
  };
}
