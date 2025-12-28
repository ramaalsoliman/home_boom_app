import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_boom_app/auth/presentation/manage/cubit_auth.dart';
import 'package:home_boom_app/auth/presentation/manage/state_auth.dart';
import 'package:home_boom_app/auth/presentation/views/login_screen.dart';
import 'package:home_boom_app/theme/manage/cubit_theme.dart';
import 'package:home_boom_app/theme/manage/state_theme.dart';
class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final themeCubit = context.read<ThemeCubit>();

    return BlocListener<CubitAuth, StateAuth>(
      listener: (context, state) {
        if (state is LogoutSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Logged out successfully")),
          );

          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => const LoginScreen()),
            (route) => false,
          );
        } else if (state is AuthFauiler) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      child: Scaffold(
        backgroundColor: const Color(0xff7EAF96),
        appBar: AppBar(
          title: const Text("Settings"),
          centerTitle: true,
          backgroundColor: const Color(0xff7EAF96),
          elevation: 0,
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(vertical: 16),
          children: [
            _item(icon: Icons.person_outline, title: "Account"),
            _item(icon: Icons.notifications_none, title: "Notifications"),
            _item(icon: Icons.language, title: "Language"),

            /// Dark / Light Theme
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: BlocBuilder<ThemeCubit, ThemeState>(
                builder: (context, state) {
                  bool isDarkMode = state is DarkThemeState;
                  return SwitchListTile(
  title: const Text("Dark / Light"),
  secondary: const Icon(Icons.dark_mode_outlined, color: Color(0xff7EAF96)),
  value: context.watch<ThemeCubit>().state is DarkThemeState,
  activeColor: const Color(0xff7EAF96),
  onChanged: (value) {
    context.read<ThemeCubit>().toggleTheme(value);
  },
);
                },
              ),
            ),

            _item(icon: Icons.lock_outline, title: "Privacy & Security"),
            _item(icon: Icons.info_outline, title: "About"),

            const SizedBox(height: 20),

            /// Logout Button
            BlocBuilder<CubitAuth, StateAuth>(
              builder: (context, state) {
                bool isLoading = state is AuthLoading;

                return Center(
                  child: ElevatedButton(
                    onPressed: isLoading
                        ? null
                        : () {
                            context.read<CubitAuth>().logout();
                          },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      fixedSize: const Size(200, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    child: isLoading
                        ? const SizedBox(
                            height: 24,
                            width: 24,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 3,
                            ),
                          )
                        : const Text(
                            "Logout",
                            style: TextStyle(
                              color: Color(0xff7EAF96),
                              fontSize: 16,
                            ),
                          ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

Widget _item({required IconData icon, required String title}) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(30),
    ),
    child: ListTile(
      leading: Icon(icon, color: const Color(0xff7EAF96)),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
    ),
  );
}