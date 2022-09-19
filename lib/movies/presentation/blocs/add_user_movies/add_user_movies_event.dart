part of 'add_user_movies_bloc.dart';

abstract class AddUserMoviesEvent extends Equatable {
  final Movie movie;
  const AddUserMoviesEvent(this.movie);

  @override
  List<Object?> get props => [movie];
}

class AddToFavoriteEvent extends AddUserMoviesEvent {
  const AddToFavoriteEvent(super.movie);
}

class AddToWantToWatchEvent extends AddUserMoviesEvent {
  const AddToWantToWatchEvent(super.movie);
}

class AddToDontWantToWatchEvent extends AddUserMoviesEvent {
  const AddToDontWantToWatchEvent(super.movie);
}

class AddToWathcedEvent extends AddUserMoviesEvent {
  const AddToWathcedEvent(super.movie);
}

class RemoveFromFavoriteEvent extends AddUserMoviesEvent {
  const RemoveFromFavoriteEvent(super.movie);
}

class RemoveFromWantToWatchEvent extends AddUserMoviesEvent {
  const RemoveFromWantToWatchEvent(super.movie);
}

class RemoveFromDontWantToWatchEvent extends AddUserMoviesEvent {
  const RemoveFromDontWantToWatchEvent(super.movie);
}

class RemoveFromWathcedEvent extends AddUserMoviesEvent {
  const RemoveFromWathcedEvent(super.movie);
}
