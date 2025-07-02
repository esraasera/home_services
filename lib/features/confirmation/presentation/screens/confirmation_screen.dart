import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_services_app/core/theme/app_colors.dart';
import 'package:home_services_app/core/theme/styles_manager.dart';
import 'package:home_services_app/core/values/app_values.dart';
import 'package:home_services_app/features/service_request/presentation/controller/cubit/settings_cubit.dart';
import 'package:home_services_app/features/service_request/presentation/controller/states/settings_states.dart';

class ConfirmationScreen extends StatelessWidget {
  const ConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SettingsCubit, SettingsState>(
      listener: (context, state) {},
      builder: (context, state) {
        final cubit = SettingsCubit.get(context);
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/check-mark-icon.png",
                  width: AppSize.s216.w,
                  height: AppSize.s216.w,
                  color: cubit.isDark ? AppColors.white : AppColors.primary,
                  fit: BoxFit.contain,
                ),
                SizedBox(height: AppSize.s14.h),
                Text(
                  "successfulRequest".tr(),
                  style: getSemiBoldStyle(
                    color: cubit.isDark ? AppColors.lightPrimary : AppColors.black,
                    fontSize: AppSize.s18.sp,
                  ),
                ),
                SizedBox(height: AppSize.s20.h),
                Text(
                  "waitCall".tr(),
                  style: getSemiBoldStyle(
                    color: cubit.isDark ? AppColors.lightPrimary : AppColors.black,
                    fontSize: AppSize.s18.sp,
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
