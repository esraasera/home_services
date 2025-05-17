import 'package:home_services_app/home_services/auth/domain/entities/user_entity.dart';
import 'package:home_services_app/home_services/auth/domain/repository/auth_repository.dart';

class RegisterUseCase{
  AuthRepository authRepository ;
  RegisterUseCase (this.authRepository);

  Future <void> call (UserEntity user, String password)async{
    return await authRepository.register(user, password);
  }
}