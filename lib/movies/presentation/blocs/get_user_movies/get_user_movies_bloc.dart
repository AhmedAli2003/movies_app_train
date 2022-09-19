import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app_train/app/constants/app_values.dart';
import 'package:movies_app_train/app/di.dart';
import 'package:movies_app_train/app/network/request_state.dart';
import 'package:movies_app_train/movies/domain/entities/movie.dart';
import 'package:movies_app_train/movies/domain/usecases/get_dont_want_to_watch_usecase.dart';
import 'package:movies_app_train/movies/domain/usecases/get_favorites_usecase.dart';
import 'package:movies_app_train/movies/domain/usecases/get_want_to_watch_usecase.dart';
import 'package:movies_app_train/movies/domain/usecases/get_watched_usecase.dart';

part 'get_user_movies_event.dart';
part 'get_user_movies_state.dart';

class UserMoviesBloc extends Bloc<UserMoviesEvent, UserMoviesState> {
  UserMoviesBloc() : super(const UserMoviesState()) {
    on<GetFavoritesEvent>((event, emit) async {
      final getFavorites = getIt<GetFavoritesUsecase>();
      final either = await getFavorites();
      either.fold(
        (failure) => emit(state.copyWith(
          favoriteMoviesErrorMessage: failure.errorMessage,
          favoriteMoviesState: RequestState.error,
        )),
        (movies) => emit(state.copyWith(
          favoriteMovies: movies,
          favoriteMoviesState: RequestState.loaded,
        )),
      );
    });

    on<GetWantToWatchEvent>((event, emit) async {
      final getWantToWatch = getIt<GetWantToWatchUsecase>();
      final either = await getWantToWatch();
      either.fold(
        (failure) => emit(state.copyWith(
          wantToWatchMoviesErrorMessage: failure.errorMessage,
          wantToWatchMoviesState: RequestState.error,
        )),
        (movies) => emit(state.copyWith(
          wantToWatchMovies: movies,
          wantToWatchMoviesState: RequestState.loaded,
        )),
      );
    });

    on<GetDontWantToWatchEvent>((event, emit) async {
      final getDontWantToWatch = getIt<GetDontWantToWatchUsecase>();
      final either = await getDontWantToWatch();
      either.fold(
        (failure) => emit(state.copyWith(
          dontWantToWatchMoviesErrorMessage: failure.errorMessage,
          dontWantToWatchMoviesState: RequestState.error,
        )),
        (movies) => emit(state.copyWith(
          dontWantToWatchMovies: movies,
          dontWantToWatchMoviesState: RequestState.loaded,
        )),
      );
    });

    on<GetWatchedEvent>((event, emit) async {
      final getWatched = getIt<GetWatchedUsecase>();
      final either = await getWatched();
      either.fold(
        (failure) => emit(state.copyWith(
          watchedMoviesErrorMessage: failure.errorMessage,
          watchedMoviesState: RequestState.error,
        )),
        (movies) => emit(state.copyWith(
          watchedMovies: movies,
          watchedMoviesState: RequestState.loaded,
        )),
      );
    });
  }
}
