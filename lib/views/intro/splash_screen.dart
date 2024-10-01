import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:get_storage/get_storage.dart';

import 'package:dinissa/util/app_colors.dart';
import 'package:dinissa/views/intro/welcome_screen.dart';

import '../main_screen/main_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late bool isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    await GetStorage.init();
    final box = GetStorage();
    setState(() {
      isLoggedIn = box.read('isLoggedIn') ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      backgroundColor: AppColors.primaryColor,
      splash: Image.asset(
        'assets/images/logo.png',
        height: MediaQuery.of(context).size.height * 0.5,
        width: MediaQuery.of(context).size.width * 0.5,
      ),
      nextScreen: isLoggedIn
          ? const DashboardScreen()
          : const WelcomeScreen(),
      splashTransition: SplashTransition.rotationTransition,
      pageTransitionType: PageTransitionType.fade,
      duration: 5000, // 5 seconds duration for splash screen
    );
  }
}
