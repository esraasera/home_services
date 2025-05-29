import 'package:home_services_app/features/auth/data/datasource/auth_remote_datasource.dart';
import 'package:home_services_app/features/auth/data/models/user_model.dart';
import 'package:home_services_app/features/auth/domain/entities/user_entity.dart';
import 'package:home_services_app/features/auth/domain/repository/base_auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository{
  AuthRemoteDataSource remoteDataSource ;
  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<void> registerUser(UserEntity user, String password) async {
    final model = UserModel(uid:'',name: user.name, email: user.email);
    await remoteDataSource.registerUser(model, password);
  }

  @override
  Future<UserEntity> loginUser(String email, String password)async{
  final userModel = await remoteDataSource.loginUser(email, password);
  return UserEntity(
    uid: userModel.uid,
    name: userModel.name,
    email:userModel.email,
  );
  }

  @override
  Future<void> resetPassword(String email)async{
   await remoteDataSource .resetPassword(email);
  }

}