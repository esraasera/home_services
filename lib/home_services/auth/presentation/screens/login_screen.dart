import 'package:flutter/material.dart';
import 'package:home_services_app/core/theme/app_colors.dart';
import 'package:home_services_app/core/theme/styles_manager.dart';
import 'package:home_services_app/core/utils/app_string.dart';
import 'package:home_services_app/core/values/app_values.dart';

class LoginScreen extends StatelessWidget{
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController userNameController = TextEditingController();
    final TextEditingController userPasswordController = TextEditingController();
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
                      style: getBoldStyle(color: AppColors.black),
                    ),
                    SizedBox(
                      height: AppSize.s14,
                    ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: userNameController,
                    decoration: InputDecoration(
                        hintText: AppStrings.username,
                        labelText: AppStrings.username,
                        errorText: AppStrings.usernameError,
                  )),
                    SizedBox(
                      height: AppSize.s40,
                    ),
                    TextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        controller: userPasswordController,
                        decoration: InputDecoration(
                            hintText: AppStrings.password,
                            labelText: AppStrings.password,
                            errorText: AppStrings.passwordError,
                        )),
                  ]),
              )
              )
          )
      );
  }

}