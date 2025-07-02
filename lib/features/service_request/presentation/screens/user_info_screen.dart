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

class UserInfoScreen extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController numberController;
  final TextEditingController addressController;

  const UserInfoScreen({
    super.key,
    required this.formKey,
    required this.nameController,
    required this.numberController,
    required this.addressController,
  });

  @override
  Widget build(BuildContext context) {
    var settingsCubit = SettingsCubit.get(context);

    return BlocListener<SettingsCubit, SettingsState>(
      listener: (context, state) {},
      child: Form(
        key: formKey,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "addYourName".tr(),
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: AppSize.s14),
                ),
                SizedBox(height: AppSize.s0_005.sh),
                TextFormField(
                  keyboardType: TextInputType.name,
                  controller: nameController,
                  style: TextStyle(
                    color: settingsCubit.isDark ? AppColors.white : AppColors.black,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "nameError".tr();
                    }
                    return null;
                  },
                ),
                SizedBox(height: AppSize.s0_03.sh),
                Text(
                  "addYourNumber".tr(),
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: AppSize.s14),
                ),
                SizedBox(height: AppSize.s0_005.sh),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: numberController,
                  style: TextStyle(
                    color: settingsCubit.isDark ? AppColors.white : AppColors.black,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "numError".tr();
                    }
                    return null;
                  },
                ),
                SizedBox(height: AppSize.s0_03.sh),
                Text(
                  "addYourAddress".tr(),
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: AppSize.s14),
                ),
                SizedBox(height: AppSize.s0_005.sh),
                TextFormField(
                  keyboardType: TextInputType.text,
                  controller: addressController,
                  style: TextStyle(
                    color: settingsCubit.isDark ? AppColors.white : AppColors.black,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "addressError".tr();
                    }
                    return null;
                  },
                ),
                SizedBox(height: AppSize.s0_001.sh),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: AppSize.s12.h),
                  child: GestureDetector(
                    onTap: () async {
                      final selectedAddress = await Navigator.of(context).pushNamed(Routes.mapRoute);
                      if (selectedAddress != null && selectedAddress is String) {
                        addressController.text = selectedAddress;
                      }
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(AppSize.s20),
                      child: Stack(
                        children: [
                          Image.asset(
                            "assets/images/map_image.png",
                            height: AppSize.s0_16.sh,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                          Positioned(
                            bottom: AppSize.s8.h,
                            right: AppSize.s10.w,
                            child: Container(
                              padding: EdgeInsets.all(AppSize.s4.w),
                              decoration: BoxDecoration(
                                color: AppColors.black,
                                borderRadius: BorderRadius.circular(AppSize.s20),
                              ),
                              child: Row(
                                children: [
                                  Icon(Icons.location_on, color: AppColors.white, size: AppSize.s15),
                                  SizedBox(width: AppSize.s0_008.sw),
                                  Text(
                                    "selectLocation".tr(),
                                    style: getMediumStyle(
                                      color: AppColors.white,
                                      fontSize: AppSize.s12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
