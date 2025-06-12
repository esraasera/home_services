import 'package:flutter/material.dart';
import 'package:home_services_app/core/theme/app_colors.dart';
import 'package:home_services_app/core/theme/app_text_style.dart';
import 'package:home_services_app/core/theme/styles_manager.dart';
import 'package:home_services_app/features/service_request/data/models/service_details_model.dart';

class ServiceDetailsScreen extends StatelessWidget {
  final ServiceDetailsModel service;

  const ServiceDetailsScreen({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {Navigator.pop(context);},
            child: Icon(Icons.arrow_back_ios_new_outlined,color: AppColors.white,)),
          title: Text(service.title,style: getBoldStyle(color: AppColors.white,fontSize: FontSize.s18),)
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Image.asset(service.imagePath, height: 200)),
            const SizedBox(height: 20),
            Text(
              service.description,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            Text("Services Offered:", style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 5),
            ...service.features.map((f) => Text("• $f")),
            const SizedBox(height: 10),
            Text("Starting Price: ${service.startingPrice}"),
            Text("Estimated Duration: ${service.estimatedDuration}"),
            Text("Working Hours: ${service.workingHours}"),
          ],
        ),
      ),
    );
  }
}