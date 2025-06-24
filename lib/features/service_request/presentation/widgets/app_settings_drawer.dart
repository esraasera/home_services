import 'package:flutter/material.dart';
import 'package:home_services_app/core/theme/app_colors.dart';
import 'package:home_services_app/core/theme/styles_manager.dart';
import 'package:home_services_app/core/utils/app_strings.dart';
import 'package:home_services_app/core/values/app_values.dart';

class AppSettingsDrawer extends StatelessWidget {
  const AppSettingsDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Drawer(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: screenHeight * AppPadding.p0_06,horizontal: screenWidth * AppPadding.p0_02 ),
        child: Column(
          children: [
                Text(
                AppStrings.settings,
                style: getBoldStyle(color: AppColors.primary,fontSize:screenWidth * AppSize.s0_11),
              ),
            SizedBox(
              height: screenHeight * AppSize.s0_04,
            ),
            Container(
              height: screenHeight* AppSize.s0_005,
              color: AppColors.primary,
            ),
            SizedBox(
              height: screenHeight * AppSize.s0_03,
            ),
            SwitchListTile(
              title: Text(
                AppStrings.darkMode,
                style: getBoldStyle(color: AppColors.black,fontSize:screenWidth * AppSize.s0_05),
              ),
              value: false,
              activeColor: AppColors.primary,
              inactiveTrackColor: AppColors.white,
              onChanged: (val) {

              },
            ),
        ListTile(
          title: Text(
            AppStrings.language,
            style: getBoldStyle(color: AppColors.black,fontSize:screenWidth * AppSize.s0_05
            ),),
          trailing: DropdownButton<String>(
            value: 'en',
            dropdownColor: AppColors.white,
            items: const [
              DropdownMenuItem(value: 'ar', child: Text(AppStrings.arabic)),
              DropdownMenuItem(value: 'en', child: Text(AppStrings.english)),
            ],
            onChanged: (value) {

            },
          ),
        ),
            ListTile(
              leading: Icon(Icons.logout,color: AppColors.black,),
              title: Text(
                  AppStrings.logOut,
                style: getBoldStyle(color: AppColors.black,fontSize:screenWidth * AppSize.s0_05),
              ),
              onTap: () {

              },
            ),
          ],
        ),
      ),
    );
  }
}
