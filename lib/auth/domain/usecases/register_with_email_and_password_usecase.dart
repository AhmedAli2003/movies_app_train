import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:movies_app_train/app/errors/failure.dart';
import 'package:movies_app_train/auth/domain/repositories/auth_repository.dart';

class RegisterWithEmailAndPasswordUsecase {
  final AuthRepository _authRepository;
  const RegisterWithEmailAndPasswordUsecase(this._authRepository);

  Future<Either<Failure, UserCredential>> call({
    required String email,
    required String password,
    required String username,
  }) async {
    return await _authRepository.registerWithEmailAndPassword(
      email: email,
      password: password,
      username: username,
    );
  }
}
