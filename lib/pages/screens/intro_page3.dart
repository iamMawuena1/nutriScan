import 'package:flutter/material.dart';

class IntroPage3 extends StatelessWidget {
  const IntroPage3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[600],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // logo
            Image.asset(
              "images/onboarding3.png",
              width: 250,
            ),
            const SizedBox(height: 20),
            // description
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: Text(
                "Have control over what you eat with NutriScan, it just got easier",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
