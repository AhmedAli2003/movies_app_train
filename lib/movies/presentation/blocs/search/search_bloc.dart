import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app_train/app/di.dart';
import 'package:movies_app_train/movies/domain/entities/movies_info.dart';
import 'package:movies_app_train/movies/domain/usecases/get_searched_movies_usecase.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(const SearchInitial()) {
    on<SearchEvent>((event, emit) async {
      final searchUsecase = getIt<GetSearchedMoviesUsecase>();
      final either = await searchUsecase(event.name, event.page);
      either.fold(
        (failure) => emit(FailureState(failure.errorMessage)),
        (moviesInfo) => emit(SearchedMoviesState(moviesInfo)),
      );
    });
  }
}
