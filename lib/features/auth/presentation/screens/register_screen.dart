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
import 'package:home_services_app/features/auth/domain/usecases/register_usecase.dart';
import 'package:home_services_app/features/auth/presentation/controller/cubit/register_cubit.dart';
import 'package:home_services_app/features/auth/presentation/controller/states/register_states.dart';

class RegisterScreen extends StatelessWidget{
  RegisterScreen({super.key});
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>RegisterCubit(
          RegisterUseCase(
              AuthRepositoryImpl(
              AuthRemoteDataSourceImpl(
                firebaseAuth: FirebaseAuth.instance,
                firestore: FirebaseFirestore.instance,
              )
              )
          )
          ),
      child:BlocConsumer<RegisterCubit,RegisterStates>(
      listener:(context,state ){
        if(state is RegisterFailure){
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
        if (state is RegisterSuccess) {
         // Navigator.pushReplacementNamed(context, Routes.homeRoute);
        }
      },
      builder:(BuildContext context , RegisterStates state){
        var cubit = RegisterCubit.get(context);
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
        style: getBoldStyle(color: AppColors.black,fontSize: AppSize.s35),
        ),
        SizedBox(
        height: AppSize.s30,
        ),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            controller: nameController,
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
      height: AppSize.s28,
      ),
      Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      Text(
      AppStrings.alreadyUser,
      style: getBoldStyle(color: AppColors.black,fontSize:AppSize.s16),
      ),
      SizedBox(
      width: AppSize.s1_5,
      ),
      GestureDetector(
      child: Text(
      AppStrings.login,
      style: getBoldStyle(color: AppColors.primary,fontSize: AppSize.s16),
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
    ));}
}