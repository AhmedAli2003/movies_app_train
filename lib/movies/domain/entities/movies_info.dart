import 'package:equatable/equatable.dart';
import 'package:movies_app_train/movies/domain/entities/movie.dart';

class MoviesInfo extends Equatable {
  final int currentPage;
  final int totalPages;
  final int totalMovies;
  final List<Movie> movies;

  const MoviesInfo({
    required this.currentPage,
    required this.totalPages,
    required this.totalMovies,
    required this.movies,
  });

  const MoviesInfo.getEmpty({
    this.currentPage = 0,
    this.totalPages = 0,
    this.totalMovies = 0,
    this.movies = const [],
  });

  @override
  List<Object?> get props => [
        currentPage,
        totalPages,
        totalMovies,
        movies,
      ];
}
