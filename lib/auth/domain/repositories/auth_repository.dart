import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:movies_app_train/app/errors/failure.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserCredential>> registerWithEmailAndPassword({
    required String email,
    required String password,
    required String username,
  });
  Future<Either<Failure, UserCredential>> loginWithEmailAndPassword({
    required String email,
    required String password,
  });
  Future<Either<Failure, UserCredential>> signInWithGoogle();
  Future<Either<Failure, Unit>> resetPassword(String email);
  Future<Either<Failure, Unit>> sendEmailVerfication();
  Future<Either<Failure, Unit>> signOut();
}
