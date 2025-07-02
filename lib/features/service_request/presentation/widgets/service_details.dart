import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_services_app/core/theme/app_colors.dart';
import 'package:home_services_app/core/theme/styles_manager.dart';
import 'package:home_services_app/core/values/app_values.dart';
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
            padding: EdgeInsets.all(AppPadding.p0_04.sw),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Padding(
                    padding: EdgeInsets.all(AppPadding.p0_022.sw),
                    child: Image.asset(
                      service.imagePath,
                      height: AppSize.s0_25.sh,
                      color: settingsCubit.isDark ? AppColors.white : AppColors.black,
                    ),
                  ),
                ),
                SizedBox(height: AppSize.s0_02.sh),
                Text(
                  service.descriptionKey.tr(),
                  style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 18.sp),
                ),
                SizedBox(height: AppSize.s0_028.sh),
                Text(
                  "serviceOffered".tr(),
                  style: getBoldStyle(
                    color: settingsCubit.isDark ? AppColors.lightPrimary : AppColors.primary,
                    fontSize: 18.sp,
                  ),
                ),
                SizedBox(height: AppSize.s0_028.sh),
                ...service.featureKeys.map(
                      (key) => Text(
                    "• ${key.tr()}",
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 17.sp),
                  ),
                ),
                SizedBox(height: AppSize.s0_028.sh),
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
                SizedBox(height: AppSize.s0_02.sh),
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
                SizedBox(height: AppSize.s0_02.sh),
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
                SizedBox(height: AppSize.s0_05.sh),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(AppSize.s1.sw, AppSize.s0_073.sh),
                    ),
                    onPressed: () {
                      cubit.setServiceData(
                        titleKey: service.titleKey,
                        priceKey: service.priceKey,
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
