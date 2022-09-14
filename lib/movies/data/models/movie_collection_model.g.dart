// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_collection_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieCollectionModel _$MovieCollectionModelFromJson(
        Map<String, dynamic> json) =>
    MovieCollectionModel(
      idM: json['id'] as int?,
      nameM: json['name'] as String?,
      posterPathM: json['poster_path'] as String?,
    );

Map<String, dynamic> _$MovieCollectionModelToJson(
        MovieCollectionModel instance) =>
    <String, dynamic>{
      'id': instance.idM,
      'name': instance.nameM,
      'poster_path': instance.posterPathM,
    };
