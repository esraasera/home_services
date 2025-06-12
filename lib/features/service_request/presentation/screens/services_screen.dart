import 'package:flutter/material.dart';
import 'package:home_services_app/core/utils/app_constants.dart';
import 'package:home_services_app/core/values/app_values.dart';
import 'package:home_services_app/features/service_request/presentation/widgets/service_item.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final crossAxisSpacing = screenWidth * AppSize.s0_04;
    final servicesList = AppConstants.servicesList;

    return Center(
      child: GridView.builder(
        padding: EdgeInsets.symmetric(
          vertical: screenHeight * AppPadding.p0_003,
        ),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: servicesList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: crossAxisSpacing,
          childAspectRatio: 1,
        ),
        itemBuilder: (context, index) {
          final service = servicesList[index];
          return Center(
            child: ServiceItem(
              title: service.title,
              imagePath: service.imagePath,
              onTap: () {},
            ),
          );
        },
      ),
    );

  }
}
