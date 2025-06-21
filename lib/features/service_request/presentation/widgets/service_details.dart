import 'package:flutter/material.dart';
import 'package:home_services_app/core/theme/app_colors.dart';
import 'package:home_services_app/core/theme/app_text_style.dart';
import 'package:home_services_app/core/theme/styles_manager.dart';
import 'package:home_services_app/core/utils/app_strings.dart';
import 'package:home_services_app/core/values/app_values.dart';
import 'package:home_services_app/features/service_request/data/models/service_details_model.dart';

class ServiceDetailsScreen extends StatelessWidget {
  final ServiceDetailsModel service;

  const ServiceDetailsScreen({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {Navigator.pop(context);},
            child: Icon(Icons.arrow_back_ios_new_outlined,color: AppColors.white,)),
          title: Text(service.subTitle,style: getBoldStyle(color: AppColors.white,fontSize: FontSize.s18),)
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(
           screenWidth * AppPadding.p0_04,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Padding(
              padding: EdgeInsets.all(screenWidth * AppPadding.p0_022,),
              child: Image.asset(service.imagePath, height: screenHeight * AppSize.s0_25),
            )),
            SizedBox(
              height:screenHeight * AppSize.s0_02,
            ),
            Text(
              service.description,
              style: getMediumStyle(color: AppColors.black,fontSize: AppSize.s16),
            ),
            SizedBox(
              height:screenHeight * AppSize.s0_028,
            ),
            Text("Services Offered:", style: getSemiBoldStyle(color: AppColors.primary,fontSize: AppSize.s18)),
            SizedBox(
              height:screenHeight * AppSize.s0_028,
            ),
            ...service.features.map((f) => Text("• $f",style: getMediumStyle(color: AppColors.black,fontSize: AppSize.s16),)),
            SizedBox(
              height:screenHeight * AppSize.s0_028,
            ),
            Text("Starting Price: ${service.startingPrice}",style: getMediumStyle(color: AppColors.black,fontSize: AppSize.s16),),
            SizedBox(
              height:screenHeight * AppSize.s0_02,
            ),
            Text("Estimated Duration: ${service.estimatedDuration}",style: getMediumStyle(color: AppColors.black,fontSize: AppSize.s16),),
            SizedBox(
              height:screenHeight * AppSize.s0_02,
            ),
            Text("Working Hours: ${service.workingHours}",style: getMediumStyle(color: AppColors.black,fontSize: AppSize.s16),),
            SizedBox(
              height:screenHeight * AppSize.s0_06,
            ),
            Center(
              child: ElevatedButton(
                style:ElevatedButton.styleFrom(
                  minimumSize: Size( screenWidth * AppSize.s1 , screenHeight * AppSize.s0_073),
                ),
                onPressed: () {

                },
                child: Text(
                  AppStrings.bookNow,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}