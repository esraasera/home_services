import 'package:home_services_app/features/service_request/data/models/service_details_model.dart';

List<ServiceDetailsModel> getLocalizedServicesList() {
  return [
    ServiceDetailsModel(
      titleKey: 'services.plumbing.title',
      subTitleKey: 'services.plumbing.subTitle',
      imagePath: 'assets/images/plumbing_icon.png',
      descriptionKey: 'services.plumbing.description',
      featureKeys: [
        'services.plumbing.features.0',
        'services.plumbing.features.1',
        'services.plumbing.features.2',
      ],
      priceKey: 'services.plumbing.price',
      estimatedDurationKey: 'services.plumbing.estimatedDuration',
      workingHoursKey: 'services.plumbing.workingHours',
    ),
    ServiceDetailsModel(
      titleKey: 'services.carpentry.title',
      subTitleKey: 'services.carpentry.subTitle',
      imagePath: 'assets/images/carpentry.png',
      descriptionKey: 'services.carpentry.description',
      featureKeys: [
        'services.carpentry.features.0',
        'services.carpentry.features.1',
        'services.carpentry.features.2',
      ],
      priceKey: 'services.carpentry.price',
      estimatedDurationKey: 'services.carpentry.estimatedDuration',
      workingHoursKey: 'services.carpentry.workingHours',
    ),
    ServiceDetailsModel(
      titleKey: 'services.electrical.title',
      subTitleKey: 'services.electrical.subTitle',
      imagePath: 'assets/images/electrical_icon.png',
      descriptionKey: 'services.electrical.description',
      featureKeys: [
        'services.electrical.features.0',
        'services.electrical.features.1',
        'services.electrical.features.2',
      ],
      priceKey: 'services.electrical.price',
      estimatedDurationKey: 'services.electrical.estimatedDuration',
      workingHoursKey: 'services.electrical.workingHours',
    ),
    ServiceDetailsModel(
      titleKey: 'services.painting.title',
      subTitleKey: 'services.painting.subTitle',
      imagePath: 'assets/images/painting_icon.png',
      descriptionKey: 'services.painting.description',
      featureKeys: [
        'services.painting.features.0',
        'services.painting.features.1',
        'services.painting.features.2',
      ],
      priceKey: 'services.painting.price',
      estimatedDurationKey: 'services.painting.estimatedDuration',
      workingHoursKey: 'services.painting.workingHours',
    ),
    ServiceDetailsModel(
      titleKey: 'services.pestControl.title',
      subTitleKey: 'services.pestControl.subTitle',
      imagePath: 'assets/images/Pest_control_icon.png',
      descriptionKey: 'services.pestControl.description',
      featureKeys: [
        'services.pestControl.features.0',
        'services.pestControl.features.1',
        'services.pestControl.features.2',
      ],
      priceKey: 'services.pestControl.price',
      estimatedDurationKey: 'services.pestControl.estimatedDuration',
      workingHoursKey: 'services.pestControl.workingHours',
    ),
    ServiceDetailsModel(
      titleKey: 'services.cleaning.title',
      subTitleKey: 'services.cleaning.subTitle',
      imagePath: 'assets/images/cleaning_icon.png',
      descriptionKey: 'services.cleaning.description',
      featureKeys: [
        'services.cleaning.features.0',
        'services.cleaning.features.1',
        'services.cleaning.features.2',
      ],
      priceKey: 'services.cleaning.price',
      estimatedDurationKey: 'services.cleaning.estimatedDuration',
      workingHoursKey: 'services.cleaning.workingHours',
    ),
  ];
}
