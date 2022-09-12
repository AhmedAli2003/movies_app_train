import 'package:json_annotation/json_annotation.dart';
import 'package:movies_app_train/app/constants/app_urls.dart';
import 'package:movies_app_train/app/constants/app_values.dart';
import 'package:movies_app_train/movies/domain/entities/movie.dart';

part 'movie_model.g.dart';

@JsonSerializable()
class MovieModel extends Movie {
  @JsonKey(name: AppJsonKeys.id)
  final int? idM;
  @JsonKey(name: AppJsonKeys.title)
  final String? titleM;
  @JsonKey(name: AppJsonKeys.posterPath)
  final String? posterPathM;
  @JsonKey(name: AppJsonKeys.overview)
  final String? overviewM;
  @JsonKey(name: AppJsonKeys.originalLanguage)
  final String? originalLanguageM;
  @JsonKey(name: AppJsonKeys.releaseDate)
  final String? releaseDateM;
  @JsonKey(name: AppJsonKeys.voteAverage)
  final double? voteAverageM;
  @JsonKey(name: AppJsonKeys.genereIds)
  final List<int>? genreIdsM;

  const MovieModel({
    this.idM,
    this.titleM,
    this.posterPathM,
    this.overviewM,
    this.originalLanguageM,
    this.releaseDateM,
    this.voteAverageM,
    this.genreIdsM,
  }) : super(
          id: idM ?? AppValues.intOrNull,
          genreIds: genreIdsM ?? AppValues.intListOrNull,
          originalLanguage: originalLanguageM ?? AppValues.strOrNull,
          overview: overviewM ?? AppValues.strOrNull,
          posterPath: posterPathM ?? AppValues.strOrNull,
          releaseDate: releaseDateM ?? AppValues.strOrNull,
          title: titleM ?? AppValues.strOrNull,
          voteAverage: voteAverageM ?? AppValues.doubleOrNull,
        );

  factory MovieModel.fromJson(Map<String, dynamic> json) => _$MovieModelFromJson(json);

  Map<String, dynamic> toJson() => _$MovieModelToJson(this);
}
