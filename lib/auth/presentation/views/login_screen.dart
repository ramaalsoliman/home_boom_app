import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_boom_app/auth/presentation/manage/cubit_auth.dart';
import 'package:home_boom_app/auth/presentation/manage/state_auth.dart';
import 'package:home_boom_app/auth/presentation/views/sign_up_screen.dart';
import 'package:home_boom_app/const.dart';
import 'package:home_boom_app/textfield.dart';
import 'package:home_boom_app/Apartments/presentation/views/page_for_tenant.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController phoneNumber;
  late TextEditingController password;

  double contnerWight = 0;
  double contnerHight = 0;

  @override
  void initState() {
    phoneNumber = TextEditingController();
    password = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    phoneNumber.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CubitAuth, StateAuth>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text("Logged in successfully !")));
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const PageForTenant()),
          );
        } else if (state is AuthFauiler) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message), backgroundColor:  Color.fromARGB(255, 201, 66, 57)),
          );
        } else if (state is EmailFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message), backgroundColor: Color.fromARGB(255, 201, 66, 57)),
          );
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 32, vertical: 20),

          child: ListView(
            children: [
              Form(
                key: form,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Image(
                        image: AssetImage("assets/mmmm.jpg"),
                        height: 250,
                      ),
                    ),
                    const SizedBox(height: 30),

                    Text(
                      ("Welcome back!"),
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff7eaf96),
                      ),
                    ),
                    const SizedBox(height: 10),

                    Text(
                      ("Log in to continue to your apartments"),
                      style: TextStyle(color: Color(0xff7eaf96), fontSize: 20),
                    ),
                    const SizedBox(height: 20),
                    CustomTextField(
                      label: "phonenumber",
                      isPassword: false,
                      controller: phoneNumber,
                    ),
                    const SizedBox(height: 20),
                    CustomTextField(
                      label: "password",
                      isPassword: true,
                      controller: password,
                    ),
                    const SizedBox(height: 20),
                    BlocBuilder<CubitAuth, StateAuth>(
                      builder: (context, state) {
                        bool isloading = state is AuthLoading;

                        return Center(
                          child: ElevatedButton(
                            onPressed: isloading
                                ? null
                                : () {
                                    if (form.currentState!.validate()) {
                                      BlocProvider.of<CubitAuth>(
                                        context,
                                      ).login({
                                        "number_phone": phoneNumber.text,
                                        "password": password.text,
                                      });
                                    }
                                  },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xff7eaf96),
                              //  maximumSize: const Size(double.infinity,100),
                              fixedSize: Size(200, 50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                            child: isloading
                                ? const SizedBox(
                                    height: 24,
                                    width: 24,
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                      strokeWidth: 3,
                                    ),
                                  )
                                : const Text(
                                    ("Login"),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 20),
                    Center(
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignUpScreen(),
                            ),
                          );
                        },
                        child: const Text(
                          ("Don’t have an account? Create one now"),
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xff7eaf96),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
