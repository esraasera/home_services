import 'package:flutter/material.dart';
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
        elevation: AppSize.s4),

    appBarTheme: AppBarTheme(
        centerTitle: true,
        color: AppColors.primary,
        elevation: AppSize.s4,
        shadowColor: AppColors.darkGrey,
        titleTextStyle:
        getRegularStyle(fontSize: FontSize.s16, color: AppColors.white)),


    drawerTheme: DrawerThemeData(
      backgroundColor: AppColors.lightGrey,
      elevation: AppSize.s8,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(AppSize.s20),
          bottomRight: Radius.circular(AppSize.s20),
        ),
      ),
    ),

    listTileTheme: ListTileThemeData(
      contentPadding: const EdgeInsets.symmetric(horizontal: AppSize.s16),
      tileColor: AppColors.bG,
      textColor: AppColors.black,
      iconColor: AppColors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.s16),
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
          borderRadius: BorderRadius.circular(AppSize.s10),
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
        displayLarge: getBoldStyle(
            color: AppColors.black, fontSize: FontSize.s16),
        headlineLarge: getSemiBoldStyle(
            color: AppColors.black, fontSize: FontSize.s16),
        headlineMedium: getRegularStyle(
            color: AppColors.black, fontSize: FontSize.s14),
        titleMedium: getMediumStyle(
            color: AppColors.black, fontSize: FontSize.s16),
        bodyLarge: getRegularStyle(color: AppColors.black,fontSize: FontSize.s16),
        bodySmall: getRegularStyle(color: AppColors.black)),

    inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.symmetric(horizontal: AppPadding.p8, vertical: AppPadding.p16),
        filled: true,
        fillColor: AppColors.white,
        hintStyle:
        getRegularStyle(color: AppColors.darkGrey, fontSize: FontSize.s14),
        labelStyle:
        getMediumStyle(color: AppColors.darkGrey, fontSize: FontSize.s14),
        floatingLabelStyle: getMediumStyle(color: AppColors.primary, fontSize: FontSize.s14),
        errorStyle: getRegularStyle(color: AppColors.error),

        enabledBorder: OutlineInputBorder(
            borderSide:
            BorderSide(color: AppColors.darkGrey, width: AppSize.s1_5),
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

ThemeData getDarkTheme() {
  return ThemeData(
    scaffoldBackgroundColor:AppColors.darkShade,
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
      elevation: AppSize.s4,
      shadowColor: Colors.black54,
      titleTextStyle:
      getRegularStyle(fontSize: FontSize.s16, color: Colors.white),
    ),

    drawerTheme: DrawerThemeData(
      backgroundColor: AppColors.darkShade,
      elevation: AppSize.s8,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(AppSize.s20),
          bottomRight: Radius.circular(AppSize.s20),
        ),
      ),
    ),

    listTileTheme: ListTileThemeData(
      contentPadding: const EdgeInsets.symmetric(horizontal: AppSize.s16),
      tileColor: AppColors.lightGrey,
      textColor: Colors.white,
      iconColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.s16),
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
          borderRadius: BorderRadius.circular(AppSize.s10),
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
        textStyle: getMediumStyle(color: Colors.white, fontSize: FontSize.s16),
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
      displayLarge:
      getSemiBoldStyle(color: AppColors.white, fontSize: FontSize.s16),
      headlineLarge:
      getSemiBoldStyle(color: AppColors.white, fontSize: FontSize.s16),
      headlineMedium:
      getRegularStyle(color: AppColors.white, fontSize: FontSize.s14),
      titleMedium:
      getMediumStyle(color: AppColors.white, fontSize: FontSize.s16),
      bodyLarge:
      getRegularStyle(color: AppColors.white, fontSize: FontSize.s16),
      bodySmall:
      getRegularStyle(color: AppColors.white, fontSize: FontSize.s14),
    ),

    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.symmetric(
          horizontal: AppPadding.p8, vertical: AppPadding.p16),
      filled: true,
      fillColor: AppColors.black,
      hintStyle:
      getRegularStyle(color: AppColors.white, fontSize: FontSize.s14),
      labelStyle:
      getMediumStyle(color: AppColors.white, fontSize: FontSize.s14),
      floatingLabelStyle:
      getMediumStyle(color:  AppColors.white, fontSize: FontSize.s14),
      errorStyle: getRegularStyle(color: AppColors.error),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color:  AppColors.white, width: AppSize.s1_5),
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.white, width: AppSize.s1_5),
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.error, width: AppSize.s1_5),
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.white, width: AppSize.s1_5),
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
      ),
    ),

    textSelectionTheme: TextSelectionThemeData(
      cursorColor: AppColors.white,
      selectionColor: AppColors.white,
      selectionHandleColor: AppColors.white,
    ),
  );
}
