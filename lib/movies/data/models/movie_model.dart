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

  const MovieModel({
    this.idM,
    this.titleM,
    this.posterPathM,
  }) : super(
          id: idM ?? AppValues.intOrNull,
          posterPath: posterPathM ?? AppValues.strOrNull,
          title: titleM ?? AppValues.strOrNull,
        );

  factory MovieModel.fromJson(Map<String, dynamic> json) => _$MovieModelFromJson(json);

  Map<String, dynamic> toJson() => _$MovieModelToJson(this);
}
