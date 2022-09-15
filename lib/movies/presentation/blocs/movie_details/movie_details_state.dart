part of 'movie_details_bloc.dart';

class MovieDetailsState extends Equatable {
  final DetailedMovie movie;
  final String message;
  final RequestState requestState;
  final MoviesInfo similarMovies;
  final String similarMoviesMessage;
  final RequestState similarMoviesRequestState;
  const MovieDetailsState({
    this.movie = const DetailedMovie.empty(),
    this.message = AppValues.empty,
    this.requestState = RequestState.loading,
    this.similarMovies = const MoviesInfo.getEmpty(),
    this.similarMoviesMessage = AppValues.empty,
    this.similarMoviesRequestState = RequestState.loading,
  });

  MovieDetailsState copyWith({
    DetailedMovie? movie,
    String? message,
    RequestState? requestState,
    MoviesInfo? similarMovies,
    String? similarMoviesMessage,
    RequestState? similarMoviesRequestState,
  }) {
    return MovieDetailsState(
      movie: movie ?? this.movie,
      message: message ?? this.message,
      requestState: requestState ?? this.requestState,
      similarMovies: similarMovies ?? this.similarMovies,
      similarMoviesMessage: similarMoviesMessage ?? this.similarMoviesMessage,
      similarMoviesRequestState: similarMoviesRequestState ?? this.similarMoviesRequestState,
    );
  }

  @override
  List<Object> get props => [
        movie,
        message,
        requestState,
        similarMovies,
        similarMoviesMessage,
        similarMoviesRequestState,
      ];
}
