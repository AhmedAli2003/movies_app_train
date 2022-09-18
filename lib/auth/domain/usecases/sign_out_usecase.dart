import 'package:dartz/dartz.dart';
import 'package:movies_app_train/app/errors/failure.dart';
import 'package:movies_app_train/auth/domain/repositories/auth_repository.dart';

class SignOutUsecase {
  final AuthRepository _authRepository;
  const SignOutUsecase(this._authRepository);

  Future<Either<Failure, Unit>> call() async {
    return await _authRepository.signOut();
  }
}
