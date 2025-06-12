import 'package:flutter/material.dart';
import 'package:home_services_app/core/theme/app_colors.dart';
import 'package:home_services_app/core/theme/styles_manager.dart';
import 'package:home_services_app/core/utils/app_strings.dart';
import 'package:home_services_app/core/values/app_values.dart';

class UserInfoScreen extends StatelessWidget {
  const UserInfoScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController numberController = TextEditingController();
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Center(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(AppStrings.addYourName,style: getMediumStyle(fontSize: AppSize.s14,color: AppColors.primary),),
            SizedBox(
              height:screenHeight * AppSize.s0_005 ,
            ),
            TextFormField(
                keyboardType: TextInputType.name,
            controller: nameController,
              decoration: InputDecoration(
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return AppStrings.nameError;
              }
              return null;
            }),
            SizedBox(
              height:screenHeight * AppSize.s0_05,
            ),
            Text(AppStrings.addYourNumber,style: getMediumStyle(fontSize: AppSize.s14,color: AppColors.primary),),
            SizedBox(
              height:screenHeight * AppSize.s0_005 ,
            ),
            TextFormField(
                keyboardType: TextInputType.number,
                controller: numberController,
                decoration: InputDecoration(
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return AppStrings.numError;
                  }
                  return null;
                }),
            SizedBox(
              height:screenHeight * AppSize.s0_05,
            ),
            Text(AppStrings.whichTime,style: getMediumStyle(fontSize: AppSize.s14,color: AppColors.primary),),
            SizedBox(
              height:screenHeight * AppSize.s0_02 ,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap:(){

                  } ,
                  child: Material(
                    elevation: AppSize.s10,
                    color: AppColors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(
                        color: AppColors.darkGrey,
                        width:AppSize.s0_5,
                      ),
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color:AppColors.white,
                        border: Border.all(
                          color:AppColors.darkGrey,
                          width: AppSize.s1_5,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          Image.asset(
                            "assets/images/morning_icon.png",
                            height:screenHeight * AppSize.s0_11,
                            width: screenWidth * AppSize. s0_28,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(
                            height:screenHeight * AppSize.s0_002,
                          ),
                          Text(
                              AppStrings.morning,
                            style: getSemiBoldStyle(color: AppColors.black,fontSize: AppSize.s14),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap:(){

                  } ,
                  child: Material(
                    elevation: AppSize.s10,
                    color: AppColors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(
                        color: AppColors.darkGrey,
                        width:AppSize.s0_5,
                      ),
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color:AppColors.white,
                        border: Border.all(
                          color:AppColors.darkGrey,
                          width:  AppSize.s1_5,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          Image.asset(
                            "assets/images/evening_icon.png",
                            height:screenHeight * AppSize.s0_11,
                            width: screenWidth * AppSize. s0_28,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(
                            height:screenHeight * AppSize.s0_002,
                          ),
                          Text(
                              AppStrings.evening,
                            style: getSemiBoldStyle(color: AppColors.black,fontSize: AppSize.s14),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

