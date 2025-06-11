import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:home_services_app/core/theme/app_colors.dart';
import 'package:home_services_app/core/utils/app_constants.dart';
import 'package:home_services_app/features/auth/presentation/screens/login_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AnimatedSplashScreen(
          splashIconSize: AppConstants.splashIconSize,
          splashTransition: SplashTransition.fadeTransition,
          animationDuration:AppConstants.splashAnimationDuration,
          backgroundColor: AppColors.lightGrey,
          splash:Center(
          child:Image.asset('assets/images/logo.png')
          ),
          nextScreen: LoginScreen(),
          ));
  }
}
