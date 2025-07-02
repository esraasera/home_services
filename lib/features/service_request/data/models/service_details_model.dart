class ServiceDetailsModel {
  final String titleKey;
  final String subTitleKey;
  final String imagePath;
  final String descriptionKey;
  final List<String> featureKeys;
  final String priceKey;
  final double priceValue;
  final String estimatedDurationKey;
  final String workingHoursKey;

  ServiceDetailsModel({
    required this.titleKey,
    required this.subTitleKey,
    required this.imagePath,
    required this.descriptionKey,
    required this.featureKeys,
    required this.priceKey,
    required this.priceValue,
    required this.estimatedDurationKey,
    required this.workingHoursKey,
  });
}