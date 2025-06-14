import 'package:flutter/material.dart';
import 'package:home_services_app/core/utils/static_services.dart';
import 'package:home_services_app/core/values/app_values.dart';
import 'package:home_services_app/features/service_request/presentation/widgets/service_details.dart';
import 'package:home_services_app/features/service_request/presentation/widgets/service_item.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: screenHeight * AppPadding.p0_03,
          crossAxisSpacing: screenWidth * AppPadding.p0_03,
          childAspectRatio: AppSize.s1_13 ,
        ),
        itemCount: servicesList.length,
        itemBuilder: (context, index) {
          final service = servicesList[index];
          return ServiceItem(
            title: service.title,
            subTitle: service.subTitle,
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