import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_services_app/core/theme/app_colors.dart';
import 'package:home_services_app/core/theme/styles_manager.dart';
import 'package:home_services_app/core/values/app_values.dart';
import 'package:home_services_app/features/service_request/data/models/service_details_model.dart';
import 'package:home_services_app/features/service_request/presentation/controller/cubit/service_request_cubit.dart';
import 'package:home_services_app/features/service_request/presentation/controller/states/service_request_state.dart';

class ServiceItem extends StatelessWidget {
  final ServiceDetailsModel service;
  final VoidCallback onTap;

  const ServiceItem({super.key, required this.service, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

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
              borderRadius: BorderRadius.circular(AppSize.s16),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  service.imagePath,
                  height: screenHeight * AppSize.s0_12,
                  width: screenWidth * AppSize.s0_24,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: screenHeight * AppSize.s0_01),
                Text(
                  service.titleKey.tr(),
                  style: getBoldStyle(
                    color: AppColors.black,
                    fontSize: AppSize.s14,
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
