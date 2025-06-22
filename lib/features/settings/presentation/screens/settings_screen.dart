import 'package:flutter/material.dart';
import 'package:home_services_app/core/routing/app_routes.dart';
import 'package:home_services_app/core/theme/app_colors.dart';
import 'package:home_services_app/core/theme/styles_manager.dart';
import 'package:home_services_app/core/utils/app_strings.dart';
import 'package:home_services_app/core/values/app_values.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title:Row(
            children: [
        IconButton(
        icon:Icon(
            Icons.arrow_back_ios_new_outlined,color: AppColors.white
        ), onPressed: () {
          Navigator.pushReplacementNamed(context, Routes.stepperRoute);
    },
    ),
              SizedBox(
                 width:screenWidth * AppSize.s0_002,
              ),
              Text(
                AppStrings.settings,
                style: getBoldStyle(
                    color: AppColors.white,
                    fontSize: AppSize.s24
                ),),
            ],
          ),
        ),
    );
  }
}
