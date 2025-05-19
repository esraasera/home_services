import 'package:home_services_app/core/utils/app_string.dart';

class FirebaseAuthErrorMessages {
  static String getMessage(String errorCode) {
    switch (errorCode) {
      case 'weak-password':
        return AppStrings.weakPassword;
      // case 'email-already-in-use':
      //   return AppStrings.emailAlreadyInUse;
      // case 'user-not-found':
      //   return AppStrings.userNotFound;
      // case 'wrong-password':
      //   return AppStrings.wrongPassword;
      case 'network-request-failed':
        return AppStrings.networkError;
      default:
        return AppStrings.unknownError;
    }
  }
}