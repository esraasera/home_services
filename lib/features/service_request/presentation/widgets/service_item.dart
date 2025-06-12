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

    return  GestureDetector(
      // onTap:() {
      //   Navigator.push(
      //       context,
      //     MaterialPageRoute(
      //       builder: (context) => ServiceDetails(),
      //     ),
      //   );
      // } ,
      child: Container(
        height:screenHeight * AppSize.s0_18,
        width: screenWidth * AppSize. s0_4,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color:AppColors.iconsBG,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              width:AppSize.s60,
              fit:BoxFit.cover,
            ),
            SizedBox(
              height:screenHeight * AppSize.s0_01 ,
            ),
            Text(title,style: getBoldStyle(color: AppColors.black,fontSize: AppSize.s14),),
          ],
        ),
      ),
    );
  }
}
