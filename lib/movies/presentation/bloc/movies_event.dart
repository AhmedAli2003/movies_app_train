part of 'movies_bloc.dart';

abstract class MoviesEvent extends Equatable {
  const MoviesEvent();

  @override
  List<Object> get props => const [];
}

class GetNowPlayingMoviesEvent extends MoviesEvent {
  const GetNowPlayingMoviesEvent();
}

class GetPopularMoviesEvent extends MoviesEvent {
  const GetPopularMoviesEvent();
}

class GetTopRatedMoviesEvent extends MoviesEvent {
  const GetTopRatedMoviesEvent();
}
