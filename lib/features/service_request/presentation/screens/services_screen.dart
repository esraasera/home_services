import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_services_app/core/utils/static_services.dart';
import 'package:home_services_app/core/values/app_values.dart';
import 'package:home_services_app/features/service_request/presentation/controller/cubit/service_request_cubit.dart';
import 'package:home_services_app/features/service_request/presentation/widgets/service_details.dart';
import 'package:home_services_app/features/service_request/presentation/widgets/service_item.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final servicesList = getLocalizedServicesList();

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: AppSize.s18.h,
        crossAxisSpacing: AppSize.s18.w,
        childAspectRatio: 1.13,
      ),
      itemCount: servicesList.length,
      itemBuilder: (context, index) {
        final service = servicesList[index];
        return ServiceItem(
          service: service,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => BlocProvider.value(
                  value: ServiceRequestCubit.get(context),
                  child: ServiceDetailsScreen(service: service),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
