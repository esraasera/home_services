import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:home_services_app/core/utils/app_strings.dart';
import 'package:home_services_app/features/service_request/data/models/service_model.dart';

class AppConstants {
  // Splash screen
  static const double splashIconSize = 300.0;
  static const Duration splashAnimationDuration = Duration(milliseconds: 1000);

  //map
  static LatLng defaultLocation = LatLng(30.0444, 31.2357);

  static const List<ServiceModel> servicesList = [
    ServiceModel(title: AppStrings.plumbing, imagePath: "assets/images/plumbing_icon.png"),
    ServiceModel(title: AppStrings.carpentry, imagePath: "assets/images/carpentry.png"),
    ServiceModel(title: AppStrings.electrical, imagePath: "assets/images/electrical_icon.png"),
    ServiceModel(title: AppStrings.painting, imagePath: "assets/images/painting_icon.png"),
    ServiceModel(title: AppStrings.pestControl, imagePath: "assets/images/Pest_control_icon.png"),
    ServiceModel(title: AppStrings.cleaning, imagePath: "assets/images/cleaning_icon.png"),
  ];
}