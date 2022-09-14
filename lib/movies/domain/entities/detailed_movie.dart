import 'package:equatable/equatable.dart';
import 'package:movies_app_train/app/constants/app_values.dart';
import 'package:movies_app_train/movies/domain/entities/genre.dart';
import 'package:movies_app_train/movies/domain/entities/movie_collection.dart';
import 'package:movies_app_train/movies/domain/entities/production_company.dart';

class DetailedMovie extends Equatable {
  final int id;
  final String title;
  final bool adult;
  final String posterPath;
  final MovieCollection collection;
  final int budget;
  final List<Genre> genres;
  final String overview;
  final String homepageUrl;
  final List<ProductionCompany> productionCompanies;
  final String releaseDate;
  final int revenue;
  final int runtime;
  final String status;
  final double voteAverage;

  const DetailedMovie({
    required this.id,
    required this.title,
    required this.adult,
    required this.posterPath,
    required this.collection,
    required this.budget,
    required this.genres,
    required this.overview,
    required this.homepageUrl,
    required this.productionCompanies,
    required this.releaseDate,
    required this.revenue,
    required this.runtime,
    required this.status,
    required this.voteAverage,
  });

  const DetailedMovie.empty({
    this.adult = AppValues.boolOrNull,
    this.budget = AppValues.zero,
    this.collection = const MovieCollection.empty(),
    this.genres = AppValues.genresOrNull,
    this.homepageUrl = AppValues.empty,
    this.id = AppValues.zero,
    this.overview = AppValues.empty,
    this.posterPath = AppValues.empty,
    this.productionCompanies = AppValues.productionCompaniesOrNull,
    this.releaseDate = AppValues.empty,
    this.revenue = AppValues.zero,
    this.runtime = AppValues.zero,
    this.status = AppValues.empty,
    this.title = AppValues.empty,
    this.voteAverage = AppValues.doubleOrNull,
  });

  @override
  List<Object?> get props => [id];
}
