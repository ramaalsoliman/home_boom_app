import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_boom_app/theme/manage/state_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(LightThemeState()) {
    loadTheme();
  }

  /// تحميل الثيم المخزن
  Future<void> loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final isDark = prefs.getBool('isDark') ?? false;

    if (isDark) {
      emit(DarkThemeState());
    } else {
      emit(LightThemeState());
    }
  }

  /// تغيير الثيم + حفظه
  Future<void> toggleTheme(bool isDark) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDark', isDark);

    if (isDark) {
      emit(DarkThemeState());
    } else {
      emit(LightThemeState());
    }
  }
}