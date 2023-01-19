import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_japanese_restaurant_app/core/app_theme.dart';
import 'package:flutter_japanese_restaurant_app/src/business_logic/cubits/theme/theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeState.initial());

  switchTheme() {
    if (state.theme == AppThemes.appThemeData[AppTheme.lightTheme]) {
      emit(state.copyWith(theme: AppThemes.appThemeData[AppTheme.darkTheme]!));
    } else {
      emit(state.copyWith(theme: AppThemes.appThemeData[AppTheme.lightTheme]!));
    }
  }

  bool get isLightTheme =>
      state.theme == AppThemes.appThemeData[AppTheme.lightTheme] ? true : false;
}
