import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movies_app_train/app/network/dio_factory.dart';
import 'package:movies_app_train/app/network/internet_connection.dart';
import 'package:movies_app_train/auth/data/datasources/remote_data_source.dart';
import 'package:movies_app_train/auth/data/repositories/auth_repository_impl.dart';
import 'package:movies_app_train/auth/domain/repositories/auth_repository.dart';
import 'package:movies_app_train/auth/domain/usecases/login_with_email_and_password_usecase.dart';
import 'package:movies_app_train/auth/domain/usecases/register_with_email_and_password_usecase.dart';
import 'package:movies_app_train/auth/domain/usecases/reset_password_usecase.dart';
import 'package:movies_app_train/auth/domain/usecases/send_email_verfication_usecase.dart';
import 'package:movies_app_train/auth/domain/usecases/sign_in_with_google_usecase.dart';
import 'package:movies_app_train/auth/domain/usecases/sign_out_usecase.dart';
import 'package:movies_app_train/movies/data/datasources/user_movies_remote_data_source.dart';
import 'package:movies_app_train/movies/data/repositories/movies_repository_impl.dart';
import 'package:movies_app_train/movies/data/repositories/user_movies_repository_impl.dart';
import 'package:movies_app_train/movies/domain/repositories/movies_repository.dart';
import 'package:movies_app_train/movies/domain/repositories/user_movies_repository.dart';
import 'package:movies_app_train/movies/domain/usecases/add_to_dont_want_to_watch_usecase.dart';
import 'package:movies_app_train/movies/domain/usecases/add_to_favorite_usecase.dart';
import 'package:movies_app_train/movies/domain/usecases/add_to_want_to_watch_usecase.dart';
import 'package:movies_app_train/movies/domain/usecases/add_to_watched_usecase.dart';
import 'package:movies_app_train/movies/domain/usecases/get_dont_want_to_watch_usecase.dart';
import 'package:movies_app_train/movies/domain/usecases/get_favorites_usecase.dart';
import 'package:movies_app_train/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:movies_app_train/movies/domain/usecases/get_now_playing_movies_usercase.dart';
import 'package:movies_app_train/movies/domain/usecases/get_popular_movies_usecase.dart';
import 'package:movies_app_train/movies/domain/usecases/get_searched_movies_usecase.dart';
import 'package:movies_app_train/movies/domain/usecases/get_similar_movies_usecase.dart';
import 'package:movies_app_train/movies/domain/usecases/get_top_rated_movies_usecase.dart';
import 'package:movies_app_train/movies/domain/usecases/get_upcoming_movies_usecase.dart';
import 'package:movies_app_train/movies/data/datasources/movie_remote_data_source.dart';
import 'package:movies_app_train/movies/domain/usecases/get_want_to_watch_usecase.dart';
import 'package:movies_app_train/movies/domain/usecases/get_watched_usecase.dart';
import 'package:movies_app_train/movies/domain/usecases/remove_from_dont_want_to_watch_usecase.dart';
import 'package:movies_app_train/movies/domain/usecases/remove_from_favorite_usecase.dart';
import 'package:movies_app_train/movies/domain/usecases/remove_from_want_to_watch_usecase.dart';
import 'package:movies_app_train/movies/domain/usecases/remove_from_watched_usecase.dart';

final getIt = GetIt.instance;

void setup() {
  /// Usecases
  // Auth
  getIt.registerLazySingleton<RegisterWithEmailAndPasswordUsecase>(() => RegisterWithEmailAndPasswordUsecase(getIt()));
  getIt.registerLazySingleton<LoginWithEmailAndPasswordUsecase>(() => LoginWithEmailAndPasswordUsecase(getIt()));
  getIt.registerLazySingleton<ResetPasswordUsecase>(() => ResetPasswordUsecase(getIt()));
  getIt.registerLazySingleton<SendEmailVerficationUsecase>(() => SendEmailVerficationUsecase(getIt()));
  getIt.registerLazySingleton<SignOutUsecase>(() => SignOutUsecase(getIt()));
  getIt.registerLazySingleton<SignInWithGoogleUsecase>(() => SignInWithGoogleUsecase(getIt()));

  // Movies
  getIt.registerLazySingleton<GetNowPlayingMoviesUsecase>(() => GetNowPlayingMoviesUsecase(getIt()));
  getIt.registerLazySingleton<GetPopularMoviesUsecase>(() => GetPopularMoviesUsecase(getIt()));
  getIt.registerLazySingleton<GetTopRatedMoviesUsecase>(() => GetTopRatedMoviesUsecase(getIt()));
  getIt.registerLazySingleton<GetUpcomingMoviesUsecase>(() => GetUpcomingMoviesUsecase(getIt()));
  getIt.registerLazySingleton<GetMovieDetailsUsecase>(() => GetMovieDetailsUsecase(getIt()));
  getIt.registerLazySingleton<GetSimilarMoviesUsecase>(() => GetSimilarMoviesUsecase(getIt()));
  getIt.registerLazySingleton<AddToFavoriteUsecase>(() => AddToFavoriteUsecase(getIt()));
  getIt.registerLazySingleton<AddToDontWantToWatchUsecase>(() => AddToDontWantToWatchUsecase(getIt()));
  getIt.registerLazySingleton<AddToWantToWatchUsecase>(() => AddToWantToWatchUsecase(getIt()));
  getIt.registerLazySingleton<AddToWathcedUsecase>(() => AddToWathcedUsecase(getIt()));
  getIt.registerLazySingleton<RemoveFromDontWantToWatchUsecase>(() => RemoveFromDontWantToWatchUsecase(getIt()));
  getIt.registerLazySingleton<RemoveFromFavoriteUsecase>(() => RemoveFromFavoriteUsecase(getIt()));
  getIt.registerLazySingleton<RemoveFromWantToWatchUsecase>(() => RemoveFromWantToWatchUsecase(getIt()));
  getIt.registerLazySingleton<RemoveFromWathcedUsecase>(() => RemoveFromWathcedUsecase(getIt()));
  getIt.registerLazySingleton<GetFavoritesUsecase>(() => GetFavoritesUsecase(getIt()));
  getIt.registerLazySingleton<GetWantToWatchUsecase>(() => GetWantToWatchUsecase(getIt()));
  getIt.registerLazySingleton<GetDontWantToWatchUsecase>(() => GetDontWantToWatchUsecase(getIt()));
  getIt.registerLazySingleton<GetWatchedUsecase>(() => GetWatchedUsecase(getIt()));
  getIt.registerLazySingleton<GetSearchedMoviesUsecase>(() => GetSearchedMoviesUsecase(getIt()));

  /// Repositories
  // Movies
  getIt.registerLazySingleton<MoviesRepository>(() => MoviesRepositoryImpl(getIt(), getIt()));
  getIt.registerLazySingleton<UserMoviesRepository>(() => UserMoviesRepositoryImpl(getIt()));
  
  // Auth
  getIt.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(getIt()));

  /// Remote Datasource
  // Movies
  getIt.registerLazySingleton<MovieRemoteDataSource>(() => MovieRemoteDataSource(getIt()));
  getIt.registerLazySingleton<UserMoviesRemoteDataSource>(() => UserMoviesRemoteDataSourceImpl());

  // Auth
  getIt.registerLazySingleton<AuthRemoteDataSource>(() => AuthRemoteDataSourceImpl());

  // Internet Connection
  getIt.registerLazySingleton<InternetConnection>(() => InternetConnectionImpl());

  // Dio
  getIt.registerLazySingleton<Dio>(() => DioFactory().getDio());
}
