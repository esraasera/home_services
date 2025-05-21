import 'package:home_services_app/home_services/auth/domain/entities/user_entity.dart';
import 'package:home_services_app/home_services/auth/domain/repository/base_auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository{



  @override
  Future<void> registerUser(UserEntity user, String password) {
    // TODO: implement registerUser
    throw UnimplementedError();
  }

}