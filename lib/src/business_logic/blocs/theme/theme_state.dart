part of 'theme_bloc.dart';

@immutable
class ThemeState extends Equatable {
  final ThemeData theme;

  const ThemeState({required this.theme});

  factory ThemeState.initial() {
    return ThemeState(theme: AppThemes.appThemeData[AppTheme.darkTheme]!);
  }

  @override
  List<Object?> get props => [theme];

  ThemeState copyWith({ThemeData? theme}) {
    return ThemeState(theme: theme ?? this.theme);
  }
}
