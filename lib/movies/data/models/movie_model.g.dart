// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieModel _$MovieModelFromJson(Map<String, dynamic> json) => MovieModel(
      idM: json['id'] as int?,
      titleM: json['title'] as String?,
      posterPathM: json['poster_path'] as String?,
    );

Map<String, dynamic> _$MovieModelToJson(MovieModel instance) =>
    <String, dynamic>{
      'id': instance.idM,
      'title': instance.titleM,
      'poster_path': instance.posterPathM,
    };
