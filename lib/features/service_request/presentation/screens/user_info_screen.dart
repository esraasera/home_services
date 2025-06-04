import 'package:flutter/material.dart';
import 'package:home_services_app/core/theme/app_colors.dart';
import 'package:home_services_app/core/utils/app_strings.dart';
import 'package:home_services_app/core/values/app_values.dart';

class UserInfoScreen extends StatelessWidget {
  const UserInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: AppPadding.p50),
      child: Column(
        children: [
          TextFormField(),
          SizedBox(
            height: AppSize.s30,
          ),
          TextFormField(),
          SizedBox(
            height: AppSize.s30,
          ),
          Row(
            children: [
             Container(
               decoration: BoxDecoration(

               ),
               child: Column(
                 children: [
                   Image.asset(
                     "assets/images/morning_icon.png",
                     height: AppSize.s120,
                     width: AppSize.s120,
                   ),
                   Text(
                     'rgrgg'
                   ),
                 ],
               ),
             ),
              Spacer(),

              Image.asset(
                "assets/images/evening_icon.png",
                height: AppSize.s120,
                width: AppSize.s120,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

