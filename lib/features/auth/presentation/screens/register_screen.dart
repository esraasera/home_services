import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_services_app/core/routing/app_routes.dart';
import 'package:home_services_app/core/theme/app_colors.dart';
import 'package:home_services_app/core/utils/app_strings.dart';
import 'package:home_services_app/core/values/app_values.dart';
import 'package:home_services_app/features/auth/data/datasource/auth_remote_datasource.dart';
import 'package:home_services_app/features/auth/data/repository/auth_repository.dart';
import 'package:home_services_app/features/auth/domain/usecases/register_usecase.dart';
import 'package:home_services_app/features/auth/presentation/controller/cubit/register_cubit.dart';
import 'package:home_services_app/features/auth/presentation/controller/states/register_states.dart';
import 'package:home_services_app/features/service_request/presentation/controller/cubit/settings_cubit.dart';
import 'package:home_services_app/features/service_request/presentation/controller/states/settings_states.dart';

class RegisterScreen extends StatelessWidget{
   RegisterScreen({super.key});
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
   final formKey = GlobalKey<FormState>();
  @override
  Widget build(context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return BlocListener<SettingsCubit,SettingsState>(
      listener: (BuildContext context,state) {  },
      child: BlocProvider(
        create: (context) =>RegisterCubit(
            RegisterUseCase(
                AuthRepositoryImpl(
                AuthRemoteDataSourceImpl(
                  firebaseAuth: FirebaseAuth.instance,
                  firestore: FirebaseFirestore.instance,
                )
                )
            )
            ),
        child:BlocConsumer<RegisterCubit,RegisterState>(
        listener:(context,state ){
          if(state is RegisterFailure){
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message),duration: Duration(seconds: 3),),
            );
          }
          if (state is RegisterSuccess) {
            Navigator.pushReplacementNamed(context, Routes.stepperRoute);
          }
        },
        builder:(BuildContext context , RegisterState state){
          var cubit = RegisterCubit.get(context);
          var settingsCubit = SettingsCubit.get(context);
          return Scaffold(
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
              controller: nameController,
              style: TextStyle(color: settingsCubit.isDark ? AppColors.white : AppColors.black),
              decoration: InputDecoration(
                hintText: AppStrings.username,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return AppStrings.usernameError;
                }
                return null;
              },),
            SizedBox(
              height:screenHeight * AppSize.s0_02,
            ),
        TextFormField(
        keyboardType: TextInputType.emailAddress,
        controller: emailController,
          style: TextStyle(color: settingsCubit.isDark ? AppColors.white : AppColors.black),
          decoration: InputDecoration(
        hintText: AppStrings.email,
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
          style: TextStyle(color: settingsCubit.isDark ? AppColors.white : AppColors.black),
          obscureText: cubit.showPassword,
        decoration: InputDecoration(
        hintText: AppStrings.password,
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
         state is RegisterLoading
         ? CircularProgressIndicator()
         : ElevatedButton(
        onPressed: () {
        if (formKey.currentState!.validate()) {
          cubit.registerUser(emailController.text,nameController.text,passwordController.text);
        }
        },
        child: Text(
        AppStrings.register,
        ),
        ),
        SizedBox(
          height:screenHeight * AppSize.s0_028,
        ),
        Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Text(
        AppStrings.alreadyUser,
          style: Theme.of(context).textTheme.displayLarge,
        ),
        GestureDetector(
        child: Text(
        AppStrings.login,
          style: Theme.of(context).textTheme.displayLarge!.copyWith(
              color: settingsCubit.isDark ? AppColors.lightPrimary : AppColors.primary
          ),
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
        },
      )),
    );}
}