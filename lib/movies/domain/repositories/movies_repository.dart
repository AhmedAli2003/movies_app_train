import 'package:dartz/dartz.dart';
import 'package:movies_app_train/app/errors/failure.dart';
import 'package:movies_app_train/movies/domain/entities/movies_info.dart';

abstract class MoviesRepository {
  Future<Either<Failure, MoviesInfo>> getNowPlayingMovies(int page);
  Future<Either<Failure, MoviesInfo>> getPopularMovies(int page);
  Future<Either<Failure, MoviesInfo>> getTopRatedMovies(int page);
}
