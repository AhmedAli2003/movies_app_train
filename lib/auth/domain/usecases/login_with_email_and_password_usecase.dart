import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:movies_app_train/app/errors/failure.dart';
import 'package:movies_app_train/auth/domain/repositories/auth_repository.dart';

class LoginWithEmailAndPasswordUsecase {
  final AuthRepository _authRepository;
  const LoginWithEmailAndPasswordUsecase(this._authRepository);

  Future<Either<Failure, UserCredential>> call({
    required String email,
    required String password,
  }) async {
    return await _authRepository.loginWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
}
