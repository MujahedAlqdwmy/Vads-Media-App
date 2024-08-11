import 'package:ai_titans/core/constants/app_colors.dart';
import 'package:ai_titans/core/constants/app_rout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToMainScreen();
  }

  Future<void> _navigateToMainScreen() async {
    await Future.delayed(const Duration(seconds: 5));
    Get.offAllNamed(AppRoute.questionsScreen);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors
          .darkPageBackgroundColor, // Customize background color as needed
      body: Center(
        child: Lottie.asset(
          'assets/json/main.json', // Replace with your Lottie animation file path
          width: 400, // Adjust width as needed
          height: 500, // Adjust height as needed
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
