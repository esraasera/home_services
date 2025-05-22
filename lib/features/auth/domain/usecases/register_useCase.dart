import 'package:home_services_app/features/auth/domain/entities/user_entity.dart';
import 'package:home_services_app/features/auth/domain/repository/base_auth_repository.dart';

class RegisterUseCase{
  AuthRepository authRepository ;
  RegisterUseCase (this.authRepository);

  Future <void> call (UserEntity user, String password)async{
    return await authRepository.registerUser(user, password);
  }
}