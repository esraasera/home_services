import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_services_app/core/routing/app_routes.dart';
import 'package:home_services_app/core/theme/app_colors.dart';
import 'package:home_services_app/core/theme/styles_manager.dart';
import 'package:home_services_app/core/utils/app_strings.dart';
import 'package:home_services_app/core/values/app_values.dart';
import 'package:home_services_app/features/auth/data/datasource/auth_remote_datasource.dart';
import 'package:home_services_app/features/auth/data/repository/auth_repository.dart';
import 'package:home_services_app/features/auth/domain/usecases/login_usecase.dart';
import 'package:home_services_app/features/auth/presentation/controller/cubit/login_cubit.dart';
import 'package:home_services_app/features/auth/presentation/controller/states/login_states.dart';

class LoginScreen extends StatelessWidget{
  LoginScreen({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
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
        Navigator.pushReplacementNamed(context, Routes.stepperRoute);
      }
    },
    builder:(context, state){
    var cubit = LoginCubit.get(context);
    return  Scaffold(
          body: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(screenHeight *AppPadding.p0_02),
                child: Container(
                  margin: EdgeInsets.symmetric(vertical:screenHeight * AppMargin.m0_04),
                  child: Form(
                    key:formKey,
                    child: Column(
                      children: [
                        SizedBox(
                          width:screenWidth * AppSize.s0_8,
                          height: screenHeight * AppSize.s0_35,
                          child: Image.asset(
                              "assets/images/auth_image.png",
                              fit: BoxFit.contain,
                          ),
                        ),
                        SizedBox(
                          height:screenHeight * AppSize.s0_005,
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
                          height: screenHeight * AppSize.s0_02,
                        ),
                        TextFormField(
                            keyboardType: TextInputType.visiblePassword,
                            controller: passwordController,
                          obscureText: cubit.showPassword,
                            decoration: InputDecoration(
                                hintText: AppStrings.password,
                                labelText: AppStrings.password,
                                suffixIcon: IconButton(
                                    icon:Icon(
                                        cubit.showPassword ? Icons.visibility_off : Icons.visibility,
                                       color: cubit.showPassword ? AppColors.grey : AppColors.primary,
                                    ),
                                    onPressed:(){
                                      cubit.changeSuffixIcon();
                                      } ,
                                ),
                            ),
                            validator: (value) {
                           if (value == null || value.isEmpty) {
                           return AppStrings.passwordError;
                           }
                          return null;
                      },),
                        SizedBox(
                          height:screenHeight * AppSize.s0_04,
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
                          height:screenHeight * AppSize.s0_028,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              AppStrings.isUser,
                             style: getBoldStyle(color: AppColors.black,fontSize:AppSize.s16),
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
                          height: screenHeight * AppSize.s0_02,
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
              ),
            ),
      ),
    );
  }
    )
    );}}