import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_services_app/core/theme/app_colors.dart';
import 'package:home_services_app/core/theme/styles_manager.dart';
import 'package:home_services_app/features/service_request/data/models/service_details_model.dart';
import 'package:home_services_app/features/service_request/presentation/controller/cubit/service_request_cubit.dart';
import 'package:home_services_app/features/service_request/presentation/controller/states/service_request_state.dart';

class ServiceItem extends StatelessWidget {
  final ServiceDetailsModel service;
  final VoidCallback onTap;

  const ServiceItem({super.key, required this.service, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ServiceRequestCubit, ServiceRequestState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = ServiceRequestCubit.get(context);

        return GestureDetector(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
              color: cubit.selectedServiceTitle == service.titleKey
                  ? AppColors.lightPrimary
                  : AppColors.bG,
              borderRadius: BorderRadius.circular(16.r),
            ),
            padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 8.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  service.imagePath,
                  height: 90.h,
                  width: 100.w,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 10.h),
                Text(
                  service.titleKey.tr(),
                  style: getBoldStyle(
                    color: AppColors.black,
                    fontSize: 16.sp,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
