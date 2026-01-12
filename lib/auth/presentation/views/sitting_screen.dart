import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_boom_app/auth/presentation/manage/cubit_auth.dart';
import 'package:home_boom_app/auth/presentation/manage/state_auth.dart';
import 'package:home_boom_app/auth/presentation/views/login_screen.dart';
import 'package:home_boom_app/theme/manage/cubit_theme.dart';
import 'package:home_boom_app/theme/manage/state_theme.dart';
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
        appBar: AppBar(
          title: const Text("Settings"),
          centerTitle: true,
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(vertical: 16),
          children: [
            _item(context, icon: Icons.person_outline, title: "Account"),
            _item(context, icon: Icons.notifications_none, title: "Notifications"),
            _item(context, icon: Icons.language, title: "Language"),

            /// 🌙 Dark / Light Theme
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(30),
              ),
              child: SwitchListTile(
                title: Text(
                  "Light / Dark",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                secondary: Icon(
                  Icons.dark_mode_outlined,
                  color: Theme.of(context).iconTheme.color,
                ),
                value: context.watch<ThemeCubit>().state is DarkThemeState,
                activeColor: Theme.of(context).primaryColor,
                onChanged: (value) {
                  context.read<ThemeCubit>().toggleTheme(value);
                },
              ),
            ),

            _item(context, icon: Icons.lock_outline, title: "Privacy & Security"),
            _item(context, icon: Icons.info_outline, title: "About"),

            const SizedBox(height: 30),

            /// 🚪 Logout Button (كما هو)
            BlocBuilder<CubitAuth, StateAuth>(
              builder: (context, state) {
                final isLoading = state is AuthLoading;

                return Center(
                  child: ElevatedButton(
                    onPressed: isLoading
                        ? null
                        : () {
                            context.read<CubitAuth>().logout();
                          },
                    style: ElevatedButton.styleFrom(
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
                              strokeWidth: 3,
                            ),
                          )
                        : Text(
                            "Logout",
                            style: Theme.of(context).textTheme.bodyLarge,
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


/// عنصر القائمة
Widget _item(BuildContext context,
    {required IconData icon, required String title}) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
    decoration: BoxDecoration(
      color: Theme.of(context).cardColor,
      borderRadius: BorderRadius.circular(30),
    ),
    child: ListTile(
      leading: Icon(icon, color: Theme.of(context).iconTheme.color),
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        size: 16,
        color: Theme.of(context).iconTheme.color,
      ),
    ),
  );
}
