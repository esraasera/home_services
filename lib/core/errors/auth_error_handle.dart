
import 'package:easy_localization/easy_localization.dart';

enum AuthErrorType {
  emailAlreadyInUse,
  weakPassword,
  invalidEmail,
  networkError,
  invalidCredential,
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
        return "firebase.emailAlreadyInUse".tr();
      case AuthErrorType.weakPassword:
        return "firebase.weakPassword".tr();
      case AuthErrorType.invalidEmail:
        return "firebase.invalidEmail".tr();
      case AuthErrorType.networkError:
        return "firebase.networkError".tr();
      case AuthErrorType.invalidCredential:
        return "firebase.invalidCredential".tr();
      case AuthErrorType.userDisabled:
        return "firebase.userDisabled".tr();
      case AuthErrorType.userNotFound:
        return "firebase.userNotFound".tr();
      case AuthErrorType.wrongPassword:
        return "firebase.wrongPassword".tr();
      case AuthErrorType.tooManyRequests:
        return "firebase.tooManyRequests".tr();
      case AuthErrorType.operationNotAllowed:
        return "firebase.operationNotAllowed".tr();
      case AuthErrorType.unknownError:
        return "firebase.unknownError".tr();
      case AuthErrorType.unexpectedError:
        return "firebase.unexpectedError".tr();
    }
  }
}

AuthErrorType firebaseAuthErrorType(String errorCode) {
  switch (errorCode) {
    case 'email-already-in-use':
      return AuthErrorType.emailAlreadyInUse;
    case 'weak-password':
      return AuthErrorType.weakPassword;
    case 'invalid-email':
      return AuthErrorType.invalidEmail;
    case 'network-request-failed':
      return AuthErrorType.networkError;
    case 'invalid-credential':
      return AuthErrorType.invalidCredential;
    case 'user-disabled':
      return AuthErrorType.userDisabled;
    case 'user-not-found':
      return AuthErrorType.userNotFound;
    case 'wrong-password':
      return AuthErrorType.wrongPassword;
    case 'too-many-requests':
      return AuthErrorType.tooManyRequests;
    case 'operation-not-allowed':
      return AuthErrorType.operationNotAllowed;
    case 'unknown':
      return AuthErrorType.unknownError;
    default:
      return AuthErrorType.unexpectedError;
  }
}
