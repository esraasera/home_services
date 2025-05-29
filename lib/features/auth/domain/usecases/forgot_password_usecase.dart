import 'package:home_services_app/features/auth/domain/repository/base_auth_repository.dart';

class ForgotPasswordUseCase {
  final AuthRepository authRepository;
  ForgotPasswordUseCase(this.authRepository);

  Future<void>call(String email){
    return authRepository.resetPassword(email);
}
}