import 'package:dartz/dartz.dart';
import 'package:movies_app_train/app/errors/failure.dart';
import 'package:movies_app_train/auth/domain/repositories/auth_repository.dart';

class ResetPasswordUsecase {
  final AuthRepository _authRepository;
  const ResetPasswordUsecase(this._authRepository);

  Future<Either<Failure, Unit>> call(String email) async {
    return await _authRepository.resetPassword(email);
  }
}
