import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:home_services_app/features/auth/presentation/screens/forgot_password_screen.dart';
import 'package:home_services_app/features/auth/presentation/screens/login_screen.dart';
import 'package:home_services_app/features/auth/presentation/screens/register_screen.dart';
import 'package:home_services_app/features/confirmation/presentation/screens/confirmation_screen.dart';
import 'package:home_services_app/features/location_picker/presentation/screens/map_picker_screen.dart';
import 'package:home_services_app/features/service_request/presentation/screens/stepper_screen.dart';
import 'package:home_services_app/features/splash/presentation/screens/splash_screen.dart';

class Routes{
  static const String splashRoute = "/";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String forgotPasswordRoute = "/forgotPassword";
  static const String settingsRoute = "/settings";
  static const String stepperRoute = "/stepper";
  static const String mapRoute = "/mapPicker";
  static const String confirmationRoute = "/confirmation";
}


class RouteGenerator {
static Route <dynamic> getRoute(RouteSettings settings){
  switch(settings.name){
    case Routes.splashRoute:
      return MaterialPageRoute(builder: (_) => SplashScreen());
    case Routes.loginRoute:
      return MaterialPageRoute(builder: (_) => LoginScreen());
    case Routes.registerRoute:
      return MaterialPageRoute(builder: (_) => RegisterScreen());
    case Routes.forgotPasswordRoute:
      return MaterialPageRoute(builder: (_) => ForgotPassword());
    case Routes.stepperRoute:
      return MaterialPageRoute(builder: (_) => StepperScreen());
    case Routes.mapRoute:
      return MaterialPageRoute(builder: (_) => MapPickerScreen());
    case Routes.confirmationRoute:
      return MaterialPageRoute(builder: (_) => ConfirmationScreen());
    default :
      return unDefinedRoute();
  }
}

static Route<dynamic> unDefinedRoute(){
  return MaterialPageRoute(builder:(_)=>Scaffold(
    appBar: AppBar(title: Text("noRouteFound".tr())),
    body: Center(child: Text("noRouteFound".tr())),
  )
  );
}
}