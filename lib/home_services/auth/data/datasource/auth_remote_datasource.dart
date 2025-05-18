import 'package:home_services_app/home_services/auth/data/models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<void> registerUser(UserModel user , String password);
}