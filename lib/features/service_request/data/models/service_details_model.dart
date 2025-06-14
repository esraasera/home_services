class ServiceDetailsModel {
  final String title;
  final String subTitle;
  final String imagePath;
  final String description;
  final List<String> features;
  final String startingPrice;
  final String estimatedDuration;
  final String workingHours;

  ServiceDetailsModel({
    required this.title,
    required this. subTitle,
    required this.imagePath,
    required this.description,
    required this.features,
    required this.startingPrice,
    required this.estimatedDuration,
    required this.workingHours,
  });
}