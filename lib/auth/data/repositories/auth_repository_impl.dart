import 'package:movies_app_train/app/errors/error_handler.dart';
import 'package:movies_app_train/app/errors/failure.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:dartz/dartz.dart';
import 'package:movies_app_train/auth/data/datasources/remote_data_source.dart';
import 'package:movies_app_train/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _authRemoteDataSource;
  const AuthRepositoryImpl(this._authRemoteDataSource);

  @override
  Future<Either<Failure, UserCredential>> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      return Right(await _authRemoteDataSource.loginWithEmailAndPassword(email: email, password: password));
    } on FirebaseAuthException catch (error) {
      return Left(ErrorHandler.errorHandler(error: error));
    } catch (error) {
      return Left(ErrorHandler.errorHandler(error: error));
    }
  }

  @override
  Future<Either<Failure, UserCredential>> registerWithEmailAndPassword({
    required String email,
    required String password,
    required String username,
  }) async {
    try {
      return Right(await _authRemoteDataSource.registerWithEmailAndPassword(
        email: email,
        password: password,
        username: username,
      ));
    } on FirebaseAuthException catch (error) {
      return Left(ErrorHandler.errorHandler(error: error));
    } catch (error) {
      return Left(ErrorHandler.errorHandler(error: error));
    }
  }

  @override
  Future<Either<Failure, Unit>> resetPassword(String email) async {
    try {
      return Right(await _authRemoteDataSource.resetPassword(email));
    } on FirebaseAuthException catch (error) {
      return Left(ErrorHandler.errorHandler(error: error));
    } catch (error) {
      return Left(ErrorHandler.errorHandler(error: error));
    }
  }

  @override
  Future<Either<Failure, Unit>> sendEmailVerfication() async {
    try {
      return Right(await _authRemoteDataSource.sendEmailVerfication());
    } on FirebaseAuthException catch (error) {
      return Left(ErrorHandler.errorHandler(error: error));
    } catch (error) {
      return Left(ErrorHandler.errorHandler(error: error));
    }
  }

  @override
  Future<Either<Failure, Unit>> signOut() async {
    try {
      return Right(await _authRemoteDataSource.signOut());
    } on FirebaseAuthException catch (error) {
      return Left(ErrorHandler.errorHandler(error: error));
    } catch (error) {
      return Left(ErrorHandler.errorHandler(error: error));
    }
  }
  
  @override
  Future<Either<Failure, UserCredential>> signInWithGoogle() async {
    try {
      return Right(await _authRemoteDataSource.signInWithGoogle());
    } catch (error) {
      return Left(ErrorHandler.errorHandler(error: error));
    }
  }
}
