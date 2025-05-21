import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:home_services_app/core/errors/auth_error_handle.dart';
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
  Future<void> registerUser(UserModel user, String password) async {
    try {
      final newUser = await firebaseAuth.createUserWithEmailAndPassword(
        email: user.email,
        password: password,
      );
      await firestore.collection('users').doc(newUser.user!.uid).set(user.toMap());
    } on FirebaseAuthException catch (e) {
      final errorType = firebaseAuthErrorType(e.code);
      throw Exception(errorType.message);  // أو Exception مخصصة
    } catch (error) {
      throw Exception(AuthErrorType.unexpectedError.message);
    }
  }

  AuthErrorType firebaseAuthErrorType(String errorCode) {
    switch (errorCode) {
      case 'email-already-in-use':
        return AuthErrorType.emailAlreadyInUse;
      case 'weak-password':
        return AuthErrorType.weakPassword;
      case 'invalid-email':
        return AuthErrorType.invalidEmail;
      default:
        return AuthErrorType.unexpectedError;
    }
  }
}
