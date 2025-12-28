import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_boom_app/Apartment%20Specifications/pesentation/manage/cubit_apartment%20_specifications.dart';
import 'package:home_boom_app/Apartments/model/describtion_model.dart';
import 'package:home_boom_app/Apartments/presentation/manage/cubit_apartment.dart';
import 'package:home_boom_app/auth/presentation/manage/cubit_auth.dart';

import 'package:home_boom_app/auth/presentation/views/login_screen.dart';
import 'package:home_boom_app/auth/presentation/views/sign_up_screen.dart';
import 'package:home_boom_app/auth/presentation/views/sitting_screen.dart';
import 'package:home_boom_app/check_token.dart';
import 'package:home_boom_app/page_for_lord/pesentation/views/loard_apartment.dart';
import 'package:home_boom_app/pageforfilter/persentation/manage/cubit_filter.dart';
import 'package:home_boom_app/theme/manage/cubit_theme.dart';
import 'package:home_boom_app/theme/manage/state_theme.dart';
import 'package:home_boom_app/view/list_for_describtion.dart';
import 'package:home_boom_app/Apartment%20Specifications/pesentation/views/page_for_descrebtion.dart';
import 'package:home_boom_app/Apartments/presentation/views/page_for_tenant.dart';
import 'package:home_boom_app/pageforfilter/persentation/views/page_foe_filter.dart';
import 'package:home_boom_app/view/theme.dart';
import 'package:home_boom_app/view/welcome_secreen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
 Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ThemeCubit()),
        BlocProvider(create: (_) => CubitAuth()),
        BlocProvider(create: (_) => CubitApartment()),
        BlocProvider(create: (_) => CubitApartmentSpecifications()),
        BlocProvider(create: (_) => CubitFilter()),
        // أي Cubit ثاني تحتاجه
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: state is LightThemeState ? lightTheme : darkTheme,
            home: const PageForTenant(),
            routes: {
              "login": (_) => const LoginScreen(),
              "signup": (_) => const SignUpScreen(),
              "tenant": (_) => const PageForTenant(),
              "filter": (_) => const SearchPage(),
              
            },
          );
        },
      ),
    );
  }
}