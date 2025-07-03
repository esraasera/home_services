import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_services_app/core/routing/app_routes.dart';
import 'package:home_services_app/core/theme/app_colors.dart';
import 'package:home_services_app/core/theme/styles_manager.dart';
import 'package:home_services_app/core/values/app_values.dart';
import 'package:home_services_app/features/service_request/presentation/controller/cubit/settings_cubit.dart';
import 'package:home_services_app/features/service_request/presentation/controller/states/settings_states.dart';

class SettingsDrawer extends StatelessWidget {
  const SettingsDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SettingsCubit, SettingsState>(
      listener: (context, state) {
        if (state is SettingsLoggedOut) {
          Navigator.pushReplacementNamed(context, Routes.loginRoute);
        }
      },
      builder: (context, state) {
        var cubit = SettingsCubit.get(context);
        return SafeArea(
          child: Drawer(
            child: Column(
              children: [
                Container(
                  height: 200.h,
                  width: double.infinity,
                  color: AppColors.primary,
                  padding: EdgeInsets.symmetric(
                    vertical: 24.h,
                    horizontal: 24.w,
                  ),
                  child: Align(
                    alignment: AlignmentDirectional.bottomCenter,
                    child: Text(
                      "settings".tr(),
                      style: getBoldStyle(
                        color: AppColors.white,
                        fontSize: AppSize.s40.sp,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 24.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: SwitchListTile(
                    title: Text(
                      "darkMode".tr(),
                      style: getBoldStyle(
                        color: AppColors.black,
                        fontSize: 18.sp,
                      ),
                    ),
                    value: cubit.isDark,
                    activeColor: AppColors.primary,
                    inactiveTrackColor: AppColors.bG,
                    onChanged: (_) => cubit.toggleTheme(),
                  ),
                ),
                SizedBox(height: 24.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: ListTile(
                    title: Text(
                      "language".tr(),
                      style: getBoldStyle(
                        color: AppColors.black,
                        fontSize: 18.sp,
                      ),
                    ),
                    trailing: DecoratedBox(
                      decoration: BoxDecoration(
                        color: AppColors.lightGrey,
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12.w),
                        child: DropdownButton<String>(
                          value: cubit.currentLanguage,
                          dropdownColor: cubit.isDark ? AppColors.lightGrey : AppColors.bG,
                          underline: const SizedBox(),
                          items: [
                            DropdownMenuItem(
                              value: "ar".tr(),
                              child: Text(
                                "arabic".tr(),
                                style: TextStyle(color: AppColors.black),
                              ),
                            ),
                            DropdownMenuItem(
                              value: "en".tr(),
                              child: Text(
                                "english".tr(),
                                style: TextStyle(color: AppColors.black),
                              ),
                            ),
                          ],
                          onChanged: (value) {
                            if (value != null) {
                              cubit.changeLanguage(value, context);
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 24.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: ListTile(
                    leading: Icon(Icons.logout, color: AppColors.black),
                    title: Text(
                      "logOut".tr(),
                      style: getBoldStyle(
                        color: AppColors.black,
                        fontSize: 18.sp,
                      ),
                    ),
                    onTap: () => cubit.logout(),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
