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
import 'package:home_services_app/features/auth/domain/usecases/forgot_password_usecase.dart';
import 'package:home_services_app/features/auth/presentation/controller/cubit/forgot_password_cubit.dart';
import 'package:home_services_app/features/auth/presentation/controller/states/forgot_password_states.dart';
import 'package:home_services_app/features/service_request/presentation/controller/cubit/settings_cubit.dart';
import 'package:home_services_app/features/service_request/presentation/controller/states/settings_states.dart';

class ForgotPassword extends StatelessWidget {
  ForgotPassword({super.key});

  final TextEditingController emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(context) {
    return BlocListener<SettingsCubit, SettingsState>(
      listener: (BuildContext context, state) {},
      child: BlocProvider(
        create: (context) => ForgotPasswordCubit(
          ForgotPasswordUseCase(
            AuthRepositoryImpl(
              AuthRemoteDataSourceImpl(
                firebaseAuth: FirebaseAuth.instance,
                firestore: FirebaseFirestore.instance,
              ),
            ),
          ),
        ),
        child: BlocConsumer<ForgotPasswordCubit, ForgotPasswordState>(
          listener: (context, state) {
            if (state is ForgotPasswordFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                  duration: Duration(seconds: 3),
                ),
              );
            }
            if (state is ForgotPasswordSuccess) {
              emailController.clear();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("forgotPassword".tr()),
                  backgroundColor: AppColors.success,
                  behavior: SnackBarBehavior.fixed,
                ),
              );
              Navigator.pushReplacementNamed(context, Routes.loginRoute);
            }
          },
          builder: (context, state) {
            var cubit = ForgotPasswordCubit.get(context);
            var settingsCubit = SettingsCubit.get(context);
            return Scaffold(
              body: Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(AppPadding.p16.w),
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: AppMargin.m28.h),
                      child: Form(
                        key: formKey,
                        child: Column(
                          children: [
                            Text(
                              "forgotPassword".tr(),
                              style: Theme.of(context).textTheme.displayLarge!.copyWith(
                                fontSize: AppSize.s35.sp,
                              ),
                            ),
                            SizedBox(
                              height: AppSize.s14.h,
                            ),
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
                            SizedBox(
                              height: AppSize.s28.h,
                            ),
                            state is ForgotPasswordLoading
                                ? CircularProgressIndicator()
                                : ElevatedButton(
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  cubit.resetPassword(emailController.text);
                                }
                              },
                              child: Text("submit".tr()),
                            ),
                            SizedBox(
                              height: AppSize.s28.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "isUser".tr(),
                                  style: Theme.of(context).textTheme.displayLarge,
                                ),
                                GestureDetector(
                                  child: Text(
                                    "create".tr(),
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
                                    Navigator.of(context)
                                        .pushReplacementNamed(Routes.registerRoute);
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
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
