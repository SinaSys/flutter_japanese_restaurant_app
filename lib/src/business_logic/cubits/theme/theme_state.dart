import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../core/app_theme.dart';

class ThemeState extends Equatable {
  final ThemeData theme;

  const ThemeState({
    required this.theme,
  });

  factory ThemeState.initial() {
    return ThemeState(theme: AppThemes.appThemeData[AppTheme.lightTheme]!);
  }

  @override
  List<Object?> get props => [theme];

  ThemeState copyWith({
    ThemeData? theme,
  }) {
    return ThemeState(
      theme: theme ?? this.theme,
    );
  }
}
