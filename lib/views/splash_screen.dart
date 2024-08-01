import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'package:dinissa/util/app_colors.dart';
import 'package:dinissa/views/welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 5),
      () {
        // Navigate to main screen
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return (AnimatedSplashScreen(
      backgroundColor: AppColors.primaryColor,
      splash: Image.asset(
        'assets/images/logo.png',
        height: MediaQuery.of(context).size.height * 0.5,
        width: MediaQuery.of(context).size.width * 0.5,
      ),
      nextScreen: const WelcomeScreen(),
      splashTransition: SplashTransition.rotationTransition,
      pageTransitionType: PageTransitionType.fade,
    ));
  }
}
