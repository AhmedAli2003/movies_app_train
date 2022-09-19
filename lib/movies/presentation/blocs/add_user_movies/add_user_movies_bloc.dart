import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app_train/app/di.dart';
import 'package:movies_app_train/movies/domain/entities/movie.dart';
import 'package:movies_app_train/movies/domain/usecases/add_to_dont_want_to_watch_usecase.dart';
import 'package:movies_app_train/movies/domain/usecases/add_to_favorite_usecase.dart';
import 'package:movies_app_train/movies/domain/usecases/add_to_want_to_watch_usecase.dart';
import 'package:movies_app_train/movies/domain/usecases/add_to_watched_usecase.dart';
import 'package:movies_app_train/movies/domain/usecases/remove_from_dont_want_to_watch_usecase.dart';
import 'package:movies_app_train/movies/domain/usecases/remove_from_favorite_usecase.dart';
import 'package:movies_app_train/movies/domain/usecases/remove_from_want_to_watch_usecase.dart';
import 'package:movies_app_train/movies/domain/usecases/remove_from_watched_usecase.dart';

part 'add_user_movies_event.dart';
part 'add_user_movies_state.dart';

class AddUserMoviesBloc extends Bloc<AddUserMoviesEvent, AddUserMoviesState> {
  AddUserMoviesBloc() : super(const AddUserMoviesInitial()) {
    on<AddToFavoriteEvent>((event, emit) async {
      final addToFavorite = getIt<AddToFavoriteUsecase>();
      final either = await addToFavorite(event.movie);
      either.fold(
        (failure) => emit(FailureState(failure.errorMessage)),
        (_) => null,
      );
    });

    on<AddToWantToWatchEvent>((event, emit) async {
      final addToWantToWatch = getIt<AddToWantToWatchUsecase>();
      final either = await addToWantToWatch(event.movie);
      either.fold(
        (failure) => emit(FailureState(failure.errorMessage)),
        (_) => null,
      );
    });

    on<AddToDontWantToWatchEvent>((event, emit) async {
      final addToDontWantToWatch = getIt<AddToDontWantToWatchUsecase>();
      final either = await addToDontWantToWatch(event.movie);
      either.fold(
        (failure) => emit(FailureState(failure.errorMessage)),
        (_) => null,
      );
    });

    on<AddToWathcedEvent>((event, emit) async {
      final addToWatched = getIt<AddToWathcedUsecase>();
      final either = await addToWatched(event.movie);
      either.fold(
        (failure) => emit(FailureState(failure.errorMessage)),
        (_) => null,
      );
    });

    on<RemoveFromFavoriteEvent>((event, emit) async {
      final removeFromFavorite = getIt<RemoveFromFavoriteUsecase>();
      final either = await removeFromFavorite(event.movie);
      either.fold(
        (failure) => emit(FailureState(failure.errorMessage)),
        (_) => null,
      );
    });

    on<RemoveFromWantToWatchEvent>((event, emit) async {
      final removeFromWantToWatch = getIt<RemoveFromWantToWatchUsecase>();
      final either = await removeFromWantToWatch(event.movie);
      either.fold(
        (failure) => emit(FailureState(failure.errorMessage)),
        (_) => null,
      );
    });

    on<RemoveFromDontWantToWatchEvent>((event, emit) async {
      final removeFromDontWantToWatch = getIt<RemoveFromDontWantToWatchUsecase>();
      final either = await removeFromDontWantToWatch(event.movie);
      either.fold(
        (failure) => emit(FailureState(failure.errorMessage)),
        (_) => null,
      );
    });

    on<RemoveFromWathcedEvent>((event, emit) async {
      final removeFromWatched = getIt<RemoveFromWathcedUsecase>();
      final either = await removeFromWatched(event.movie);
      either.fold(
        (failure) => emit(FailureState(failure.errorMessage)),
        (_) => null,
      );
    });
  }
}
