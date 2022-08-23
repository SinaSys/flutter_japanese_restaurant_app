import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart' show ThemeData, immutable;
import '../../../../core/app_theme.dart';

@immutable
class ThemeState extends Equatable {
  final ThemeData theme;

  const ThemeState({
    required this.theme,
  });

  factory ThemeState.initial() {
    return ThemeState(theme: AppThemes.appThemeData[AppTheme.darkTheme]!);
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
