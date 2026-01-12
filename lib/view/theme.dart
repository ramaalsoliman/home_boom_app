import 'package:flutter/material.dart';
import 'package:home_boom_app/theme/views/theme.dart';

final ThemeData lightTheme = ThemeData(
   colorScheme: ColorScheme.light(
    surface: Colors.white,
  ),
  brightness: Brightness.light,
  primaryColor: primaryGreen,
  scaffoldBackgroundColor: primaryGreen,

  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.transparent,
    elevation: 0,
    foregroundColor: lightTextPrimary,
  ),

  cardColor:  Colors.white,

  iconTheme: const IconThemeData(
    color: primaryGreen,
  ),

  textTheme: const TextTheme(
    titleLarge: TextStyle(
      color: lightTextPrimary,
      fontSize: 22,
      fontWeight: FontWeight.bold,
    ),
    bodyMedium: TextStyle(
      color: lightTextSecondary,
      fontSize: 16,
    ),
  ),

  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    selectedItemColor: primaryGreen,
    unselectedItemColor: lightTextSecondary,
  ),
);

final ThemeData darkTheme = ThemeData(
  colorScheme: ColorScheme.dark(
    surface: const Color(0xff1A1C20),
  ),
  brightness: Brightness.dark,
  primaryColor: primaryGreen,
  scaffoldBackgroundColor: darkBackground,

  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.transparent,
    elevation: 0,
    foregroundColor: darkTextPrimary,
  ),

  cardColor: darkCard,

  iconTheme: const IconThemeData(
    color: primaryGreen,
  ),

  textTheme: const TextTheme(
    titleLarge: TextStyle(
      color: darkTextPrimary,
      fontSize: 22,
      fontWeight: FontWeight.bold,
    ),
    bodyMedium: TextStyle(
      color: darkTextSecondary,
      fontSize: 16,
    ),
  ),

  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: darkBackground,
    selectedItemColor: primaryGreen,
    unselectedItemColor: darkTextSecondary,
  ),
);