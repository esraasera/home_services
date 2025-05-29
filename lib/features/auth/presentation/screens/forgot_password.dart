import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_services_app/core/routing/app_routes.dart';
import 'package:home_services_app/core/theme/app_colors.dart';
import 'package:home_services_app/core/theme/styles_manager.dart';
import 'package:home_services_app/core/utils/app_string.dart';
import 'package:home_services_app/core/values/app_values.dart';
import 'package:home_services_app/features/auth/data/datasource/auth_remote_datasource.dart';
import 'package:home_services_app/features/auth/data/repository/auth_repository.dart';
import 'package:home_services_app/features/auth/domain/usecases/forgot_password_usecase.dart';
import 'package:home_services_app/features/auth/presentation/controller/cubit/forgot_password_cubit.dart';
import 'package:home_services_app/features/auth/presentation/controller/states/forgot_password_states.dart';

class ForgotPassword extends StatelessWidget{
  const ForgotPassword({super.key});

  @override
  Widget build(context) {
    final TextEditingController emailController = TextEditingController();
    final formKey = GlobalKey<FormState>();
    return BlocProvider(
      create: (context) => ForgotPasswordCubit(ForgotPasswordUseCase(
          AuthRepositoryImpl
            (AuthRemoteDataSourceImpl(
              firebaseAuth: FirebaseAuth.instance,
              firestore: FirebaseFirestore.instance,
          ))
      )),
      child: BlocConsumer<ForgotPasswordCubit,ForgotPasswordState>(
        listener: (context,state) {
          if (state is ForgotPasswordFailure){
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
          if (state is ForgotPasswordSuccess){
            emailController.clear();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(AppStrings.done),
                backgroundColor:AppColors.success,
                behavior: SnackBarBehavior.fixed,
              ),
            );
            // Navigator.pushReplacementNamed(context, Routes.homeRoute);
          }
        },
        builder: (context,state) {
          var cubit = ForgotPasswordCubit.get(context);
          return Scaffold(
              backgroundColor: AppColors.white,
              body: Center(
                child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(AppPadding.p12),
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: AppMargin.m40),
                        child: Form(
                          key:formKey,
                          child: Column(
                              children: [
                                Text(
                                  AppStrings.forgotPassword,
                                  style: getBoldStyle(color: AppColors.black,fontSize: AppSize.s35),
                                ),
                                SizedBox(
                                  height: AppSize.s30,
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
                                  height: AppSize.s40,
                                ),
                                state is ForgotPasswordLoading
                                    ? CircularProgressIndicator()
                                    : ElevatedButton(
                                  onPressed: () {
                                    if (formKey.currentState!.validate()){
                                      cubit.resetPassword(emailController.text);
                                    }
                                  },
                                  child: Text(
                                    AppStrings.submit,
                                  ),
                                ),
                                SizedBox(
                                  height: AppSize.s28,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      AppStrings.isUser,
                                      style: getBoldStyle(color: AppColors.black,fontSize:AppSize.s16),
                                    ),
                                    SizedBox(
                                      width: AppSize.s1_5,
                                    ),
                                    GestureDetector(
                                      child: Text(
                                        AppStrings.create,
                                        style: getBoldStyle(color: AppColors.primary,fontSize: AppSize.s16),
                                      ),
                                      onTap:(){
                                        Navigator.of(context).pushReplacementNamed(Routes.registerRoute);
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
        },
      ),
    );
  }

}