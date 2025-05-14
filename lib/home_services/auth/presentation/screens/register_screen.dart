import 'package:flutter/material.dart';
import 'package:home_services_app/core/routing/app_routes.dart';
import 'package:home_services_app/core/theme/app_colors.dart';
import 'package:home_services_app/core/theme/styles_manager.dart';
import 'package:home_services_app/core/utils/app_string.dart';
import 'package:home_services_app/core/values/app_values.dart';

class RegisterScreen extends StatelessWidget{
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController userNameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController userPasswordController = TextEditingController();
    final formKey = GlobalKey<FormState>();
    return Scaffold(
        backgroundColor: AppColors.white,
        body: Center(
          child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(AppPadding.p20),
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: AppMargin.m40),
                  child: Form(
                    key:formKey,
                    child: Column(
                        children: [
                          Text(
                            AppStrings.register,
                            style: getBoldStyle(color: AppColors.black),
                          ),
                          SizedBox(
                            height: AppSize.s35,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            controller: emailController,
                            decoration: InputDecoration(
                              hintText: AppStrings.email,
                              labelText: AppStrings.email,
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return AppStrings.emailError;
                              }
                              return null;
                            },),
                          SizedBox(
                            height: AppSize.s20,
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
                          TextFormField(
                            keyboardType: TextInputType.visiblePassword,
                            controller: userPasswordController,
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: AppStrings.password,
                              labelText: AppStrings.password,
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return AppStrings.passwordError;
                              }
                              return null;
                            },),
                          SizedBox(
                            height: AppSize.s40,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                              }
                            },
                            child: Text(
                              AppStrings.register,
                            ),
                          ),
                          SizedBox(
                            height: AppSize.s28,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                AppStrings.alreadyUser,
                                style: getBoldStyle(color: AppColors.black,fontSize:AppSize.s14),
                              ),
                              SizedBox(
                                width: AppSize.s1_5,
                              ),
                              GestureDetector(
                                child: Text(
                                  AppStrings.login,
                                  style: getBoldStyle(color: AppColors.primary,fontSize: AppSize.s14),
                                ),
                                onTap:(){
                                  Navigator.of(context).pushReplacementNamed(Routes.loginRoute);
                                } ,
                              ),
                            ],
                          ),
                        ]),
                  ),
                ),
              )
          ),
        )
    );
  }

}