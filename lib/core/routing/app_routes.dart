import 'package:flutter/material.dart';
import 'package:home_services_app/core/utils/app_string.dart';
import 'package:home_services_app/features/auth/presentation/screens/forgot_password.dart';
import 'package:home_services_app/features/auth/presentation/screens/login_screen.dart';
import 'package:home_services_app/features/auth/presentation/screens/register_screen.dart';
import 'package:home_services_app/features/chat/presentation/screens/chat_screen.dart';
import 'package:home_services_app/features/location/presentation/screens/location_screen.dart';
import 'package:home_services_app/features/rating/presentation/screens/rating_screen.dart';
import 'package:home_services_app/features/services/presentation/screens/services_screen.dart';
import 'package:home_services_app/features/splash/presentation/screens/splash_screen.dart';
import 'package:home_services_app/features/user_details/presentation/screens/user_details_screen.dart';

class Routes{
  static const String splashRoute = "/";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String forgotPasswordRoute = "/forgotPassword";
  static const String servicesRoute = "/services";
  static const String userDetailsScreenRoute = "/userDetails";
  static const String locationRoute = "/location";
  static const String confirmationRoute = "/confirmation";
  static const String ratingRoute = "/rating";
  static const String chatRoute = "/chat";
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
    case Routes.servicesRoute:
      return MaterialPageRoute(builder: (_) => ServicesScreen());
    case Routes.userDetailsScreenRoute:
      return MaterialPageRoute(builder: (_) => UserDetailsScreen());
    case Routes.locationRoute:
      return MaterialPageRoute(builder: (_) => LocationScreen());
    case Routes.chatRoute:
      return MaterialPageRoute(builder: (_) => ChatScreen());
    case Routes.ratingRoute:
      return MaterialPageRoute(builder: (_) => RatingScreen());
    default :
      return unDefinedRoute();
  }
}

static Route<dynamic> unDefinedRoute(){
  return MaterialPageRoute(builder:(_)=>Scaffold(
    appBar: AppBar(title: const Text(AppStrings.noRouteFound),),
    body: const Center(child: Text(AppStrings.noRouteFound),),
  )
  );
}
}