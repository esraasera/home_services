import 'package:flutter/material.dart';
import 'package:home_services_app/core/theme/app_colors.dart';
import 'package:home_services_app/core/theme/styles_manager.dart';
import 'package:home_services_app/core/utils/app_strings.dart';
import 'package:home_services_app/core/values/app_values.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: screenHeight * AppSize.s0_05),
      child: Material(
        elevation: AppSize.s10,
        borderRadius: BorderRadius.circular(AppSize.s16),
        color:AppColors.lightGrey,
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.lightGrey,
            borderRadius: BorderRadius.circular(AppSize.s16),
            border: Border.all(
              color:AppColors.white,
              width: AppSize.s4,
            ),
          ),

          child: Padding(
            padding: const EdgeInsets.all(AppSize.s8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Material(
                  elevation: AppSize.s10,
                  borderRadius: BorderRadius.circular(AppSize.s16),
                  child: Container(
                    height:screenHeight * AppSize.s0_2,
                    width:double.infinity,
                    decoration: BoxDecoration(
                      color:AppColors.white,
                      borderRadius: BorderRadius.circular(AppSize.s16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(AppSize.s18),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(AppStrings.theService,style: getBoldStyle(color: AppColors.primary,fontSize: AppSize.s18),),
                              Text("Plumbing",style: getSemiBoldStyle(color: AppColors.black,fontSize: AppSize.s18),),
                            ],
                          ),
                          SizedBox(
                            height:screenHeight * AppSize.s0_03 ,
                          ),
                          Row(
                            children: [
                              Text(AppStrings.theCost,style: getBoldStyle(color: AppColors.primary,fontSize: AppSize.s18),),
                              Text("200 EGP",style: getSemiBoldStyle(color: AppColors.black,fontSize: AppSize.s18),),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height:screenHeight * AppSize.s0_09 ,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                   Material(
                     elevation: AppSize.s10,
                     shape: const CircleBorder(),
                     child: CircleAvatar(
                       backgroundColor: AppColors.primary,
                       radius:screenWidth * AppSize.s0_16 ,
                       child: Text(
                       AppStrings.payByCard,
                       textAlign: TextAlign.center,
                       style: getBoldStyle(
                         color: AppColors.white,
                         fontSize: AppSize.s15,
                       ),
                     ),
                ),
                   ),
                    Material(
                      elevation: AppSize.s10,
                      shape: const CircleBorder(),
                      child: CircleAvatar(
                          backgroundColor: AppColors.white,
                          radius:screenWidth * AppSize.s0_16 ,
                        child: Text(
                          AppStrings.cashOnDelivery,
                          textAlign: TextAlign.center,
                          style: getBoldStyle(
                            color: AppColors.primary,
                            fontSize: AppSize.s15,
                          ),
                        ),

                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

