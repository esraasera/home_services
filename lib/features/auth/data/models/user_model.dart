import 'package:home_services_app/features/auth/domain/entities/user_entity.dart';

class UserModel extends UserEntity{
  UserModel({
    required super.uid,
    required super.email,
    required super.name,
   });

  factory UserModel.fromMap(Map<String,dynamic>map){
    return UserModel(
        uid: map["uid"] ?? "",
        email: map['email'] ?? '',
      name: map['name'] ?? '',
    );
  }

  Map<String,dynamic> toMap (){
    return {
      "uid": uid,
      "email" : email,
      "name" : name,
    };
  }
}