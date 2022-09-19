import 'package:dartz/dartz.dart';
import 'package:movies_app_train/app/errors/failure.dart';
import 'package:movies_app_train/movies/domain/entities/movie.dart';
import 'package:movies_app_train/movies/domain/repositories/user_movies_repository.dart';

class GetWatchedUsecase {
  final UserMoviesRepository _userMoviesRepository;
  const GetWatchedUsecase(this._userMoviesRepository);

  Future<Either<Failure, List<Movie>>> call( ) async {
    return await _userMoviesRepository.getWatched();
  }
}
