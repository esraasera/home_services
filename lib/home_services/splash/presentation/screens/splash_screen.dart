import 'package:flutter/material.dart';
import 'package:home_services_app/core/theme/app_colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
        body:Center(
          child: Image.asset('assets/images/logo.png'),
        ) ,
    );
  }
}
