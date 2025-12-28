import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_boom_app/theme/manage/state_theme.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(LightThemeState());

  void toggleTheme(bool isDark) {
    if (isDark) {
      emit(DarkThemeState());
    } else {
      emit(LightThemeState());
    }
  }
}