import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:home_services_app/core/errors/app_exception.dart';
import 'package:home_services_app/core/errors/auth_error_handle.dart';
import 'package:home_services_app/features/auth/data/models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> registerUser(UserModel user , String password);
  Future<UserModel> loginUser(String email , String password);
  Future<void>resetPassword(String email);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firestore;

  AuthRemoteDataSourceImpl({
    required this.firebaseAuth,
    required this.firestore,
  });

  @override
  Future<UserModel> registerUser(UserModel user, String password) async {
    try {
      final newUser = await firebaseAuth.createUserWithEmailAndPassword(
        email: user.email,
        password: password,
      );
      final userMap = user.toMap();
    final uid = newUser.user!.uid;
      userMap['uid'] = newUser.user!.uid;
      await firestore.collection('users').doc(newUser.user!.uid).set(userMap);
      return UserModel(
        uid: uid,
        name: user.name,
        email: user.email,
      );
    } on FirebaseAuthException catch (e) {
      final errorType = firebaseAuthErrorType(e.code);
      throw AppException(errorType.message);
    } catch (e) {
      throw AppException(AuthErrorType.unexpectedError.message);
    }
  }


  @override
  Future<void> resetPassword(String email)async{
   try{
     await firebaseAuth.sendPasswordResetEmail(email: email);
   }on FirebaseAuthException catch (e){
     final errorType =firebaseAuthErrorType(e.code);
     throw AppException(errorType.message);
   }catch(e){
     throw AppException(AuthErrorType.unexpectedError.message);
   }
  }
}
