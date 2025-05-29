import 'package:home_services_app/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepository {

  Future<void>registerUser(UserEntity user , String password);
  Future<UserEntity>loginUser(String email , String password);
  Future<void> resetPassword(String email);
}