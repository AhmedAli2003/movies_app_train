import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app_train/app/constants/app_values.dart';
import 'package:movies_app_train/app/di.dart';
import 'package:movies_app_train/app/network/request_state.dart';
import 'package:movies_app_train/movies/domain/entities/detailed_movie.dart';
import 'package:movies_app_train/movies/domain/entities/movies_info.dart';
import 'package:movies_app_train/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:movies_app_train/movies/domain/usecases/get_similar_movies_usecase.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<BaseMovieDetailsEvent, MovieDetailsState> {
  final int page = 1;
  MovieDetailsBloc()
      : super(const MovieDetailsState(
          requestState: RequestState.loading,
          similarMoviesRequestState: RequestState.loading,
        )) {
    on<MovieDetailsEvent>((event, emit) async {
      final getMovieDetailsUsecase = getIt<GetMovieDetailsUsecase>();
      final either = await getMovieDetailsUsecase(event.id);
      either.fold(
        (failure) => emit(state.copyWith(
          message: failure.errorMessage,
          requestState: RequestState.error,
        )),
        (movie) => emit(state.copyWith(
          movie: movie,
          requestState: RequestState.loaded,
        )),
      );
    });

    on<SimilarMoviesEvent>((event, emit) async {
      final getSimilarMoviesUsecase = getIt<GetSimilarMoviesUsecase>();
      final either = await getSimilarMoviesUsecase(event.id, page);
      either.fold(
        (failure) => emit(state.copyWith(
          similarMoviesMessage: failure.errorMessage,
          similarMoviesRequestState: RequestState.error,
        )),
        (similarMovies) => emit(state.copyWith(
          similarMovies: similarMovies,
          similarMoviesRequestState: RequestState.loaded,
        )),
      );
    });
  }
}
