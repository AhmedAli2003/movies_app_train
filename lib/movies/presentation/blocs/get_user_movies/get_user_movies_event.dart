part of 'get_user_movies_bloc.dart';

abstract class UserMoviesEvent extends Equatable {
  const UserMoviesEvent();

  @override
  List<Object?> get props => [];
}

class GetFavoritesEvent extends UserMoviesEvent {
  const GetFavoritesEvent();
}
class GetWantToWatchEvent extends UserMoviesEvent {
  const GetWantToWatchEvent();
}
class GetDontWantToWatchEvent extends UserMoviesEvent {
  const GetDontWantToWatchEvent();
}
class GetWatchedEvent extends UserMoviesEvent {
  const GetWatchedEvent();
}
