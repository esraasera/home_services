import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_services_app/core/routing/app_routes.dart';
import 'package:home_services_app/core/theme/app_colors.dart';
import 'package:home_services_app/core/values/app_values.dart';
import 'package:home_services_app/features/auth/data/datasource/auth_remote_datasource.dart';
import 'package:home_services_app/features/auth/data/repository/auth_repository.dart';
import 'package:home_services_app/features/auth/domain/usecases/register_usecase.dart';
import 'package:home_services_app/features/auth/presentation/controller/cubit/register_cubit.dart';
import 'package:home_services_app/features/auth/presentation/controller/states/register_states.dart';
import 'package:home_services_app/features/service_request/presentation/controller/cubit/settings_cubit.dart';
import 'package:home_services_app/features/service_request/presentation/controller/states/settings_states.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(context) {
    return BlocListener<SettingsCubit, SettingsState>(
      listener: (BuildContext context, state) {},
      child: BlocProvider(
        create: (context) => RegisterCubit(
          RegisterUseCase(
            AuthRepositoryImpl(
              AuthRemoteDataSourceImpl(
                firebaseAuth: FirebaseAuth.instance,
                firestore: FirebaseFirestore.instance,
              ),
            ),
          ),
        ),
        child: BlocConsumer<RegisterCubit, RegisterState>(
          listener: (context, state) {
            if (state is RegisterFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                  duration: Duration(seconds: 3),
                ),
              );
            }
            if (state is RegisterSuccess) {
              Navigator.pushReplacementNamed(context, Routes.stepperRoute);
            }
          },
          builder: (BuildContext context, RegisterState state) {
            var cubit = RegisterCubit.get(context);
            var settingsCubit = SettingsCubit.get(context);
            return Scaffold(
              body: Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(AppPadding.p14.h),
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: AppMargin.m28.h),
                      child: Form(
                        key: formKey,
                        child: Column(children: [
                          SizedBox(
                            width: AppSize.s285.w,
                            height: AppSize.s249.h,
                            child: Image.asset(
                              "assets/images/auth_image.png",
                              fit: BoxFit.contain,
                            ),
                          ),
                          SizedBox(height: AppSize.s4.h),
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            controller: nameController,
                            style: TextStyle(
                              color: settingsCubit.isDark ? AppColors.white : AppColors.black,
                            ),
                            decoration: InputDecoration(
                              hintText: "username".tr(),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "usernameError".tr();
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: AppSize.s14.h),
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            controller: emailController,
                            style: TextStyle(
                              color: settingsCubit.isDark ? AppColors.white : AppColors.black,
                            ),
                            decoration: InputDecoration(
                              hintText: "email".tr(),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "emailError".tr();
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: AppSize.s14.h),
                          TextFormField(
                            keyboardType: TextInputType.visiblePassword,
                            controller: passwordController,
                            style: TextStyle(
                              color: settingsCubit.isDark ? AppColors.white : AppColors.black,
                            ),
                            obscureText: cubit.showPassword,
                            decoration: InputDecoration(
                              hintText: "password".tr(),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  cubit.showPassword ? Icons.visibility_off : Icons.visibility,
                                  color: cubit.showPassword ? AppColors.grey : AppColors.primary,
                                ),
                                onPressed: () {
                                  cubit.changeSuffixIcon();
                                },
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "passwordError".tr();
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: AppSize.s28.h),
                          state is RegisterLoading
                              ? CircularProgressIndicator()
                              : ElevatedButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                cubit.registerUser(
                                  emailController.text,
                                  nameController.text,
                                  passwordController.text,
                                );
                              }
                            },
                            child: Text("register".tr()),
                          ),
                          SizedBox(height: AppSize.s20.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "alreadyUser".tr(),
                                style: Theme.of(context).textTheme.displayLarge,
                              ),
                              GestureDetector(
                                child: Text(
                                  "login".tr(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayLarge!
                                      .copyWith(
                                    color: settingsCubit.isDark
                                        ? AppColors.lightPrimary
                                        : AppColors.primary,
                                  ),
                                ),
                                onTap: () {
                                  Navigator.of(context).pushReplacementNamed(Routes.loginRoute);
                                },
                              ),
                            ],
                          ),
                        ]),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}