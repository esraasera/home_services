import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:home_services_app/home_services/auth/data/models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<void> registerUser(UserModel user , String password);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firestore;

  AuthRemoteDataSourceImpl({
    required this.firebaseAuth,
    required this.firestore,
});
  @override
  Future<void> registerUser(UserModel user, String password)async {

    await firebaseAuth.createUserWithEmailAndPassword(email: user.email, password: password);


  }

} 