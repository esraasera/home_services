import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_services_app/core/theme/app_colors.dart';
import 'package:home_services_app/core/theme/styles_manager.dart';
import 'package:home_services_app/core/values/app_values.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    scaffoldBackgroundColor: AppColors.lightGrey,
    primaryColor: AppColors.primary,
    disabledColor: AppColors.lightGrey,
    splashColor: AppColors.lightPrimary,

    cardTheme: CardTheme(
        color: AppColors.white,
        shadowColor: AppColors.darkGrey,
        elevation: AppSize.s4.h),

    appBarTheme: AppBarTheme(
        centerTitle: true,
        color: AppColors.primary,
        elevation: AppSize.s4.h,
        shadowColor: AppColors.darkGrey,
        titleTextStyle:
        getRegularStyle(fontSize: AppSize.s16.sp, color: AppColors.white)),

    drawerTheme: DrawerThemeData(
      backgroundColor: AppColors.lightGrey,
      elevation: AppSize.s8.h,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(AppSize.s20.r),
          bottomRight: Radius.circular(AppSize.s20.r),
        ),
      ),
    ),

    listTileTheme: ListTileThemeData(
      contentPadding: EdgeInsets.symmetric(horizontal: AppSize.s16.w),
      tileColor: AppColors.bG,
      textColor: AppColors.black,
      iconColor: AppColors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.s16.r),
      ),
    ),
    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.all(AppColors.primary),
      trackColor: WidgetStateProperty.all(AppColors.lightGrey),
    ),
    dropdownMenuTheme: DropdownMenuThemeData(
      menuStyle: MenuStyle(
        backgroundColor: WidgetStateProperty.all(AppColors.bG),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.lightGrey,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSize.s10.r),
        ),
      ),
    ),

    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: AppColors.primary,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.white,
        textStyle: getMediumStyle(color: AppColors.white, fontSize: AppSize.s16.sp),
        minimumSize: Size(double.infinity, AppSize.s50.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s10.r),
        ),
        elevation: AppSize.s4.h,
      ),
    ),

    snackBarTheme: SnackBarThemeData(
      backgroundColor: AppColors.error,
      contentTextStyle: TextStyle(
        color: Colors.white,
        fontSize: AppSize.s16.sp,
      ),
      behavior: SnackBarBehavior.fixed,
    ),

    textTheme: TextTheme(
        displayLarge: getBoldStyle(color: AppColors.black, fontSize: AppSize.s16.sp),
        headlineLarge: getSemiBoldStyle(color: AppColors.black, fontSize: AppSize.s16.sp),
        headlineMedium: getRegularStyle(color: AppColors.black, fontSize: AppSize.s14.sp),
        titleMedium: getMediumStyle(color: AppColors.black, fontSize: AppSize.s16.sp),
        bodyLarge: getRegularStyle(color: AppColors.black, fontSize: AppSize.s16.sp),
        bodySmall: getRegularStyle(color: AppColors.black, fontSize: AppSize.s14.sp)),

    inputDecorationTheme: InputDecorationTheme(
        contentPadding: EdgeInsets.symmetric(horizontal: AppPadding.p8.w, vertical: AppPadding.p16.h),
        filled: true,
        fillColor: AppColors.white,
        hintStyle: getRegularStyle(color: AppColors.darkGrey, fontSize: AppSize.s14.sp),
        labelStyle: getMediumStyle(color: AppColors.darkGrey, fontSize: AppSize.s14.sp),
        floatingLabelStyle:
        getMediumStyle(color: AppColors.primary, fontSize: AppSize.s14.sp),
        errorStyle: getRegularStyle(color: AppColors.error),
        enabledBorder: OutlineInputBorder(
            borderSide:
            BorderSide(color: AppColors.darkGrey, width: AppSize.s1_5.w),
            borderRadius: BorderRadius.all(Radius.circular(AppSize.s8.r))),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.primary, width: AppSize.s1_5.w),
            borderRadius: BorderRadius.all(Radius.circular(AppSize.s8.r))),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.error, width: AppSize.s1_5.w),
            borderRadius: BorderRadius.all(Radius.circular(AppSize.s8.r))),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.primary, width: AppSize.s1_5.w),
            borderRadius: BorderRadius.all(Radius.circular(AppSize.s8.r)))),

    textSelectionTheme: TextSelectionThemeData(
      cursorColor: AppColors.primary,
      selectionColor: AppColors.primary,
      selectionHandleColor: AppColors.primary,
    ),
  );
}

