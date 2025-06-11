import 'package:flutter/material.dart';
import 'package:home_services_app/core/theme/app_colors.dart';
import 'package:home_services_app/core/theme/styles_manager.dart';
import 'package:home_services_app/core/values/app_values.dart';

class ServiceItem extends StatelessWidget {
  final String title;
  final String imagePath;
  final VoidCallback onTap;

  const ServiceItem({
    super.key,
    required this.title,
    required this.imagePath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: onTap,
      child: Material(
        elevation: AppSize.s4,
        color: AppColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s12),
          side: BorderSide(
            color: AppColors.grey,
            width: AppSize.s0_5,
          ),
        ),
        child: Container(
          width: screenWidth * AppSize.s0_4,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSize.s12),
            color: AppColors.white,
          ),
          child: Column(
            children: [
              Image.asset(
                imagePath,
                height: screenHeight * AppSize.s0_11,
                width: screenWidth * AppSize.s0_28,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 8),
              Text(
                title,
                style: getMediumStyle(
                  fontSize: AppSize.s14,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
