class ServiceModel {
  final String title;
  final String imagePath;
  final String description;
  final List<String> services;
  final String price;
  final String duration;
  final String workingHours;

  const ServiceModel({
    required this.title,
    required this.imagePath,
    required this.description,
    required this.services,
    required this.price,
    this.duration = "30 minutes - 2 hours",
    this.workingHours = "9:00 AM - 9:00 PM",
  });
}
