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
    final TextEditingController addressController = TextEditingController();
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
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
            validator: (value) {
              if (value == null || value.isEmpty) {
                return AppStrings.nameError;
              }
              return null;
            }),
            SizedBox(
              height:screenHeight * AppSize.s0_03,
            ),
            Text(AppStrings.addYourNumber,style: getMediumStyle(fontSize: AppSize.s14,color: AppColors.primary),),
            SizedBox(
              height:screenHeight * AppSize.s0_005 ,
            ),
            TextFormField(
                keyboardType: TextInputType.number,
                controller: numberController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return AppStrings.numError;
                  }
                  return null;
                }),
            SizedBox(
              height:screenHeight * AppSize.s0_03,
            ),
            Text(AppStrings.addYourAddress,style: getMediumStyle(fontSize: AppSize.s14,color: AppColors.primary),),
            SizedBox(
              height:screenHeight * AppSize.s0_005 ,
            ),
            TextFormField(
                keyboardType: TextInputType.text,
                controller: addressController,
                decoration: InputDecoration(
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return AppStrings.numError;
                  }
                  return null;
                }),
            SizedBox(
              height:screenHeight * AppSize.s0_001 ,
            ),
            Padding(
              padding: const EdgeInsets.symmetric( vertical:  AppSize.s12),
              child: GestureDetector(
                onTap: () {
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(AppSize.s20),
                  child: Stack(
                    children: [
                      Image.asset(
                        "assets/images/map_image.png",
                        height: screenHeight * AppSize.s0_16,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                        bottom:AppSize.s8,
                        right: AppSize.s10,
                        child: Container(
                          padding: const EdgeInsets.all(AppSize.s4),
                          decoration: BoxDecoration(
                            color: AppColors.black,
                            borderRadius: BorderRadius.circular(AppSize.s20),
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.location_on, color:AppColors.white, size:AppSize.s15),
                               SizedBox(width: screenWidth * AppSize.s0_008),
                              Text(
                                 AppStrings.selectLocation,
                                style: getMediumStyle(color: AppColors.white,fontSize: AppSize.s12),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}

