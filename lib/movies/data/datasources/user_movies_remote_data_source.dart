import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:movies_app_train/app/constants/app_constants.dart';
import 'package:movies_app_train/app/constants/app_urls.dart';
import 'package:movies_app_train/movies/data/models/movie_model.dart';

abstract class UserMoviesRemoteDataSource {
  Future<Unit> addToFavorite(MovieModel movie);
  Future<Unit> addToWatched(MovieModel movie);
  Future<Unit> addToWantToWatch(MovieModel movie);
  Future<Unit> addToDontWantToWatch(MovieModel movie);
  Future<Unit> removeFromFavorite(MovieModel movie);
  Future<Unit> removeFromWatched(MovieModel movie);
  Future<Unit> removeFromWantToWatch(MovieModel movie);
  Future<Unit> removeFromDontWantToWatch(MovieModel movie);
  Future<List<MovieModel>> getFavorites();
  Future<List<MovieModel>> getWantToWatch();
  Future<List<MovieModel>> getDontWantToWatch();
  Future<List<MovieModel>> getWatched();
}

class UserMoviesRemoteDataSourceImpl implements UserMoviesRemoteDataSource {
  final _userId = FirebaseAuth.instance.currentUser!.uid;
  final _firestore = FirebaseFirestore.instance;

  @override
  Future<Unit> addToDontWantToWatch(MovieModel movie) async {
    await _firestore.collection(AppConstants.users).doc(_userId).update({
      AppJsonKeys.dontWantToWatch: FieldValue.arrayUnion([movie.toJson()]),
    });
    return unit;
  }

  @override
  Future<Unit> addToFavorite(MovieModel movie) async {
    await _firestore.collection(AppConstants.users).doc(_userId).update({
      AppJsonKeys.favorites: FieldValue.arrayUnion([movie.toJson()]),
    });
    return unit;
  }

  @override
  Future<Unit> addToWantToWatch(MovieModel movie) async {
    await _firestore.collection(AppConstants.users).doc(_userId).update({
      AppJsonKeys.wantToWatch: FieldValue.arrayUnion([movie.toJson()]),
    });
    return unit;
  }

  @override
  Future<Unit> addToWatched(MovieModel movie) async {
    await _firestore.collection(AppConstants.users).doc(_userId).update({
      AppJsonKeys.watched: FieldValue.arrayUnion([movie.toJson()]),
    });
    return unit;
  }

  @override
  Future<List<MovieModel>> getDontWantToWatch() async {
    final List<MovieModel> movies = [];
    final snapshot = await _firestore.collection(AppConstants.users).doc(_userId).get();
    for (Map<String, dynamic> json in snapshot[AppJsonKeys.dontWantToWatch]) {
      movies.add(MovieModel.fromJson(json));
    }
    return movies;
  }

  @override
  Future<List<MovieModel>> getFavorites() async {
    final List<MovieModel> movies = [];
    final snapshot = await _firestore.collection(AppConstants.users).doc(_userId).get();
    for (Map<String, dynamic> json in snapshot[AppJsonKeys.favorites]) {
      movies.add(MovieModel.fromJson(json));
    }
    return movies;
  }

  @override
  Future<List<MovieModel>> getWantToWatch() async {
    final List<MovieModel> movies = [];
    final snapshot = await _firestore.collection(AppConstants.users).doc(_userId).get();
    for (Map<String, dynamic> json in snapshot[AppJsonKeys.wantToWatch]) {
      movies.add(MovieModel.fromJson(json));
    }
    return movies;
  }

  @override
  Future<List<MovieModel>> getWatched() async {
    final List<MovieModel> movies = [];
    final snapshot = await _firestore.collection(AppConstants.users).doc(_userId).get();
    for (Map<String, dynamic> json in snapshot[AppJsonKeys.watched]) {
      movies.add(MovieModel.fromJson(json));
    }
    return movies;
  }
  
  @override
  Future<Unit> removeFromDontWantToWatch(MovieModel movie) async {
    await _firestore.collection(AppConstants.users).doc(_userId).update({
      AppJsonKeys.dontWantToWatch: FieldValue.arrayRemove([movie.toJson()]),
    });
    return unit;
  }
  
  @override
  Future<Unit> removeFromFavorite(MovieModel movie) async {
    await _firestore.collection(AppConstants.users).doc(_userId).update({
      AppJsonKeys.favorites: FieldValue.arrayRemove([movie.toJson()]),
    });
    return unit;
  }
  
  @override
  Future<Unit> removeFromWantToWatch(MovieModel movie) async {
    await _firestore.collection(AppConstants.users).doc(_userId).update({
      AppJsonKeys.wantToWatch: FieldValue.arrayRemove([movie.toJson()]),
    });
    return unit;
  }
  
  @override
  Future<Unit> removeFromWatched(MovieModel movie) async {
    await _firestore.collection(AppConstants.users).doc(_userId).update({
      AppJsonKeys.watched: FieldValue.arrayRemove([movie.toJson()]),
    });
    return unit;
  }
}
