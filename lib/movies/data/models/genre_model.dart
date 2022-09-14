import 'package:json_annotation/json_annotation.dart';
import 'package:movies_app_train/app/constants/app_urls.dart';
import 'package:movies_app_train/app/constants/app_values.dart';
import 'package:movies_app_train/movies/domain/entities/genre.dart';

part 'genre_model.g.dart';

@JsonSerializable()
class GenreModel extends Genre {
  @JsonKey(name: AppJsonKeys.id)
  final int? idM;
  @JsonKey(name: AppJsonKeys.name)
  final String? nameM;

  const GenreModel({required this.idM, required this.nameM})
      : super(
          id: idM ?? AppValues.intOrNull,
          name: nameM ?? AppValues.strOrNull,
        );

  factory GenreModel.fromJson(Map<String, dynamic> json) => _$GenreModelFromJson(json);
  Map<String, dynamic> toJson() => _$GenreModelToJson(this);
}
