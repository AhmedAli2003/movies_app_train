import 'package:movies_app_train/app/errors/error_handler.dart';
import 'package:movies_app_train/app/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:movies_app_train/app/network/internet_connection.dart';
import 'package:movies_app_train/movies/domain/entities/movies_info.dart';
import 'package:movies_app_train/movies/domain/repositories/movies_repository.dart';
import '../datasources/movie_remote_data_source.dart';

class MoviesRepositoryImpl implements MoviesRepository {
  final MovieRemoteDataSource remoteDataSource;
  final InternetConnection internetConnection;
  const MoviesRepositoryImpl(this.remoteDataSource, this.internetConnection);

  @override
  Future<Either<Failure, MoviesInfo>> getNowPlayingMovies(int page) async {
    if (await internetConnection.isConnected) {
      try {
        return Right(await remoteDataSource.getNowPlayingMovies(page: page));
      } catch (error) {
        return Left(ErrorHandler.errorHandler(error: error));
      }
    }
    return Left(ErrorHandler.errorHandler());
  }

  @override
  Future<Either<Failure, MoviesInfo>> getPopularMovies(int page) async {
    if (await internetConnection.isConnected) {
      try {
        return Right(await remoteDataSource.getPopularMovies(page: page));
      } catch (error) {
        return Left(ErrorHandler.errorHandler(error: error));
      }
    }
    return Left(ErrorHandler.errorHandler());
  }

  @override
  Future<Either<Failure, MoviesInfo>> getTopRatedMovies(int page) async {
    if (await internetConnection.isConnected) {
      try {
        return Right(await remoteDataSource.getTopRatedMovies(page: page));
      } catch (error) {
        return Left(ErrorHandler.errorHandler(error: error));
      }
    }
    return Left(ErrorHandler.errorHandler());
  }
}
