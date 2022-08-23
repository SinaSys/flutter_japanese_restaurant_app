import 'package:flutter/foundation.dart' show ChangeNotifier;
import 'package:flutter_japanese_restaurant_app/src/business_logic/provider/theme/theme_state.dart';
import '../../../../core/app_theme.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeState _state;

  ThemeState get state => _state;

  ThemeProvider() : _state = ThemeState.initial();

  switchTheme() {
    if (_state.theme == AppThemes.appThemeData[AppTheme.lightTheme]) {
      _state =
          _state.copyWith(theme: AppThemes.appThemeData[AppTheme.darkTheme]!);
    } else {
      _state =
          _state.copyWith(theme: AppThemes.appThemeData[AppTheme.lightTheme]!);
    }
    notifyListeners();
  }

  bool get isLightTheme =>
      _state.theme == AppThemes.appThemeData[AppTheme.lightTheme]
          ? true
          : false;
}
