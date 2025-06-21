import 'package:flutter/material.dart';
import 'package:home_services_app/core/theme/app_colors.dart';
import 'package:home_services_app/core/theme/styles_manager.dart';
import 'package:home_services_app/core/values/app_values.dart';
import 'package:home_services_app/features/service_request/data/models/service_details_model.dart';

class ServiceItem extends StatelessWidget {
  final ServiceDetailsModel service;

  const ServiceItem({super.key,required this.service});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: (){},
      child: Container(
        decoration: BoxDecoration(
          color:AppColors.iconsBG,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              service.imagePath,
              height:screenHeight * AppSize.s0_12,
              width: screenWidth * AppSize. s0_24,
              fit: BoxFit.cover,
            ),
              SizedBox(
              height: screenHeight * AppSize.s0_01,
            ),
            Text( service.title, style: getBoldStyle(color: AppColors.black,fontSize: AppSize.s14)),
          ],
        ),
      ),
    );
  }
}