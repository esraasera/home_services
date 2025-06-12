import 'package:flutter/material.dart';

class ServiceDetails extends StatelessWidget {
  final String title;
  final String imagePath;
  final String description;
  final List<String> services;
  final String price;
  final String duration;
  final String workingHours;

  const ServiceDetails({
    super.key,
    required this.title,
    required this.imagePath,
    required this.description,
    required this.services,
    required this.price,
    this.duration = "30 minutes - 2 hours",
    this.workingHours = "9:00 AM - 9:00 PM",
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                imagePath,
                height: screenHeight * 0.25,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              description,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 20),
            Text("Services Offered:", style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 10),
            BulletList(services),
            const SizedBox(height: 20),
            Text("Starting Price: $price", style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: 10),
            Text("Estimated Duration: $duration", style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: 10),
            Text("Working Hours: $workingHours", style: Theme.of(context).textTheme.bodyMedium),
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
