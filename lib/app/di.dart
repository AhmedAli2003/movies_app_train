import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movies_app_train/app/network/dio_factory.dart';
import 'package:movies_app_train/app/network/internet_connection.dart';
import 'package:movies_app_train/movies/data/repositories/movies_repository_impl.dart';
import 'package:movies_app_train/movies/domain/repositories/movies_repository.dart';
import 'package:movies_app_train/movies/domain/usecases/get_now_playing_movies_usercase.dart';
import 'package:movies_app_train/movies/domain/usecases/get_popular_movies_usecase.dart';
import 'package:movies_app_train/movies/domain/usecases/get_top_rated_movies_usecase.dart';
import 'package:movies_app_train/movies/domain/usecases/get_upcoming_movies_usecase.dart';
import 'package:movies_app_train/movies/data/datasources/movie_remote_data_source.dart';

final getIt = GetIt.instance;

void setup() {
  // Usecases
  getIt.registerLazySingleton<GetNowPlayingMoviesUsecase>(() => GetNowPlayingMoviesUsecase(getIt()));
  getIt.registerLazySingleton<GetPopularMoviesUsecase>(() => GetPopularMoviesUsecase(getIt()));
  getIt.registerLazySingleton<GetTopRatedMoviesUsecase>(() => GetTopRatedMoviesUsecase(getIt()));
  getIt.registerLazySingleton<GetUpcomingMoviesUsecase>(() => GetUpcomingMoviesUsecase(getIt()));

  // Repositories
  getIt.registerLazySingleton<MoviesRepository>(() => MoviesRepositoryImpl(getIt(), getIt()));

  // Remote Datasource
  getIt.registerLazySingleton<MovieRemoteDataSource>(() => MovieRemoteDataSource(getIt()));

  // Internet Connection
  getIt.registerLazySingleton<InternetConnection>(() => InternetConnectionImpl());

  // Dio
  getIt.registerLazySingleton<Dio>(() => DioFactory().getDio());
}
