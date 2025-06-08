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
    return Padding(
      padding: EdgeInsets.only(top: screenHeight * AppPadding.p0_005),
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
              height:screenHeight * AppSize.s0_04,
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
              height:screenHeight * AppSize.s0_04,
            ),
            Text(AppStrings.whichTime,style: getMediumStyle(fontSize: AppSize.s14,color: AppColors.primary),),
            SizedBox(
              height:screenHeight * AppSize.s0_005 ,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Image.asset(
                      "assets/images/morning_icon.png",
                      height:screenHeight * AppSize.s0_15,
                      width: screenWidth * AppSize. s0_3,
                      fit: BoxFit.cover,
                    ),
                    Material(
                      elevation: AppSize.s10,
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(12),
                      child: GestureDetector(
                        onTap:(){

                        } ,
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border.all(
                              color:AppColors.grey,
                              width: 0.5,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                              AppStrings.morning
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Image.asset(
                      "assets/images/evening_icon.png",
                      height:screenHeight * AppSize.s0_15,
                      width: screenWidth * AppSize. s0_3,
                      fit: BoxFit.cover,
                    ),
                    Material(
                      elevation: AppSize.s10,
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(12),
                      child: GestureDetector(
                        onTap:(){

                        } ,
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border.all(
                              color:AppColors.grey,
                              width: 0.5,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                              AppStrings.evening
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

