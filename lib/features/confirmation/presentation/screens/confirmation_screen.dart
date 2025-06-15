import 'package:flutter/material.dart';
import 'package:home_services_app/core/theme/app_colors.dart';
import 'package:home_services_app/core/theme/styles_manager.dart';
import 'package:home_services_app/core/utils/app_strings.dart';
import 'package:home_services_app/core/values/app_values.dart';

class ConfirmationScreen extends StatelessWidget{
  const ConfirmationScreen({super.key});


  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/check-mark-icon.png",
              width: screenWidth * AppSize.s0_6,
              height: screenWidth * AppSize.s0_6,
              fit: BoxFit.contain,
            ),
            SizedBox(height: screenHeight * AppSize.s0_02),
            Text(AppStrings.successfulRequest,style: getSemiBoldStyle(color: AppColors.black,fontSize: AppSize.s18),),
            SizedBox(height: screenHeight * AppSize.s0_008),
            Text(AppStrings.waitCall,style: getSemiBoldStyle(color: AppColors.black,fontSize: AppSize.s18),),

          ],
        ),
      ),
    );
  }

}