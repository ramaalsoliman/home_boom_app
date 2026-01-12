import 'package:flutter/material.dart';
import 'package:home_boom_app/view/welcome_secreen.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 🖼️ Image
            Image.asset(
              "assets/tt.jpg", // غيري المسار حسب صورتك
              height: 280,
            ),

            const SizedBox(height: 30),

            // 🏠 Title
            Text(
              "Find Your Dream Home",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),

            const SizedBox(height: 12),

            // 📝 Subtitle
            Text(
              "Browse apartments, book easily, and enjoy your perfect stay.",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.color
                        ?.withOpacity(0.7),
                  ),
            ),

            const SizedBox(height: 40),

            // ▶️ Button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder:(context){
                    return WelcomeSecreen();
                  }));
                },
                child: const Text("Get Started"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
