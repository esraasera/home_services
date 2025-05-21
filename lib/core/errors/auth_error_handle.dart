import 'package:home_services_app/core/errors/firebase_auth_error.dart';

enum AuthErrorType {
  emailAlreadyInUse,
  weakPassword,
  invalidEmail,
  networkError,
  userDisabled,
  userNotFound,
  wrongPassword,
  tooManyRequests,
  operationNotAllowed,
  unknownError,
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
      case AuthErrorType.userDisabled:
        return FirebaseAuthErrors.userDisabled;
      case AuthErrorType.userNotFound:
        return FirebaseAuthErrors.userNotFound;
      case AuthErrorType.wrongPassword:
        return FirebaseAuthErrors.wrongPassword;
      case AuthErrorType.tooManyRequests:
        return FirebaseAuthErrors.tooManyRequests;
      case AuthErrorType.operationNotAllowed:
        return FirebaseAuthErrors.operationNotAllowed;
      case AuthErrorType.unknownError:
        return FirebaseAuthErrors.unknownError;
      case AuthErrorType.unexpectedError:
        return FirebaseAuthErrors.unexpectedError;
    }
  }
}
