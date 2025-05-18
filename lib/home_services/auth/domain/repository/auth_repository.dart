import 'package:home_services_app/home_services/auth/domain/entities/user_entity.dart';

abstract class AuthRepository {

  Future<void> register(UserEntity user , String password);
}