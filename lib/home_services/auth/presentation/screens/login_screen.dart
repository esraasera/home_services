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
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(),
      body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(AppPadding.p20),
            child: Container(
              margin: EdgeInsets.symmetric(vertical: AppMargin.m40),
              child: Form(
                key:formKey,
                child: Column(
                  children: [
                    Text(
                        AppStrings.login,
                      style: getBoldStyle(color: AppColors.black),
                    ),
                    SizedBox(
                      height: AppSize.s40,
                    ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: userNameController,
                    decoration: InputDecoration(
                        hintText: AppStrings.username,
                        labelText: AppStrings.username,
                  ),
                   validator: (value) {
                  if (value == null || value.isEmpty) {
                  return AppStrings.usernameError;
                  }
                 return null;
                  },),
                    SizedBox(
                      height: AppSize.s20,
                    ),
                  //   TextFormField(
                  //       keyboardType: TextInputType.visiblePassword,
                  //       controller: userPasswordController,
                  //       decoration: InputDecoration(
                  //           hintText: AppStrings.password,
                  //           labelText: AppStrings.password,
                  //       ),
                  //       validator: (value) {
                  //      if (value == null || value.isEmpty) {
                  //      return AppStrings.usernameError;
                  //      }
                  //     return null;
                  // },),
                  ]),
              ),
            ),
          )
          )
      );
  }

}