abstract class LoginState{}

class LoginInitial extends LoginState {}
class LoginLoading extends LoginState {}
class LoginSuccess extends LoginState {
  final String userName;
  LoginSuccess(this.userName);
}
class LoginFailure extends LoginState {
  final String message;
  LoginFailure(this.message);
}
class ChangePasswordIcon extends LoginState {}
