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

    return LayoutBuilder(
      builder: (context, constraints) {
        double itemHeight = (constraints.maxHeight) / 3.2;
        double itemWidth = constraints.maxWidth / 2;

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: servicesList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: AppSize.s12.h,
            crossAxisSpacing: AppSize.s12.w,
            childAspectRatio: itemWidth / itemHeight,
          ),
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
      },
    );
  }
}

