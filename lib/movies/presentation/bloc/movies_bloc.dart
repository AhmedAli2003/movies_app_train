import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app_train/app/constants/app_values.dart';
import 'package:movies_app_train/app/di.dart';
import 'package:movies_app_train/app/network/request_state.dart';
import 'package:movies_app_train/movies/domain/entities/movies_info.dart';
import 'package:movies_app_train/movies/domain/usecases/get_now_playing_movies_usercase.dart';
import 'package:movies_app_train/movies/domain/usecases/get_popular_movies_usecase.dart';
import 'package:movies_app_train/movies/domain/usecases/get_top_rated_movies_usecase.dart';
import 'package:movies_app_train/movies/domain/usecases/get_upcoming_movies_usecase.dart';

part 'movies_event.dart';
part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  int nowPlayingMoviesPage = 1;
  int popularMoviesPage = 1;
  int topRatedMoviesPage = 1;
  int upcomingMoviesPage = 1;

  MoviesBloc()
      : super(const MoviesState(
          nowPlayingRequestState: RequestState.loading,
          popularRequestState: RequestState.loading,
          topRatedRequestState: RequestState.loading,
          upcomingRequestState: RequestState.loading,
        )) {
    on<GetNowPlayingMoviesEvent>((event, emit) async {
      final newPlayingMoviesUsecase = getIt<GetNowPlayingMoviesUsecase>();
      final either = await newPlayingMoviesUsecase(nowPlayingMoviesPage);
      either.fold(
        (failure) => emit(state.copyWith(
          nowPlayingRequestState: RequestState.error,
          nowPlayingErrorMessage: failure.errorMessage,
        )),
        (moviesInfo) {
          emit(state.copyWith(
            nowPlayingRequestState: RequestState.loaded,
            nowPlayingMoviesInfo: moviesInfo,
          ));
        },
      );
    });

    on<GetPopularMoviesEvent>((event, emit) async {
      final popularMoviesUsecase = getIt<GetPopularMoviesUsecase>();
      final either = await popularMoviesUsecase(popularMoviesPage);
      either.fold(
        (failure) => emit(state.copyWith(
          popularRequestState: RequestState.error,
          popularErrorMessage: failure.errorMessage,
        )),
        (moviesInfo) {
          emit(state.copyWith(popularMoviesInfo: moviesInfo, popularRequestState: RequestState.loaded));
        },
      );
    });

    on<GetTopRatedMoviesEvent>((event, emit) async {
      final topRatedMoviesUsecase = getIt<GetTopRatedMoviesUsecase>();
      final either = await topRatedMoviesUsecase(topRatedMoviesPage);
      either.fold(
        (failure) => emit(state.copyWith(
          topRatedRequestState: RequestState.error,
          topRatedErrorMessage: failure.errorMessage,
        )),
        (moviesInfo) {
          emit(state.copyWith(
            topRatedRequestState: RequestState.loaded,
            topRatedMoviesInfo: moviesInfo,
          ));
        },
      );
    });

    on<GetUpcomingMoviesEvent>((event, emit) async {
      final upcomingMoviesUsecase = getIt<GetUpcomingMoviesUsecase>();
      final either = await upcomingMoviesUsecase(upcomingMoviesPage);
      either.fold(
        (failure) => emit(state.copyWith(
          upcomingRequestState: RequestState.error,
          upcomingErrorMessage: failure.errorMessage,
        )),
        (moviesInfo) {
          emit(state.copyWith(
            upcomingRequestState: RequestState.loaded,
            upcomingMoviesInfo: moviesInfo,
          ));
        },
      );
    });
  }
}
