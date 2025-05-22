import 'package:home_services_app/home_services/auth/data/datasource/auth_remote_datasource.dart';
import 'package:home_services_app/home_services/auth/data/models/user_model.dart';
import 'package:home_services_app/home_services/auth/domain/entities/user_entity.dart';
import 'package:home_services_app/home_services/auth/domain/repository/base_auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository{
  AuthRemoteDataSource remoteDataSource ;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<void> registerUser(UserEntity user, String password) async {
    final model = UserModel(name: user.name, email: user.email);
    await remoteDataSource .registerUser(model, password);
  }

}