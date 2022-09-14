// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detailed_movie_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailedMovieModel _$DetailedMovieModelFromJson(Map<String, dynamic> json) =>
    DetailedMovieModel(
      idM: json['id'] as int?,
      adultM: json['adult'] as bool?,
      budgetM: json['budget'] as int?,
      collectionM: json['belongs_to_collection'] == null
          ? null
          : MovieCollectionModel.fromJson(
              json['belongs_to_collection'] as Map<String, dynamic>),
      genresM: (json['genres'] as List<dynamic>?)
          ?.map((e) => GenreModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      homepageUrlM: json['homepage'] as String?,
      overviewM: json['overview'] as String?,
      posterPathM: json['poster_path'] as String?,
      productionCompaniesM: (json['production_companies'] as List<dynamic>?)
          ?.map(
              (e) => ProductionCompanyModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      releaseDateM: json['release_date'] as String?,
      revenueM: json['revenue'] as int?,
      runtimeM: json['runtime'] as int?,
      statusM: json['status'] as String?,
      titleM: json['title'] as String?,
      voteAverageM: (json['vote_average'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$DetailedMovieModelToJson(DetailedMovieModel instance) =>
    <String, dynamic>{
      'id': instance.idM,
      'title': instance.titleM,
      'adult': instance.adultM,
      'poster_path': instance.posterPathM,
      'belongs_to_collection': instance.collectionM?.toJson(),
      'budget': instance.budgetM,
      'genres': instance.genresM?.map((e) => e.toJson()).toList(),
      'overview': instance.overviewM,
      'homepage': instance.homepageUrlM,
      'production_companies':
          instance.productionCompaniesM?.map((e) => e.toJson()).toList(),
      'release_date': instance.releaseDateM,
      'revenue': instance.revenueM,
      'runtime': instance.runtimeM,
      'status': instance.statusM,
      'vote_average': instance.voteAverageM,
    };
