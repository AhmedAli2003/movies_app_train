import 'package:movies_app_train/app/errors/error_handler.dart';
import 'package:movies_app_train/app/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:movies_app_train/movies/data/datasources/user_movies_remote_data_source.dart';
import 'package:movies_app_train/movies/domain/entities/movie.dart';
import 'package:movies_app_train/movies/domain/repositories/user_movies_repository.dart';

class UserMoviesRepositoryImpl implements UserMoviesRepository {
  final UserMoviesRemoteDataSource _userMoviesRemoteDataSource;
  const UserMoviesRepositoryImpl(this._userMoviesRemoteDataSource);

  @override
  Future<Either<Failure, Unit>> addToDontWantToWatch(Movie movie) async {
    try {
      return Right(await _userMoviesRemoteDataSource.addToDontWantToWatch(movie.toModel()));
    } catch (error) {
      return Left(ErrorHandler.errorHandler(error: error));
    }
  }

  @override
  Future<Either<Failure, Unit>> addToFavorite(Movie movie) async {
    try {
      return Right(await _userMoviesRemoteDataSource.addToFavorite(movie.toModel()));
    } catch (error) {
      return Left(ErrorHandler.errorHandler(error: error));
    }
  }

  @override
  Future<Either<Failure, Unit>> addToWantToWatch(Movie movie) async {
    try {
      return Right(await _userMoviesRemoteDataSource.addToWantToWatch(movie.toModel()));
    } catch (error) {
      return Left(ErrorHandler.errorHandler(error: error));
    }
  }

  @override
  Future<Either<Failure, Unit>> addToWatched(Movie movie) async {
    try {
      return Right(await _userMoviesRemoteDataSource.addToWatched(movie.toModel()));
    } catch (error) {
      return Left(ErrorHandler.errorHandler(error: error));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getDontWantToWatch() async {
    try {
      return Right(await _userMoviesRemoteDataSource.getDontWantToWatch());
    } catch (error) {
      return Left(ErrorHandler.errorHandler(error: error));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getFavorites() async {
    try {
      return Right(await _userMoviesRemoteDataSource.getFavorites());
    } catch (error) {
      return Left(ErrorHandler.errorHandler(error: error));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getWantToWatch() async {
    try {
      return Right(await _userMoviesRemoteDataSource.getWantToWatch());
    } catch (error) {
      return Left(ErrorHandler.errorHandler(error: error));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getWatched() async {
    try {
      return Right(await _userMoviesRemoteDataSource.getWatched());
    } catch (error) {
      return Left(ErrorHandler.errorHandler(error: error));
    }
  }

  @override
  Future<Either<Failure, Unit>> removeFromDontWantToWatch(Movie movie) async {
    try {
      return Right(await _userMoviesRemoteDataSource.removeFromDontWantToWatch(movie.toModel()));
    } catch (error) {
      return Left(ErrorHandler.errorHandler(error: error));
    }
  }

  @override
  Future<Either<Failure, Unit>> removeFromFavorite(Movie movie) async {
    try {
      return Right(await _userMoviesRemoteDataSource.removeFromFavorite(movie.toModel()));
    } catch (error) {
      return Left(ErrorHandler.errorHandler(error: error));
    }
  }

  @override
  Future<Either<Failure, Unit>> removeFromWantToWatch(Movie movie) async {
    try {
      return Right(await _userMoviesRemoteDataSource.removeFromWantToWatch(movie.toModel()));
    } catch (error) {
      return Left(ErrorHandler.errorHandler(error: error));
    }
  }

  @override
  Future<Either<Failure, Unit>> removeFromWatched(Movie movie) async {
    try {
      return Right(await _userMoviesRemoteDataSource.removeFromWatched(movie.toModel()));
    } catch (error) {
      return Left(ErrorHandler.errorHandler(error: error));
    }
  }
}
