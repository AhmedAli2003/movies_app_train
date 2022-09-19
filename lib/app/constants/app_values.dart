import 'package:movies_app_train/movies/domain/entities/detailed_movie.dart';
import 'package:movies_app_train/movies/domain/entities/genre.dart';
import 'package:movies_app_train/movies/domain/entities/movie.dart';
import 'package:movies_app_train/movies/domain/entities/production_company.dart';
import 'package:movies_app_train/movies/data/models/detailed_movie_model.dart';

class AppValues {
  static const String strOrNull = '';
  static const int intOrNull = 0;
  static const double doubleOrNull = 0.0;
  static const bool boolOrNull = false;
  static const List<int> intListOrNull = [];
  static const List<Movie> moviesOrNull = [];
  static const List<Genre> genresOrNull = [];
  static const List<ProductionCompany> productionCompaniesOrNull = [];
  static const List<DetailedMovie> detailedMovies = [];
  static const List<DetailedMovieModel> detailedMovieModels = [];
  static const String empty = '';
  static const int zero = 0;
}
