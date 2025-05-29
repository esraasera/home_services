abstract class ForgotPasswordState {}
class ForgotPasswordInitial extends ForgotPasswordState {}
class ForgotPasswordSuccess extends ForgotPasswordState {}
class ForgotPasswordLoading extends ForgotPasswordState {}
class ForgotPasswordFailure extends ForgotPasswordState {
  String message;
  ForgotPasswordFailure(this.message);
}