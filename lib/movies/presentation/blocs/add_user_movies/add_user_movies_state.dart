part of 'add_user_movies_bloc.dart';

abstract class AddUserMoviesState extends Equatable {
  const AddUserMoviesState();
  
  @override
  List<Object> get props => [];
}

class AddUserMoviesInitial extends AddUserMoviesState {
  const AddUserMoviesInitial();
}

class FailureState extends AddUserMoviesState {
  final String errorMessage;
  const FailureState(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
