import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:movies_app_train/app/constants/app_urls.dart';
import 'package:movies_app_train/app/constants/app_values.dart';
import 'package:movies_app_train/auth/domain/entities/app_user.dart';
import 'package:movies_app_train/movies/data/models/detailed_movie_model.dart';

part 'app_user_model.g.dart';

@JsonSerializable()
class AppUserModel extends AppUser {
  @JsonKey(name: AppJsonKeys.id)
  final String? idM;
  @JsonKey(name: AppJsonKeys.username)
  final String? usernameM;
  @JsonKey(name: AppJsonKeys.email)
  final String? emailM;
  @JsonKey(name: AppJsonKeys.password)
  final String? passwordM;
  @JsonKey(name: AppJsonKeys.favorites)
  final List<DetailedMovieModel>? favoritesM;
  @JsonKey(name: AppJsonKeys.watched)
  final List<DetailedMovieModel>? watchedM;
  @JsonKey(name: AppJsonKeys.wantToWatch)
  final List<DetailedMovieModel>? wantToWatchM;
  @JsonKey(name: AppJsonKeys.dontWantToWatch)
  final List<DetailedMovieModel>? dontWantToWatchM;

  const AppUserModel({
    required this.idM,
    required this.emailM,
    required this.passwordM,
    required this.usernameM,
    required this.favoritesM,
    required this.watchedM,
    required this.wantToWatchM,
    required this.dontWantToWatchM,
  }) : super(
          email: emailM ?? AppValues.strOrNull,
          id: idM ?? AppValues.strOrNull,
          favorites: favoritesM ?? AppValues.detailedMovies,
          password: passwordM ?? AppValues.strOrNull,
          username: usernameM ?? AppValues.strOrNull,
          watched: watchedM ?? AppValues.detailedMovies,
          wantToWatch: wantToWatchM ?? AppValues.detailedMovies,
          dontWantToWatch: dontWantToWatchM ?? AppValues.detailedMovies,
        );

  factory AppUserModel.fromJson(Map<String, dynamic> json) => _$AppUserModelFromJson(json);

  Map<String, dynamic> toJson() => _$AppUserModelToJson(this);

  factory AppUserModel.fromDocument(QueryDocumentSnapshot snapshot) {
    return AppUserModel(
      idM: snapshot[AppJsonKeys.id],
      emailM: snapshot[AppJsonKeys.email],
      passwordM: snapshot[AppJsonKeys.password],
      usernameM: snapshot[AppJsonKeys.username],
      favoritesM: snapshot[AppJsonKeys.favorites],
      watchedM: snapshot[AppJsonKeys.watched],
      wantToWatchM: snapshot[AppJsonKeys.wantToWatch],
      dontWantToWatchM: snapshot[AppJsonKeys.dontWantToWatch],
    );
  }
}
