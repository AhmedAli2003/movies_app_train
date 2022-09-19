import 'package:dartz/dartz.dart';
import 'package:movies_app_train/app/errors/failure.dart';
import 'package:movies_app_train/movies/domain/entities/movie.dart';
import 'package:movies_app_train/movies/domain/repositories/user_movies_repository.dart';

class AddToWathcedUsecase {
  final UserMoviesRepository _userMoviesRepository;
  const AddToWathcedUsecase(this._userMoviesRepository);

  Future<Either<Failure, Unit>> call(Movie movie) async {
    return await _userMoviesRepository.addToWatched(movie);
  }
}
