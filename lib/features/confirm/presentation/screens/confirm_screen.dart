import 'package:flutter/material.dart';
import 'package:home_services_app/core/theme/app_colors.dart';
import 'package:home_services_app/core/theme/styles_manager.dart';
import 'package:home_services_app/core/values/app_values.dart';

class ConfirmScreen extends StatelessWidget{
  const ConfirmScreen({super.key});


  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Image.asset("assets/images/check-mark-icon.png",
              height: screenHeight * AppSize.s0_6,
              width: screenWidth * AppSize.s0_6,
            ),
            Text("Request submitted successfully!",style: getMediumStyle(color: AppColors.black,fontSize: AppSize.s18),),
            SizedBox(
              height: screenHeight * AppSize.s0_02,
            ),
            Text("Please wait for a call.",style: getMediumStyle(color: AppColors.black,fontSize: AppSize.s18),),

          ],
        ),
      ),
    );
  }

}