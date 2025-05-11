import 'package:flutter/material.dart';
import 'package:home_services_app/core/theme/app_colors.dart';
import 'package:home_services_app/core/utils/app_string.dart';
import 'package:home_services_app/core/values/app_values.dart';

class LoginScreen extends StatelessWidget{
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
          child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(AppPadding.p20),
                child: Column(
                  children: [
                    Text(
                        AppStrings.login,

                    ),
                    SizedBox(
                      height: AppSize.s14,
                    ),
                    TextFormField(),
                    SizedBox(
                      height: AppSize.s8
                    ),
                    TextFormField(),
                  ]),
              )
              )
          )
      );
  }

}