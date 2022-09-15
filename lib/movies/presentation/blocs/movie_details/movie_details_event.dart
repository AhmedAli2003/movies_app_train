part of 'movie_details_bloc.dart';

abstract class BaseMovieDetailsEvent extends Equatable {
  final int id;
  const BaseMovieDetailsEvent(this.id);

  @override
  List<Object> get props => [id];
}

class MovieDetailsEvent extends BaseMovieDetailsEvent {
  const MovieDetailsEvent(super.id);
}

class SimilarMoviesEvent extends BaseMovieDetailsEvent {
  const SimilarMoviesEvent(super.id);
}
