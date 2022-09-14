import 'package:dartz/dartz.dart';
import 'package:movies_app_train/app/errors/failure.dart';
import 'package:movies_app_train/movies/domain/entities/movies_info.dart';
import 'package:movies_app_train/movies/domain/repositories/movies_repository.dart';

class GetUpcomingMoviesUsecase {
  final MoviesRepository _moviesRepository;
  const GetUpcomingMoviesUsecase(this._moviesRepository);

  Future<Either<Failure, MoviesInfo>> call(int page) async {
    return await _moviesRepository.getUpcomingMovies(page);
  }
}
