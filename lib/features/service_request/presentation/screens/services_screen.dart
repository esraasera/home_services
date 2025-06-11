import 'package:flutter/material.dart';
import 'package:home_services_app/core/theme/app_colors.dart';
import 'package:home_services_app/core/theme/styles_manager.dart';
import 'package:home_services_app/core/values/app_values.dart';
import 'package:home_services_app/core/utils/app_strings.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.only(top: screenHeight * AppPadding.p0_02),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height:screenHeight * AppSize.s0_16,
                width: screenWidth * AppSize. s0_3,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color:AppColors.grey,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                        "assets/images/plumbing_icon.png",
                      fit:BoxFit.cover,
                    ),
                    SizedBox(
                      height:screenHeight * AppSize.s0_01 ,
                    ),
                    Text(AppStrings.plumbing,style: getBoldStyle(color: AppColors.black,fontSize: AppSize.s14),),
                  ],
                ),
              ),
              SizedBox(
                width:screenWidth * AppSize.s0_05 ,
              ),
              Container(
                height:screenHeight * AppSize.s0_16,
                width: screenWidth * AppSize. s0_3,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color:AppColors.grey,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/electrical_icon.png",
                      fit:BoxFit.cover,
                    ),
                    SizedBox(
                      height:screenHeight * AppSize.s0_01 ,
                    ),
                    Text(AppStrings.electrical,style: getBoldStyle(color: AppColors.black,fontSize: AppSize.s14),),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: screenHeight*AppSize.s0_02,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height:screenHeight * AppSize.s0_16,
                width: screenWidth * AppSize. s0_3,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color:AppColors.grey,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/painting_icon.png",
                      fit:BoxFit.cover,
                    ),
                    SizedBox(
                      height:screenHeight * AppSize.s0_01 ,
                    ),
                    Text(AppStrings.painting,style: getBoldStyle(color: AppColors.black,fontSize: AppSize.s14),),
                  ],
                ),
              ),
              SizedBox(
                width:screenWidth * AppSize.s0_05 ,
              ),
              Container(
                height:screenHeight * AppSize.s0_16,
                width: screenWidth * AppSize. s0_3,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color:AppColors.grey,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/cleaning_icon.png",
                      fit:BoxFit.cover,
                    ),
                    SizedBox(
                      height:screenHeight * AppSize.s0_01 ,
                    ),
                    Text(AppStrings.cleaning,style: getBoldStyle(color: AppColors.black,fontSize: AppSize.s14),),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: screenHeight*AppSize.s0_02,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height:screenHeight * AppSize.s0_16,
                width: screenWidth * AppSize. s0_3,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color:AppColors.grey,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/Pest_control.png",
                      fit:BoxFit.cover,
                    ),
                    SizedBox(
                      height:screenHeight * AppSize.s0_01 ,
                    ),
                    Text(AppStrings.pestControl,style: getBoldStyle(color: AppColors.black,fontSize: AppSize.s14),),
                  ],
                ),
              ),
              SizedBox(
                width:screenWidth * AppSize.s0_05 ,
              ),
              Container(
                height:screenHeight * AppSize.s0_16,
                width: screenWidth * AppSize. s0_3,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color:AppColors.grey,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/cleaning_icon.png",
                      fit:BoxFit.cover,
                    ),
                    SizedBox(
                      height:screenHeight * AppSize.s0_01 ,
                    ),
                    Text(AppStrings.cleaning,style: getBoldStyle(color: AppColors.black,fontSize: AppSize.s14),),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
