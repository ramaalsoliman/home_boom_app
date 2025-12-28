

import 'package:flutter/material.dart';
import 'package:home_boom_app/auth/presentation/views/login_screen.dart';
import 'package:home_boom_app/auth/presentation/views/sign_up_screen.dart';

class WelcomeSecreen extends StatelessWidget {
  const WelcomeSecreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color(0xff7eaf96),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 100,left: 70,right: 67),
            child: Text(("Wellcome"),style: TextStyle(fontSize: 32,fontWeight: FontWeight.bold,color: Color(0xfff6fcf5)),),
          ),
           Padding(
            padding: const EdgeInsets.only(top: 20,left: 70,right: 67),
            child: Text(("Here you log in securely"),style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400,color:Color(0xfff6fcf5)),),
          ),
          Image(image: AssetImage("assets/welcome.jpg")),
          InkWell(
            onTap: () {
                Navigator.push(context, 
                MaterialPageRoute(builder: (context){
                  return LoginScreen();
                }));
              },


            child: Container(
              height: 60,
              width: 300,
              decoration: BoxDecoration(
                border: BoxBorder.all(
                  color: Color(0xfff6fcf5),
                  width: 2,
            
                ),
                color:Color(0xff7eaf96),
                borderRadius: BorderRadius.circular(40)),
                child: Center(child: Text(("Log in"),style: TextStyle(fontSize: 21,fontWeight: FontWeight.w700,color: Color(0xfff6fcf5)),)),
              
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30),
            child: InkWell(
              onTap: () {
                Navigator.push(context, 
                MaterialPageRoute(builder: (context){
                  return SignUpScreen();
                }));
              },

              child: Container(
                height: 60,
                width: 300,
                decoration: BoxDecoration(
                  color: Color(0xfff6fcf5),
                  borderRadius: BorderRadius.circular(40)),
               child: Center(child: Text(("Sign Up"),style: TextStyle(fontSize: 21,fontWeight: FontWeight.w700,color: Color(0xff7eaf96)),)),
                
              ),
            ),
          )


        ],
      ),
    );
  }
}