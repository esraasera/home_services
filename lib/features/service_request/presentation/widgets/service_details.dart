import 'package:flutter/material.dart';
import 'package:home_services_app/features/service_request/data/models/service_model.dart';

class ServiceDetails extends StatelessWidget {
  final ServiceModel service;

  const ServiceDetails({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(service.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                service.imagePath,
                height: screenHeight * 0.25,
              ),
            ),
            const SizedBox(height: 20),
            Text(service.description, style: Theme.of(context).textTheme.bodyLarge),
            const SizedBox(height: 20),
            Text("Services Offered:", style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 10),
            BulletList(service.services),
            const SizedBox(height: 20),
            Text("Starting Price: ${service.price}", style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: 10),
            Text("Estimated Duration: ${service.duration}", style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: 10),
            Text("Working Hours: ${service.workingHours}", style: Theme.of(context).textTheme.bodyMedium),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to booking or request screen
                },
                child: const Text("Book Now"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
class BulletList extends StatelessWidget {
  final List<String> items;
  const BulletList(this.items, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items
          .map(
            (item) => Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("• ", style: TextStyle(fontSize: 18)),
            Expanded(child: Text(item, style: const TextStyle(fontSize: 16))),
          ],
        ),
      )
          .toList(),
    );
  }
}