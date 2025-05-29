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
import 'package:home_services_app/features/auth/domain/usecases/login_usecase.dart';
import 'package:home_services_app/features/auth/presentation/controller/cubit/login_cubit.dart';
import 'package:home_services_app/features/auth/presentation/controller/states/login_states.dart';

class LoginScreen extends StatelessWidget{
  const LoginScreen({super.key});

  @override
  Widget build(context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final formKey = GlobalKey<FormState>();
    return BlocProvider(
        create: (context) => LoginCubit(LoginUseCase(
          AuthRepositoryImpl(AuthRemoteDataSourceImpl(
            firebaseAuth: FirebaseAuth.instance,
            firestore: FirebaseFirestore.instance,))
        )),
    child:BlocConsumer<LoginCubit,LoginState>(
        listener:(context,state ){
      if(state is LoginFailure){
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(state.message)),
        );
      }
      if (state is LoginSuccess) {
        // Navigator.pushReplacementNamed(context, Routes.homeRoute);
      }
    },
    builder:(context, state){
    var cubit = LoginCubit.get(context);
    return  Scaffold(
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
                              AppStrings.login,
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
                            height: AppSize.s20,
                          ),
                          TextFormField(
                              keyboardType: TextInputType.visiblePassword,
                              controller: passwordController,
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
                          state is LoginLoading
                              ? CircularProgressIndicator()
                              :  ElevatedButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                cubit.loginUser(emailController.text,passwordController.text);
      }
                              },
                            child: Text(
                              AppStrings.login,
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
                                  AppStrings.registerNow,
                                  style: getBoldStyle(color: AppColors.primary,fontSize: AppSize.s16),
                                ),
                                onTap:(){
                                  Navigator.of(context).pushReplacementNamed(Routes.registerRoute);
                                } ,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: AppSize.s14,
                          ),
                          GestureDetector(
                            child: Text(
                              AppStrings.forgotPassword,
                              style: getBoldStyle(color: AppColors.primary,fontSize:AppSize.s16),
                            ),
                            onTap:(){
                              Navigator.of(context).pushReplacementNamed(Routes.forgotPasswordRoute);
                            } ,
                          ),
                        ]),
                    ),
                  ),
                )
                ),
      ),
    );
  }
    )
    );}}