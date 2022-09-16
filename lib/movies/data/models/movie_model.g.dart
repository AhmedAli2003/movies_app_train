// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieModel _$MovieModelFromJson(Map<String, dynamic> json) => MovieModel(
      idM: json['id'] as int?,
      titleM: json['title'] as String?,
      posterPathM: json['poster_path'] as String?,
      releaseDateM: json['release_date'] as String?,
      overviewM: json['overview'] as String?,
      voteAverageM: (json['vote_average'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$MovieModelToJson(MovieModel instance) =>
    <String, dynamic>{
      'id': instance.idM,
      'title': instance.titleM,
      'poster_path': instance.posterPathM,
      'release_date': instance.releaseDateM,
      'overview': instance.overviewM,
      'vote_average': instance.voteAverageM,
    };
