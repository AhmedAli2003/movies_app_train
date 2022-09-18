import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:movies_app_train/app/errors/failure.dart';
import 'package:movies_app_train/auth/domain/repositories/auth_repository.dart';

class SignInWithGoogleUsecase {
  final AuthRepository _authRepository;
  const SignInWithGoogleUsecase(this._authRepository);

  Future<Either<Failure, UserCredential>> call() async {
    return await _authRepository.signInWithGoogle();
  }
}
