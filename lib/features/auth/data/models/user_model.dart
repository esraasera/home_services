import 'package:home_services_app/features/auth/domain/entities/user_entity.dart';

class UserModel extends UserEntity{
  UserModel({
    required super.email,
    required super.name,
   });
  Map<String,dynamic> toMap (){
    return {
      "email" : email,
      "name" : name,
    };
  }
}