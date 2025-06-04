import 'package:flutter/material.dart';
import 'package:home_services_app/core/theme/app_colors.dart';
import 'package:home_services_app/core/utils/app_strings.dart';
import 'package:home_services_app/core/values/app_values.dart';

class UserInfoScreen extends StatelessWidget {
  const UserInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
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
            ElevatedButton(
                style:ElevatedButton.styleFrom(
                  backgroundColor: AppColors.lightPrimary,
                  foregroundColor: AppColors.primary,
                  minimumSize: Size(AppSize.s120, AppSize.s55),
                ) ,
                onPressed:(){},
                child:Text(AppStrings.back)
            ),
            Spacer(),

            ElevatedButton(
                style:ElevatedButton.styleFrom(
                  minimumSize: Size(AppSize.s120, AppSize.s55),
                ),
                onPressed:(){},
                child:Text(AppStrings.next))
          ],
        ),
      ],
    );
  }
}

