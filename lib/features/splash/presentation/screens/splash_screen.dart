import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_services_app/core/utils/app_constants.dart';
import 'package:home_services_app/core/values/app_values.dart';
import 'package:home_services_app/features/auth/presentation/screens/login_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AnimatedSplashScreen(
          splashIconSize: AppConstants.splashIconSize.r,
          splashTransition: SplashTransition.fadeTransition,
          animationDuration:AppConstants.splashAnimationDuration,
          backgroundColor:  Theme.of(context).scaffoldBackgroundColor,
          splash:Center(
          child:Image.asset(
              'assets/images/logo.png',
            width: AppSize.s300.w,
            height:  AppSize.s300.h,
          )
          ),
          nextScreen: LoginScreen(),
          ));
  }
}
