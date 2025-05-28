import 'package:home_services_app/features/auth/domain/entities/user_entity.dart';
import 'package:home_services_app/features/auth/domain/repository/base_auth_repository.dart';

class LoginUseCase {
  AuthRepository authRepository ;
  LoginUseCase(this.authRepository);

  Future<UserEntity> call (String email , String password){
   return authRepository.loginUser(email, password);
  }
}