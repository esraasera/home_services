import 'package:home_services_app/core/errors/firebase_auth_error_messages.dart';

enum AuthErrorType {
  emailAlreadyInUse,
  weakPassword,
  invalidEmail,
  networkError,
  unexpectedError,
}


extension AuthErrorTypeExtension on AuthErrorType {
  String get message {
    switch (this) {
      case AuthErrorType.emailAlreadyInUse:
        return FirebaseAuthErrors.emailAlreadyInUse;
      case AuthErrorType.weakPassword:
        return FirebaseAuthErrors.weakPassword;
      case AuthErrorType.invalidEmail:
        return FirebaseAuthErrors.invalidEmail;
      case AuthErrorType.networkError:
        return FirebaseAuthErrors.networkError;
      case AuthErrorType.unexpectedError:
      default:
        return FirebaseAuthErrors.unexpected;
    }
  }
}


