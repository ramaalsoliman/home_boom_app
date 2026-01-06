import 'package:flutter/material.dart';
import 'package:home_boom_app/page_for_lord/presentation/views/loard_apartment.dart';
import 'package:home_boom_app/shard.dart';
import 'package:home_boom_app/Apartments/presentation/views/page_for_tenant.dart';
import 'package:home_boom_app/view/welcome_secreen.dart';

class CheckTokenPage extends StatelessWidget {
  Future<Widget> checkAuthAndRoute() async {
    
    String? token = await getToken(); 
      print(" TOKEN FROM STORAGE => $token");

    if (token != null) {
      
      return OwnerApartmentsPage();
    } else {
     
      return WelcomeSecreen();
    }
  }
  

  @override
   Widget build(BuildContext context) {
    return FutureBuilder<Widget>(
      future: checkAuthAndRoute(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          
          return Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        } else if (snapshot.hasData) {
         
          return snapshot.data!;
        } else {
         
          return WelcomeSecreen();
        }
      },
    );
  }
}