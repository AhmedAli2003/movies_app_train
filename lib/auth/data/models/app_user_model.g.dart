// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppUserModel _$AppUserModelFromJson(Map<String, dynamic> json) => AppUserModel(
      idM: json['id'] as String?,
      emailM: json['email'] as String?,
      passwordM: json['password'] as String?,
      usernameM: json['username'] as String?,
      favoritesM: (json['favorites'] as List<dynamic>?)
          ?.map((e) => DetailedMovieModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      watchedM: (json['watched'] as List<dynamic>?)
          ?.map((e) => DetailedMovieModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      wantToWatchM: (json['want_to_watch'] as List<dynamic>?)
          ?.map((e) => DetailedMovieModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      dontWantToWatchM: (json['dont_want_to_watch'] as List<dynamic>?)
          ?.map((e) => DetailedMovieModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AppUserModelToJson(AppUserModel instance) =>
    <String, dynamic>{
      'id': instance.idM,
      'username': instance.usernameM,
      'email': instance.emailM,
      'password': instance.passwordM,
      'favorites': instance.favoritesM,
      'watched': instance.watchedM,
      'want_to_watch': instance.wantToWatchM,
      'dont_want_to_watch': instance.dontWantToWatchM,
    };
