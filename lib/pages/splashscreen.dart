import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:nutri_scan/pages/onbaording.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade600,
      body: Center(
        child: AnimatedSplashScreen(
          duration: 3000,
          splash: const Text(
            'NUTRISCAN',
            // style: TextStyle(
            //   fontSize: 24,
            //   color: Colors.white,
            //   fontWeight: FontWeight.bold,
            // ),
          ),
          nextScreen: const OnboardingPage(),
        ),
      ),
    );
  }
}
