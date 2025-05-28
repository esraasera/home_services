import 'package:home_services_app/features/auth/data/datasource/auth_remote_datasource.dart';
import 'package:home_services_app/features/auth/data/models/user_model.dart';
import 'package:home_services_app/features/auth/domain/entities/user_entity.dart';
import 'package:home_services_app/features/auth/domain/repository/base_auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository{
  AuthRemoteDataSource remoteDataSource ;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<void> registerUser(UserEntity user, String password) async {
    final model = UserModel(name: user.name, email: user.email);
    await remoteDataSource .registerUser(model, password);
  }

  @override
  Future<UserEntity> loginUser(String email, String password) {
    // TODO: implement loginUser
    throw UnimplementedError();
  }

}