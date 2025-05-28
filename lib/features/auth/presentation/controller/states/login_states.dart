abstract class LoginStates{}

class LoginInitial extends LoginStates {}
class LoginLoading extends LoginStates {}
class LoginSuccess extends LoginStates {
  final String userName;
  LoginSuccess(this.userName);
}
class LoginFailure extends LoginStates {
  final String message;
  LoginFailure(this.message);
}