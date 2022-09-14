import 'package:json_annotation/json_annotation.dart';
import 'package:movies_app_train/app/constants/app_urls.dart';
import 'package:movies_app_train/app/constants/app_values.dart';
import 'package:movies_app_train/movies/domain/entities/detailed_movie.dart';
import 'package:movies_app_train/movies/data/models/genre_model.dart';
import 'package:movies_app_train/movies/data/models/production_company_model.dart';
import 'package:movies_app_train/movies/data/models/movie_collection_model.dart';
import 'package:movies_app_train/movies/domain/entities/movie_collection.dart';

part 'detailed_movie_model.g.dart';

@JsonSerializable(explicitToJson: true)
class DetailedMovieModel extends DetailedMovie {
  @JsonKey(name: AppJsonKeys.id)
  final int? idM;
  @JsonKey(name: AppJsonKeys.title)
  final String? titleM;
  @JsonKey(name: AppJsonKeys.adult)
  final bool? adultM;
  @JsonKey(name: AppJsonKeys.posterPath)
  final String? posterPathM;
  @JsonKey(name: AppJsonKeys.collection)
  final MovieCollectionModel? collectionM;
  @JsonKey(name: AppJsonKeys.budget)
  final int? budgetM;
  @JsonKey(name: AppJsonKeys.genres)
  final List<GenreModel>? genresM;
  @JsonKey(name: AppJsonKeys.overview)
  final String? overviewM;
  @JsonKey(name: AppJsonKeys.homepage)
  final String? homepageUrlM;
  @JsonKey(name: AppJsonKeys.productionCompanies)
  final List<ProductionCompanyModel>? productionCompaniesM;
  @JsonKey(name: AppJsonKeys.releaseDate)
  final String? releaseDateM;
  @JsonKey(name: AppJsonKeys.revenue)
  final int? revenueM;
  @JsonKey(name: AppJsonKeys.runtime)
  final int? runtimeM;
  @JsonKey(name: AppJsonKeys.status)
  final String? statusM;
  @JsonKey(name: AppJsonKeys.voteAverage)
  final double? voteAverageM;

  const DetailedMovieModel({
    required this.idM,
    required this.adultM,
    required this.budgetM,
    required this.collectionM,
    required this.genresM,
    required this.homepageUrlM,
    required this.overviewM,
    required this.posterPathM,
    required this.productionCompaniesM,
    required this.releaseDateM,
    required this.revenueM,
    required this.runtimeM,
    required this.statusM,
    required this.titleM,
    required this.voteAverageM,
  }) : super(
    adult: adultM ?? AppValues.boolOrNull,
    budget: budgetM ?? AppValues.intOrNull,
    collection: collectionM ?? const MovieCollection.empty(),
    genres: genresM ?? AppValues.genresOrNull,
    homepageUrl: homepageUrlM ?? AppValues.strOrNull,
    id: idM ?? AppValues.intOrNull,
    overview: overviewM ?? AppValues.strOrNull,
    posterPath: posterPathM ?? AppValues.strOrNull,
    productionCompanies: productionCompaniesM ?? AppValues.productionCompaniesOrNull,
    releaseDate: releaseDateM ?? AppValues.strOrNull,
    revenue: revenueM ?? AppValues.intOrNull,
    runtime: runtimeM ?? AppValues.intOrNull,
    status: statusM ?? AppValues.strOrNull,
    title: titleM ?? AppValues.strOrNull,
    voteAverage: voteAverageM ?? AppValues.doubleOrNull,
  );

  factory DetailedMovieModel.fromJson(Map<String, dynamic> json) => _$DetailedMovieModelFromJson(json);
  Map<String, dynamic> toJson() => _$DetailedMovieModelToJson(this);
}
