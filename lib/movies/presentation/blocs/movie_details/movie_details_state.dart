part of 'movie_details_bloc.dart';

class MovieDetailsState extends Equatable {
  final DetailedMovie movie;
  final String message;
  final RequestState requestState;
  const MovieDetailsState({
    this.movie = const DetailedMovie.empty(),
    this.message = AppValues.empty,
    this.requestState = RequestState.loading,
  });

  @override
  List<Object> get props => [movie, message, requestState];
}
