part of 'get_user_movies_bloc.dart';

class UserMoviesState extends Equatable {
  final List<Movie> favoriteMovies;
  final List<Movie> wantToWatchMovies;
  final List<Movie> dontWantToWatchMovies;
  final List<Movie> watchedMovies;
  final RequestState favoriteMoviesState;
  final RequestState wantToWatchMoviesState;
  final RequestState dontWantToWatchMoviesState;
  final RequestState watchedMoviesState;
  final String favoriteMoviesErrorMessage;
  final String wantToWatchMoviesErrorMessage;
  final String dontWantToWatchMoviesErrorMessage;
  final String watchedMoviesErrorMessage;
  const UserMoviesState({
    this.dontWantToWatchMovies = AppValues.moviesOrNull,
    this.favoriteMovies = AppValues.moviesOrNull,
    this.wantToWatchMovies = AppValues.moviesOrNull,
    this.watchedMovies = AppValues.moviesOrNull,
    this.favoriteMoviesState = RequestState.loading,
    this.wantToWatchMoviesState = RequestState.loading,
    this.watchedMoviesState = RequestState.loading,
    this.dontWantToWatchMoviesState = RequestState.loading,
    this.dontWantToWatchMoviesErrorMessage = AppValues.empty,
    this.favoriteMoviesErrorMessage = AppValues.empty,
    this.wantToWatchMoviesErrorMessage = AppValues.empty,
    this.watchedMoviesErrorMessage = AppValues.empty,
  });

  UserMoviesState copyWith({
    List<Movie>? favoriteMovies,
    List<Movie>? wantToWatchMovies,
    List<Movie>? dontWantToWatchMovies,
    List<Movie>? watchedMovies,
    RequestState? favoriteMoviesState,
    RequestState? wantToWatchMoviesState,
    RequestState? dontWantToWatchMoviesState,
    RequestState? watchedMoviesState,
    String? favoriteMoviesErrorMessage,
    String? wantToWatchMoviesErrorMessage,
    String? dontWantToWatchMoviesErrorMessage,
    String? watchedMoviesErrorMessage,
  }) {
    return UserMoviesState(
      dontWantToWatchMovies: dontWantToWatchMovies ?? this.dontWantToWatchMovies,
      dontWantToWatchMoviesState: dontWantToWatchMoviesState ?? this.dontWantToWatchMoviesState,
      favoriteMovies: favoriteMovies ?? this.favoriteMovies,
      favoriteMoviesState: favoriteMoviesState ?? this.favoriteMoviesState,
      wantToWatchMovies: wantToWatchMovies ?? this.wantToWatchMovies,
      wantToWatchMoviesState: wantToWatchMoviesState ?? this.wantToWatchMoviesState,
      watchedMovies: watchedMovies ?? this.watchedMovies,
      watchedMoviesState: watchedMoviesState ?? this.watchedMoviesState,
      dontWantToWatchMoviesErrorMessage: dontWantToWatchMoviesErrorMessage ?? this.dontWantToWatchMoviesErrorMessage,
      favoriteMoviesErrorMessage: favoriteMoviesErrorMessage ?? this.favoriteMoviesErrorMessage,
      wantToWatchMoviesErrorMessage: wantToWatchMoviesErrorMessage ?? this.wantToWatchMoviesErrorMessage,
      watchedMoviesErrorMessage: watchedMoviesErrorMessage ?? this.watchedMoviesErrorMessage,
    );
  }

  @override
  List<Object> get props => [
        favoriteMovies,
        wantToWatchMovies,
        dontWantToWatchMovies,
        watchedMovies,
        favoriteMoviesState,
        wantToWatchMoviesState,
        dontWantToWatchMoviesState,
        watchedMoviesState,
        favoriteMoviesErrorMessage,
        wantToWatchMoviesErrorMessage,
        dontWantToWatchMoviesErrorMessage,
        watchedMoviesErrorMessage,
      ];
}
