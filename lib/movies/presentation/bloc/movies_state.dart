part of 'movies_bloc.dart';

class MoviesState extends Equatable {
  final MoviesInfo nowPlayingMoviesInfo;
  final RequestState nowPlayingRequestState;
  final String nowPlayingErrorMessage;
  final MoviesInfo popularMoviesInfo;
  final RequestState popularRequestState;
  final String popularErrorMessage;
  final MoviesInfo topRatedMoviesInfo;
  final RequestState topRatedRequestState;
  final String topRatedErrorMessage;
  final MoviesInfo upcomingMoviesInfo;
  final RequestState upcomingRequestState;
  final String upcomingErrorMessage;
  const MoviesState({
    this.nowPlayingMoviesInfo = const MoviesInfo.getEmpty(),
    this.nowPlayingRequestState = RequestState.loading,
    this.nowPlayingErrorMessage = AppValues.empty,
    this.popularMoviesInfo = const MoviesInfo.getEmpty(),
    this.popularRequestState = RequestState.loading,
    this.popularErrorMessage = AppValues.empty,
    this.topRatedMoviesInfo = const MoviesInfo.getEmpty(),
    this.topRatedRequestState = RequestState.loading,
    this.topRatedErrorMessage = AppValues.empty,
    this.upcomingMoviesInfo = const MoviesInfo.getEmpty(),
    this.upcomingRequestState = RequestState.loading,
    this.upcomingErrorMessage = AppValues.empty,
  });

  MoviesState copyWith({
    MoviesInfo? nowPlayingMoviesInfo,
    RequestState? nowPlayingRequestState,
    String? nowPlayingErrorMessage,
    MoviesInfo? popularMoviesInfo,
    RequestState? popularRequestState,
    String? popularErrorMessage,
    MoviesInfo? topRatedMoviesInfo,
    RequestState? topRatedRequestState,
    String? topRatedErrorMessage,
    MoviesInfo? upcomingMoviesInfo,
    RequestState? upcomingRequestState,
    String? upcomingErrorMessage,
  }) {
    return MoviesState(
      nowPlayingMoviesInfo: nowPlayingMoviesInfo ?? this.nowPlayingMoviesInfo ,
      nowPlayingRequestState: nowPlayingRequestState ?? this.nowPlayingRequestState,
      nowPlayingErrorMessage: nowPlayingErrorMessage ?? this.nowPlayingErrorMessage,
      popularMoviesInfo: popularMoviesInfo ?? this.popularMoviesInfo,
      popularRequestState: popularRequestState ?? this.popularRequestState,
      popularErrorMessage: popularErrorMessage ?? this.popularErrorMessage,
      topRatedMoviesInfo: topRatedMoviesInfo ?? this.topRatedMoviesInfo,
      topRatedRequestState: topRatedRequestState ?? this.topRatedRequestState,
      topRatedErrorMessage: topRatedErrorMessage ?? this.topRatedErrorMessage,
      upcomingMoviesInfo: upcomingMoviesInfo ?? this.upcomingMoviesInfo,
      upcomingRequestState: upcomingRequestState ?? this.upcomingRequestState,
      upcomingErrorMessage: upcomingErrorMessage ?? this.upcomingErrorMessage,
    );
  }
  @override
  List<Object?> get props => [
    nowPlayingMoviesInfo,
    nowPlayingRequestState,
    nowPlayingErrorMessage,
    popularMoviesInfo,
    popularRequestState,
    popularErrorMessage,
    topRatedMoviesInfo,
    topRatedRequestState,
    topRatedErrorMessage,
    upcomingMoviesInfo,
    upcomingRequestState,
    upcomingErrorMessage,
  ];
}
