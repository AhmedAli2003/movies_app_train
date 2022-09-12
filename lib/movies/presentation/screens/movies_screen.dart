import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:movies_app_train/app/network/internet_connection.dart';
import 'package:movies_app_train/movies/data/repositories/movies_repository_impl.dart';
import 'package:movies_app_train/movies/domain/entities/movies_info.dart';
import 'package:movies_app_train/movies/domain/usecases/get_now_playing_movies_usercase.dart';
import '../../data/datasources/movie_remote_data_source.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({super.key});

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {

  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    final result = await GetNowPlayingMoviesUsecase(
      MoviesRepositoryImpl(MovieRemoteDataSource(Dio()), InternetConnectionImpl())
    ).call(2);
    MoviesInfo? info;
    result.fold((l) => print, (r) => info = r);
    print(info!.movies[0]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
