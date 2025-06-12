import 'package:flutter/material.dart';
import 'package:home_services_app/core/utils/static_services.dart';
import 'package:home_services_app/core/values/app_values.dart';
import 'package:home_services_app/features/service_request/presentation/widgets/service_details.dart';
import 'package:home_services_app/features/service_request/presentation/widgets/service_item.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return GridView.builder(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(
          vertical: screenWidth * AppPadding.p0_02,
        ),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: screenHeight * AppPadding.p0_03,
          crossAxisSpacing: screenHeight * AppPadding.p0_03,
          childAspectRatio: 1,
        ),
        itemCount: servicesList.length,
        itemBuilder: (context, index) {
          final service = servicesList[index];
          return ServiceItem(
            title: service.title,
            imagePath: service.imagePath,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ServiceDetailsScreen(service: service),
                ),
              );
            },
          );
        },
      );
  }
}