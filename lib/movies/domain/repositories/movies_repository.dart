import 'package:dartz/dartz.dart';
import 'package:movies_app_train/app/errors/failure.dart';
import 'package:movies_app_train/movies/domain/entities/detailed_movie.dart';
import 'package:movies_app_train/movies/domain/entities/movies_info.dart';

abstract class MoviesRepository {
  Future<Either<Failure, MoviesInfo>> getNowPlayingMovies(int page);
  Future<Either<Failure, MoviesInfo>> getPopularMovies(int page);
  Future<Either<Failure, MoviesInfo>> getTopRatedMovies(int page);
  Future<Either<Failure, MoviesInfo>> getUpcomingMovies(int page);
  Future<Either<Failure, DetailedMovie>> getmovieDetails(int id);
  Future<Either<Failure, MoviesInfo>> getSimilarMovies(int id, int page);
  Future<Either<Failure, MoviesInfo>> getSearchedMovies(String name, int page);
}
