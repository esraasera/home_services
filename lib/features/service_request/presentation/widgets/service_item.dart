import 'package:flutter/material.dart';
import 'package:home_services_app/core/theme/app_colors.dart';
import 'package:home_services_app/core/theme/styles_manager.dart';
import 'package:home_services_app/core/values/app_values.dart';

class ServiceItem extends StatelessWidget {
  final String title;
  final String subTitle;
  final String imagePath;
  final VoidCallback onTap;

  const ServiceItem({super.key, required this.title, required this.imagePath, required this.onTap, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,  height:screenHeight * AppSize.s0_12,
              width: screenWidth * AppSize. s0_23,
              fit: BoxFit.cover,
            ),
              SizedBox(
              height: screenHeight * AppSize.s0_005,
            ),
            Text(title, style: getBoldStyle(color: AppColors.black,fontSize: AppSize.s14)),
          ],
        ),
      ),
    );
  }
}