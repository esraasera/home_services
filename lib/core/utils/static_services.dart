import 'package:easy_localization/easy_localization.dart';
import 'package:home_services_app/features/service_request/data/models/service_details_model.dart';

final List<ServiceDetailsModel> servicesList = [
  ServiceDetailsModel(
    title: 'services.plumbing.title'.tr(),
    subTitle: 'services.plumbing.subTitle'.tr(),
    imagePath: 'assets/images/plumbing_icon.png',
    description: 'services.plumbing.description'.tr(),
    features: [
      'services.plumbing.features.0'.tr(),
      'services.plumbing.features.1'.tr(),
      'services.plumbing.features.2'.tr(),
    ],
    price: 'services.plumbing.price'.tr(),
    estimatedDuration: 'services.plumbing.estimatedDuration'.tr(),
    workingHours: 'services.plumbing.workingHours'.tr(),
  ),
  ServiceDetailsModel(
    title: 'services.carpentry.title'.tr(),
    subTitle: 'services.carpentry.subTitle'.tr(),
    imagePath: 'assets/images/carpentry.png',
    description: 'services.carpentry.description'.tr(),
    features: [
      'services.carpentry.features.0'.tr(),
      'services.carpentry.features.1'.tr(),
      'services.carpentry.features.2'.tr(),
    ],
    price: 'services.carpentry.price'.tr(),
    estimatedDuration: 'services.carpentry.estimatedDuration'.tr(),
    workingHours: 'services.carpentry.workingHours'.tr(),
  ),
  ServiceDetailsModel(
    title: 'services.electrical.title'.tr(),
    subTitle: 'services.electrical.subTitle'.tr(),
    imagePath: 'assets/images/electrical_icon.png',
    description: 'services.electrical.description'.tr(),
    features: [
      'services.electrical.features.0'.tr(),
      'services.electrical.features.1'.tr(),
      'services.electrical.features.2'.tr(),
    ],
    price: 'services.electrical.price'.tr(),
    estimatedDuration: 'services.electrical.estimatedDuration'.tr(),
    workingHours: 'services.electrical.workingHours'.tr(),
  ),
  ServiceDetailsModel(
    title: 'services.painting.title'.tr(),
    subTitle: 'services.painting.subTitle'.tr(),
    imagePath: 'assets/images/painting_icon.png',
    description: 'services.painting.description'.tr(),
    features: [
      'services.painting.features.0'.tr(),
      'services.painting.features.1'.tr(),
      'services.painting.features.2'.tr(),
    ],
    price: 'services.painting.price'.tr(),
    estimatedDuration: 'services.painting.estimatedDuration'.tr(),
    workingHours: 'services.painting.workingHours'.tr(),
  ),
  ServiceDetailsModel(
    title: 'services.pestControl.title'.tr(),
    subTitle: 'services.pestControl.subTitle'.tr(),
    imagePath: 'assets/images/Pest_control_icon.png',
    description: 'services.pestControl.description'.tr(),
    features: [
      'services.pestControl.features.0'.tr(),
      'services.pestControl.features.1'.tr(),
      'services.pestControl.features.2'.tr(),
    ],
    price: 'services.pestControl.price'.tr(),
    estimatedDuration: 'services.pestControl.estimatedDuration'.tr(),
    workingHours: 'services.pestControl.workingHours'.tr(),
  ),
  ServiceDetailsModel(
    title: 'services.cleaning.title'.tr(),
    subTitle: 'services.cleaning.subTitle'.tr(),
    imagePath: 'assets/images/cleaning_icon.png',
    description: 'services.cleaning.description'.tr(),
    features: [
      'services.cleaning.features.0'.tr(),
      'services.cleaning.features.1'.tr(),
      'services.cleaning.features.2'.tr(),
    ],
    price: 'services.cleaning.price'.tr(),
    estimatedDuration: 'services.cleaning.estimatedDuration'.tr(),
    workingHours: 'services.cleaning.workingHours'.tr(),
  ),
];
