import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_services_app/core/theme/app_colors.dart';
import 'package:home_services_app/core/theme/styles_manager.dart';
import 'package:home_services_app/features/service_request/data/models/service_details_model.dart';
import 'package:home_services_app/features/service_request/presentation/controller/cubit/service_request_cubit.dart';
import 'package:home_services_app/features/service_request/presentation/controller/cubit/settings_cubit.dart';
import 'package:home_services_app/features/service_request/presentation/controller/states/settings_states.dart';

class ServiceDetailsScreen extends StatelessWidget {
  final ServiceDetailsModel service;

  const ServiceDetailsScreen({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SettingsCubit, SettingsState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = ServiceRequestCubit.get(context);
        var settingsCubit = SettingsCubit.get(context);

        return Scaffold(
          appBar: AppBar(
            leading: InkWell(
              onTap: () => Navigator.pop(context),
              child: Icon(Icons.arrow_back_ios_new_outlined, color: AppColors.white),
            ),
            title: Text(
              service.subTitleKey.tr(),
              style: getBoldStyle(color: AppColors.white, fontSize: 18.sp),
            ),
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.all(12.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Padding(
                    padding: EdgeInsets.all(8.w),
                    child: Image.asset(
                      service.imagePath,
                      height: 200.h,
                      color: settingsCubit.isDark ? AppColors.white : AppColors.black,
                    ),
                  ),
                ),
                SizedBox(height: 16.h),
                Text(
                  service.descriptionKey.tr(),
                  style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 18.sp),
                ),
                SizedBox(height: 20.h),
                Text(
                  "serviceOffered".tr(),
                  style: getBoldStyle(
                    color: settingsCubit.isDark ? AppColors.lightPrimary : AppColors.primary,
                    fontSize: 18.sp,
                  ),
                ),
                SizedBox(height: 12.h),
                ...service.featureKeys.map(
                      (key) => Padding(
                    padding: EdgeInsets.only(bottom: 4.h),
                    child: Text(
                      "• ${key.tr()}",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 17.sp),
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                Row(
                  children: [
                    Text(
                      "${"price".tr()} ",
                      style: getBoldStyle(
                        color: settingsCubit.isDark ? AppColors.lightPrimary : AppColors.primary,
                        fontSize: 16.sp,
                      ),
                    ),
                    Text(
                      " ${service.priceKey.tr()} ",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 17.sp),
                    ),
                    Text(
                      "egp".tr(),
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 17.sp),
                    ),
                  ],
                ),
                SizedBox(height: 16.h),
                Row(
                  children: [
                    Text(
                      "${"duration".tr()} ",
                      style: getBoldStyle(
                        color: settingsCubit.isDark ? AppColors.lightPrimary : AppColors.primary,
                        fontSize: 16.sp,
                      ),
                    ),
                    Text(
                      service.estimatedDurationKey.tr(),
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 17.sp),
                    ),
                  ],
                ),
                SizedBox(height: 16.h),
                Row(
                  children: [
                    Text(
                      "${"workingHours".tr()} ",
                      style: getBoldStyle(
                        color: settingsCubit.isDark ? AppColors.lightPrimary : AppColors.primary,
                        fontSize: 16.sp,
                      ),
                    ),
                    Text(
                      service.workingHoursKey.tr(),
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 17.sp),
                    ),
                  ],
                ),
                SizedBox(height: 40.h),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(200.w, 50.h),
                    ),
                    onPressed: () {
                      cubit.setServiceData(
                        titleKey: service.titleKey,
                        priceKey: service.priceKey,
                        priceValue: service.priceValue,
                      );
                      cubit.isSelectedService(name: service.titleKey);
                      Navigator.pop(context);
                    },
                    child: Text("bookNow".tr()),
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
