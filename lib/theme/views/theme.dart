import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_boom_app/auth/presentation/views/login_screen.dart';
import 'package:home_boom_app/theme/manage/cubit_theme.dart';
import 'package:home_boom_app/theme/manage/state_theme.dart';
import 'package:home_boom_app/view/theme.dart';

final lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: const Color(0xff7EAF96),
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xff7EAF96),
    elevation: 0,
  ),
);

final darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: const Color(0xff7EAF96),
  scaffoldBackgroundColor: Colors.black,
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xff7EAF96),
    elevation: 0,
  ),
);