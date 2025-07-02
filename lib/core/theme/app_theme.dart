import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_services_app/core/theme/app_colors.dart';
import 'package:home_services_app/core/theme/app_text_style.dart';
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
      elevation: 4.h,
    ),

    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: AppColors.primary,
      elevation: 4.h,
      shadowColor: AppColors.darkGrey,
      titleTextStyle: getRegularStyle(
        fontSize: 16.sp,
        color: AppColors.white,
      ),
    ),

    drawerTheme: DrawerThemeData(
      backgroundColor: AppColors.lightGrey,
      elevation: 8.h,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20.r),
          bottomRight: Radius.circular(20.r),
        ),
      ),
    ),

    listTileTheme: ListTileThemeData(
      contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
      tileColor: AppColors.bG,
      textColor: AppColors.black,
      iconColor: AppColors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
      ),
    ),

    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.all(AppColors.primary),
      trackColor: MaterialStateProperty.all(AppColors.lightGrey),
    ),

    dropdownMenuTheme: DropdownMenuThemeData(
      menuStyle: MenuStyle(
        backgroundColor: MaterialStateProperty.all(AppColors.bG),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.lightGrey,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
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
        textStyle: getMediumStyle(color: AppColors.white, fontSize: 16.sp),
        minimumSize: Size(double.infinity, 50.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
        elevation: 4.h,
      ),
    ),

    snackBarTheme: SnackBarThemeData(
      backgroundColor: AppColors.error,
      contentTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 16.sp,
      ),
      behavior: SnackBarBehavior.fixed,
    ),

    textTheme: TextTheme(
      displayLarge: getBoldStyle(
        color: AppColors.black,
        fontSize: 16.sp,
      ),
      headlineLarge: getSemiBoldStyle(
        color: AppColors.black,
        fontSize: 16.sp,
      ),
      headlineMedium: getRegularStyle(
        color: AppColors.black,
        fontSize: 14.sp,
      ),
      titleMedium: getMediumStyle(
        color: AppColors.black,
        fontSize: 16.sp,
      ),
      bodyLarge: getRegularStyle(
        color: AppColors.black,
        fontSize: 16.sp,
      ),
      bodySmall: getRegularStyle(
        color: AppColors.black,
        fontSize: 14.sp,
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 16.h),
      filled: true,
      fillColor: AppColors.white,
      hintStyle: getRegularStyle(color: AppColors.darkGrey, fontSize: 14.sp),
      labelStyle: getMediumStyle(color: AppColors.darkGrey, fontSize: 14.sp),
      floatingLabelStyle: getMediumStyle(color: AppColors.primary, fontSize: 14.sp),
      errorStyle: getRegularStyle(color: AppColors.error),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.darkGrey, width: 1.5.w),
        borderRadius: BorderRadius.all(Radius.circular(8.r)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.primary, width: 1.5.w),
        borderRadius: BorderRadius.all(Radius.circular(8.r)),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.error, width: 1.5.w),
        borderRadius: BorderRadius.all(Radius.circular(8.r)),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.primary, width: 1.5.w),
        borderRadius: BorderRadius.all(Radius.circular(8.r)),
      ),
    ),

    textSelectionTheme: TextSelectionThemeData(
      cursorColor: AppColors.primary,
      selectionColor: AppColors.primary.withOpacity(0.3),
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
      elevation: 4.h,
      shadowColor: Colors.black54,
      titleTextStyle: getRegularStyle(fontSize: 16.sp, color: Colors.white),
    ),

    drawerTheme: DrawerThemeData(
      backgroundColor: AppColors.darkShade,
      elevation: 8.h,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20.r),
          bottomRight: Radius.circular(20.r),
        ),
      ),
    ),

    listTileTheme: ListTileThemeData(
      contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
      tileColor: AppColors.lightGrey,
      textColor: Colors.white,
      iconColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
      ),
    ),

    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.all(AppColors.grey),
      trackColor: MaterialStateProperty.all(AppColors.grey),
    ),

    dropdownMenuTheme: DropdownMenuThemeData(
      menuStyle: MenuStyle(
        backgroundColor: MaterialStateProperty.all(AppColors.lightGrey),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.lightGrey,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
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
        textStyle: getMediumStyle(color: Colors.white, fontSize: 16.sp),
        minimumSize: Size(double.infinity, 50.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
        elevation: 4.h,
      ),
    ),

    snackBarTheme: SnackBarThemeData(
      backgroundColor: AppColors.error,
      contentTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 16.sp,
      ),
      behavior: SnackBarBehavior.fixed,
    ),

    textTheme: TextTheme(
      displayLarge: getSemiBoldStyle(color: AppColors.white, fontSize: 16.sp),
      headlineLarge: getSemiBoldStyle(color: AppColors.white, fontSize: 16.sp),
      headlineMedium: getRegularStyle(color: AppColors.white, fontSize: 14.sp),
      titleMedium: getMediumStyle(color: AppColors.white, fontSize: 16.sp),
      bodyLarge: getRegularStyle(color: AppColors.white, fontSize: 16.sp),
      bodySmall: getRegularStyle(color: AppColors.white, fontSize: 14.sp),
    ),

    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 16.h),
      filled: true,
      fillColor: AppColors.black,
      hintStyle: getRegularStyle(color: AppColors.white, fontSize: 14.sp),
      labelStyle: getMediumStyle(color: AppColors.white, fontSize: 14.sp),
      floatingLabelStyle: getMediumStyle(color: AppColors.white, fontSize: 14.sp),
      errorStyle: getRegularStyle(color: AppColors.error),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.white, width: 1.5.w),
        borderRadius: BorderRadius.all(Radius.circular(8.r)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.white, width: 1.5.w),
        borderRadius: BorderRadius.all(Radius.circular(8.r)),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.error, width: 1.5.w),
        borderRadius: BorderRadius.all(Radius.circular(8.r)),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.white, width: 1.5.w),
        borderRadius: BorderRadius.all(Radius.circular(8.r)),
      ),
    ),

    textSelectionTheme: TextSelectionThemeData(
      cursorColor: AppColors.white,
      selectionColor: AppColors.white,
      selectionHandleColor: AppColors.white,
    ),
  );
}
