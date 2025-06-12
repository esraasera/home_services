class ServiceDetailsModel {
  final String title;
  final String description;
  final double price;
  final List<String> availableTimes;
  final bool isAvailable;
  final String duration;
  final String imagePath;

  const ServiceDetailsModel({
    required this.title,
    required this.description,
    required this.price,
    required this.availableTimes,
    required this.isAvailable,
    required this.duration,
    required this.imagePath,
  });
}
