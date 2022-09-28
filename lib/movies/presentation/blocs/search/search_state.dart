part of 'search_bloc.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class SearchInitial extends SearchState {
  const SearchInitial();
}

class SearchedMoviesState extends SearchState {
  final MoviesInfo moviesInfo;
  const SearchedMoviesState(this.moviesInfo);

  @override
  List<Object> get props => [moviesInfo];
}

class FailureState extends SearchState {
  final String message;
  const FailureState(this.message);

  @override
  List<Object> get props => [message];
}
