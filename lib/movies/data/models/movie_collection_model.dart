import 'package:json_annotation/json_annotation.dart';
import 'package:movies_app_train/app/constants/app_urls.dart';
import 'package:movies_app_train/app/constants/app_values.dart';
import 'package:movies_app_train/movies/domain/entities/movie_collection.dart';

part 'movie_collection_model.g.dart';

@JsonSerializable()
class MovieCollectionModel extends MovieCollection {
  @JsonKey(name: AppJsonKeys.id)
  final int? idM;
  @JsonKey(name: AppJsonKeys.name)
  final String? nameM;
  @JsonKey(name: AppJsonKeys.posterPath)
  final String? posterPathM;

  const MovieCollectionModel({
    required this.idM,
    required this.nameM,
    required this.posterPathM,
  }) : super(
          id: idM ?? AppValues.intOrNull,
          name: nameM ?? AppValues.strOrNull,
          posterPath: posterPathM ?? AppValues.strOrNull,
        );

  factory MovieCollectionModel.fromJson(Map<String, dynamic> json) => _$MovieCollectionModelFromJson(json);
  Map<String, dynamic> toJson() => _$MovieCollectionModelToJson(this);
}
