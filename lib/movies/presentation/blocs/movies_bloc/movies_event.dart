part of 'movies_bloc.dart';

abstract class MoviesEvent extends Equatable {
  final int page;
  const MoviesEvent(this.page);

  @override
  List<Object> get props => const [];
}

class GetNowPlayingMoviesEvent extends MoviesEvent {
  const GetNowPlayingMoviesEvent(super.page);
}

class GetPopularMoviesEvent extends MoviesEvent {
  const GetPopularMoviesEvent(super.page);
}

class GetTopRatedMoviesEvent extends MoviesEvent {
  const GetTopRatedMoviesEvent(super.page);
}

class GetUpcomingMoviesEvent extends MoviesEvent {
  const GetUpcomingMoviesEvent(super.page);
}
