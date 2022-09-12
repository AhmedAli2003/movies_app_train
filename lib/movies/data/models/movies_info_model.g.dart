// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieInfoModel _$MovieInfoModelFromJson(Map<String, dynamic> json) =>
    MovieInfoModel(
      currentPageM: json['page'] as int?,
      totalMoviesM: json['total_results'] as int?,
      totalPagesM: json['total_pages'] as int?,
      moviesM: (json['results'] as List<dynamic>?)
          ?.map((e) => MovieModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MovieInfoModelToJson(MovieInfoModel instance) =>
    <String, dynamic>{
      'page': instance.currentPageM,
      'total_pages': instance.totalPagesM,
      'total_results': instance.totalMoviesM,
      'results': instance.moviesM?.map((e) => e.toJson()).toList(),
    };
