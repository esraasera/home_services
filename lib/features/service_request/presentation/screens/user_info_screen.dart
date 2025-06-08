import 'package:flutter/material.dart';
import 'package:home_services_app/core/theme/app_colors.dart';
import 'package:home_services_app/core/theme/styles_manager.dart';
import 'package:home_services_app/core/utils/app_strings.dart';
import 'package:home_services_app/core/values/app_values.dart';

class UserInfoScreen extends StatelessWidget {
  const UserInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: AppPadding.p20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Add Your Name..',style: getMediumStyle(fontSize: AppSize.s14,color: AppColors.primary),),
            SizedBox(
              height: AppSize.s5,
            ),
            TextFormField(),
            SizedBox(
              height: AppSize.s30,
            ),
            Text('Add Your Number..',style: getMediumStyle(fontSize: AppSize.s14,color: AppColors.primary),),
            SizedBox(
              height: AppSize.s5,
            ),
            TextFormField(),
            SizedBox(
              height: AppSize.s35,
            ),
            Row(
              children: [
                Material(
                  elevation: AppSize.s10,
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(12),
                  child: GestureDetector(
                    onTap:(){

                    } ,
                    child: Container(
                      height: AppSize.s150,
                      width: AppSize.s120,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.all(
                          color:AppColors.grey,
                          width: 0.5,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          Image.asset(
                            "assets/images/morning_icon.png",
                            height: AppSize.s100,
                            width: AppSize.s100,
                          ),
                          Text(
                              AppStrings.morning
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Spacer(),
                Material(
                  elevation: AppSize.s10,
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(12),
                  child: GestureDetector(
                    onTap:(){

                    } ,
                    child: Container(
                      height: AppSize.s150,
                      width: AppSize.s120,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.all(
                          color:AppColors.grey,
                          width: 0.5,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          Image.asset(
                            "assets/images/evening_icon.png",
                            height: AppSize.s100,
                            width: AppSize.s100,
                          ),
                          Text(
                              AppStrings.evening
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

