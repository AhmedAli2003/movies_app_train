// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieModel _$MovieModelFromJson(Map<String, dynamic> json) => MovieModel(
      idM: json['id'] as int?,
      titleM: json['title'] as String?,
      posterPathM: json['poster_path'] as String?,
      overviewM: json['overview'] as String?,
      originalLanguageM: json['original_language'] as String?,
      releaseDateM: json['release_date'] as String?,
      voteAverageM: (json['vote_average'] as num?)?.toDouble(),
      genreIdsM:
          (json['genre_ids'] as List<dynamic>?)?.map((e) => e as int).toList(),
    );

Map<String, dynamic> _$MovieModelToJson(MovieModel instance) =>
    <String, dynamic>{
      'id': instance.idM,
      'title': instance.titleM,
      'poster_path': instance.posterPathM,
      'overview': instance.overviewM,
      'original_language': instance.originalLanguageM,
      'release_date': instance.releaseDateM,
      'vote_average': instance.voteAverageM,
      'genre_ids': instance.genreIdsM,
    };