ThemeData getDarkTheme() {
  return ThemeData(
    scaffoldBackgroundColor: AppColors.darkShade,
    primaryColor: AppColors.primary,
    disabledColor: AppColors.lightGrey,
    splashColor: AppColors.lightGrey,

    cardTheme: CardTheme(
      color: Colors.grey.shade900,
      shadowColor: Colors.black54,
    ),

    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: AppColors.primary,
      elevation: AppSize.s4.h,
      shadowColor: Colors.black54,
      titleTextStyle: getRegularStyle(fontSize: AppSize.s16.sp, color: Colors.white),
    ),

    drawerTheme: DrawerThemeData(
      backgroundColor: AppColors.darkShade,
      elevation: AppSize.s8.h,
      shape:  RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(AppSize.s20.r),
          bottomRight: Radius.circular(AppSize.s20.r),
        ),
      ),
    ),

    listTileTheme: ListTileThemeData(
      contentPadding: EdgeInsets.symmetric(horizontal: AppSize.s16.w),
      tileColor: AppColors.lightGrey,
      textColor: Colors.white,
      iconColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.s16.r),
      ),
    ),

    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.all(AppColors.grey),
      trackColor: WidgetStateProperty.all(AppColors.grey),
    ),

    dropdownMenuTheme: DropdownMenuThemeData(
      menuStyle: MenuStyle(
        backgroundColor: WidgetStateProperty.all(AppColors.lightGrey),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.lightGrey,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSize.s10.r),
        ),
      ),
    ),

    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: AppColors.lightPrimary,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        textStyle: getMediumStyle(color: Colors.white, fontSize: AppSize.s16.sp),
        minimumSize: Size(double.infinity, AppSize.s50.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s10.r),
        ),
        elevation: AppSize.s4.h,
      ),
    ),

    snackBarTheme: SnackBarThemeData(
      backgroundColor: AppColors.error,
      contentTextStyle: TextStyle(
        color: Colors.white,
        fontSize: AppSize.s16.sp,
      ),
      behavior: SnackBarBehavior.fixed,
    ),

    textTheme: TextTheme(
      displayLarge: getSemiBoldStyle(color: AppColors.white, fontSize: AppSize.s16.sp),
      headlineLarge: getSemiBoldStyle(color: AppColors.white, fontSize: AppSize.s16.sp),
      headlineMedium: getRegularStyle(color: AppColors.white, fontSize: AppSize.s14.sp),
      titleMedium: getMediumStyle(color: AppColors.white, fontSize: AppSize.s16.sp),
      bodyLarge: getRegularStyle(color: AppColors.white, fontSize: AppSize.s16.sp),
      bodySmall: getRegularStyle(color: AppColors.white, fontSize: AppSize.s14.sp),
    ),

    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.symmetric(horizontal: AppPadding.p8.w, vertical: AppPadding.p16.h),
      filled: true,
      fillColor: AppColors.black,
      hintStyle: getRegularStyle(color: AppColors.white, fontSize: AppSize.s14.sp),
      labelStyle: getMediumStyle(color: AppColors.white, fontSize: AppSize.s14.sp),
      floatingLabelStyle: getMediumStyle(color: AppColors.white, fontSize: AppSize.s14.sp),
      errorStyle: getRegularStyle(color: AppColors.error),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.white, width: AppSize.s1_5.w),
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s8.r)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.white, width: AppSize.s1_5.w),
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s8.r)),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.error, width: AppSize.s1_5.w),
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s8.r)),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.white, width: AppSize.s1_5.w),
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s8.r)),
      ),
    ),

    textSelectionTheme: TextSelectionThemeData(
      cursorColor: AppColors.white,
      selectionColor: AppColors.white,
      selectionHandleColor: AppColors.white,
    ),
  );
}
