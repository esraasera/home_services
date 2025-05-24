import 'package:flutter/material.dart';
import 'package:home_services_app/core/theme/app_colors.dart';
import 'package:home_services_app/core/theme/app_text_style.dart';
import 'package:home_services_app/core/theme/styles_manager.dart';
import 'package:home_services_app/core/values/app_values.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    primaryColor: AppColors.primary,
    disabledColor: AppColors.lightGrey,
    splashColor: AppColors.lightPrimary,

    cardTheme: CardTheme(
        color: AppColors.white,
        shadowColor: AppColors.grey,
        elevation: AppSize.s1),

    appBarTheme: AppBarTheme(
        centerTitle: true,
        color: AppColors.primary,
        elevation: AppSize.s4,
        shadowColor: AppColors.grey,
        titleTextStyle:
        getRegularStyle(fontSize: FontSize.s16, color: AppColors.white)),

    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: AppColors.primary,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.white,
        textStyle: getMediumStyle(color: AppColors.white, fontSize: FontSize.s16),
        minimumSize: Size(double.infinity, AppSize.s50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s10),
        ),
        elevation: AppSize.s4,
      ),
    ),

    snackBarTheme: SnackBarThemeData(
      backgroundColor: AppColors.error,
      contentTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 16,
      ),
      behavior: SnackBarBehavior.fixed,
    ),


    textTheme: TextTheme(
        displayLarge: getSemiBoldStyle(
            color: AppColors.grey, fontSize: FontSize.s16),
        headlineLarge: getSemiBoldStyle(
            color: AppColors.grey, fontSize: FontSize.s16),
        headlineMedium: getRegularStyle(
            color: AppColors.grey, fontSize: FontSize.s14),
        titleMedium: getMediumStyle(
            color: AppColors.primary, fontSize: FontSize.s16),
        bodyLarge: getRegularStyle(color: AppColors.black,fontSize: FontSize.s16),
        bodySmall: getRegularStyle(color: AppColors.grey)),

    inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.symmetric(horizontal: AppPadding.p8, vertical: AppPadding.p16),
        filled: true,
        fillColor: AppColors.lightGrey,
        hintStyle:
        getRegularStyle(color: AppColors.grey, fontSize: FontSize.s14),
        labelStyle:
        getMediumStyle(color: AppColors.grey, fontSize: FontSize.s14),
        floatingLabelStyle: getMediumStyle(color: AppColors.primary, fontSize: FontSize.s14),
        errorStyle: getRegularStyle(color: AppColors.error),

        enabledBorder: OutlineInputBorder(
            borderSide:
            BorderSide(color: AppColors.grey, width: AppSize.s1_5),
            borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),

        focusedBorder: OutlineInputBorder(
            borderSide:
            BorderSide(color: AppColors.primary, width: AppSize.s1_5),
            borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),

        errorBorder: OutlineInputBorder(
            borderSide:
            BorderSide(color: AppColors.error, width: AppSize.s1_5),
            borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),
        focusedErrorBorder: OutlineInputBorder(
            borderSide:
            BorderSide(color: AppColors.primary, width: AppSize.s1_5),
            borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)))),

         textSelectionTheme: TextSelectionThemeData(
         cursorColor: AppColors.primary,
         selectionColor: AppColors.primary.withValues(alpha: 0.3),
         selectionHandleColor: AppColors.primary,
       ),);
}