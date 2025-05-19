enum AuthErrorType {
  emailAlreadyInUse,
  weakPassword,
  invalidEmail,
  unexpectedError,
}

extension AuthErrorTypeExtension on AuthErrorType {
  String get message {
    switch (this) {
      case AuthErrorType.emailAlreadyInUse:
        return 'This email is already in use.';
      case AuthErrorType.weakPassword:
        return 'Your password is too weak.';
      case AuthErrorType.invalidEmail:
        return 'This email format is invalid.';
      case AuthErrorType.unexpectedError:
      default:
        return 'An unexpected error occurred.';
    }
  }
}
