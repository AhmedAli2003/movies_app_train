import 'package:json_annotation/json_annotation.dart';
import 'package:movies_app_train/app/constants/app_urls.dart';
import 'package:movies_app_train/app/constants/app_values.dart';
import 'package:movies_app_train/movies/domain/entities/movies_info.dart';
import  './movie_model.dart';

part 'movies_info_model.g.dart';

@JsonSerializable(explicitToJson: true)
class MovieInfoModel extends MoviesInfo {
  @JsonKey(name: AppJsonKeys.currentPage)
  final int? currentPageM;
  @JsonKey(name: AppJsonKeys.totalPages)
  final int? totalPagesM;
  @JsonKey(name: AppJsonKeys.totalMovies)
  final int? totalMoviesM;
  @JsonKey(name: AppJsonKeys.movies)
  final List<MovieModel>? moviesM;

  const MovieInfoModel({
    this.currentPageM,
    this.totalMoviesM,
    this.totalPagesM,
    this.moviesM,
  }) : super(
    currentPage: currentPageM ?? AppValues.intOrNull,
    totalMovies: totalMoviesM ?? AppValues.intOrNull,
    totalPages: totalPagesM ?? AppValues.intOrNull,
    movies: moviesM ?? AppValues.movieOrNull,
  );

  factory MovieInfoModel.fromJson(Map<String, dynamic> json) => _$MovieInfoModelFromJson(json);
  Map<String, dynamic> toJson() => _$MovieInfoModelToJson(this);
}
