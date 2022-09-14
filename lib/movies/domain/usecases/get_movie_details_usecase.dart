import 'package:dartz/dartz.dart';
import 'package:movies_app_train/app/errors/failure.dart';
import 'package:movies_app_train/movies/domain/entities/detailed_movie.dart';
import 'package:movies_app_train/movies/domain/repositories/movies_repository.dart';

class GetMovieDetailsUsecase {
  final MoviesRepository _moviesRepository;
  const GetMovieDetailsUsecase(this._moviesRepository);

  Future<Either<Failure, DetailedMovie>> call(int id) async {
    return await _moviesRepository.getmovieDetails(id);
  }
}
