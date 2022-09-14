import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app_train/app/constants/app_values.dart';
import 'package:movies_app_train/app/di.dart';
import 'package:movies_app_train/app/network/request_state.dart';
import 'package:movies_app_train/movies/domain/entities/detailed_movie.dart';
import 'package:movies_app_train/movies/domain/usecases/get_movie_details_usecase.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  MovieDetailsBloc() : super(const MovieDetailsState(requestState: RequestState.loading)) {
    on<MovieDetailsEvent>((event, emit) async {
      final getMovieDetailsUsecase = getIt<GetMovieDetailsUsecase>();
      final either = await getMovieDetailsUsecase(event.id);
      either.fold(
        (failure) => emit(MovieDetailsState(message: failure.errorMessage, requestState: RequestState.error)),
        (movie) => emit(MovieDetailsState(movie: movie, requestState: RequestState.loaded)),
      );
    });
  }
}
