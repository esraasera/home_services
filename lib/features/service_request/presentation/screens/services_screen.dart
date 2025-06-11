import 'package:flutter/material.dart';
import 'package:home_services_app/core/theme/app_colors.dart';
import 'package:home_services_app/core/theme/styles_manager.dart';
import 'package:home_services_app/core/values/app_values.dart';
import 'package:home_services_app/core/utils/app_strings.dart';
import 'package:home_services_app/features/service_request/presentation/widgets/service_item.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(top: screenHeight * AppPadding.p0_02),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ServiceItem(title:AppStrings.plumbing, imagePath:"assets/images/plumbing_icon.png", onTap: (){}),
                SizedBox(
                  width:screenWidth * AppSize.s0_08 ,
                ),
                ServiceItem(title:AppStrings.carpentry, imagePath:  "assets/images/carpentry.png", onTap: (){}),
              ],
            ),
            SizedBox(
              height: screenHeight*AppSize.s0_03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ServiceItem(title:AppStrings.electrical, imagePath:  "assets/images/electrical_icon.png", onTap: (){}),
                SizedBox(
                  width:screenWidth * AppSize.s0_08 ,
                ),
                ServiceItem(title:AppStrings.painting, imagePath:  "assets/images/painting_icon.png", onTap: (){}),
              ],
            ),
            SizedBox(
              height: screenHeight*AppSize.s0_03,
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ServiceItem(title: AppStrings.pestControl, imagePath: "assets/images/Pest_control_icon.png", onTap: (){}),
                SizedBox(
                  width:screenWidth * AppSize.s0_08 ,
                ),
                ServiceItem(title: AppStrings.cleaning, imagePath: "assets/images/cleaning_icon.png", onTap: (){}),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
