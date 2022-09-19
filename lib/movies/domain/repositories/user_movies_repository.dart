import 'package:dartz/dartz.dart';
import 'package:movies_app_train/app/errors/failure.dart';
import 'package:movies_app_train/movies/domain/entities/movie.dart';

abstract class UserMoviesRepository {
  Future<Either<Failure, Unit>> addToFavorite(Movie movie);
  Future<Either<Failure, Unit>> addToWatched(Movie movie);
  Future<Either<Failure, Unit>> addToWantToWatch(Movie movie);
  Future<Either<Failure, Unit>> addToDontWantToWatch(Movie movie);
  Future<Either<Failure, Unit>> removeFromFavorite(Movie movie);
  Future<Either<Failure, Unit>> removeFromWatched(Movie movie);
  Future<Either<Failure, Unit>> removeFromWantToWatch(Movie movie);
  Future<Either<Failure, Unit>> removeFromDontWantToWatch(Movie movie);
  Future<Either<Failure, List<Movie>>> getFavorites();
  Future<Either<Failure, List<Movie>>> getWantToWatch();
  Future<Either<Failure, List<Movie>>> getDontWantToWatch();
  Future<Either<Failure, List<Movie>>> getWatched();
}
