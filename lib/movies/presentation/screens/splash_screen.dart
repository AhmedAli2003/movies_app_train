import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app_train/app/constants/app_constants.dart';
import 'package:movies_app_train/app/network/request_state.dart';
import 'package:movies_app_train/app/router/app_routes.dart';
import 'package:movies_app_train/movies/presentation/bloc/movies_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;
  late final MoviesBloc moviesBloc;

  _startDelay() {
    _timer = Timer(const Duration(seconds: AppConstants.splashScreenDuration), _goNext);
  }

  _goNext() {
    Navigator.pushReplacementNamed(context, AppRoutes.moviesScreen);
  }

  @override
  void initState() {
    super.initState();
    moviesBloc = BlocProvider.of<MoviesBloc>(context);
    moviesBloc
      ..add(const GetNowPlayingMoviesEvent())
      ..add(const GetPopularMoviesEvent())
      ..add(const GetTopRatedMoviesEvent());
    _startDelay();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<MoviesBloc, MoviesState>(
        listener: (context, state) {
          if (state.nowPlayingRequestState == RequestState.loaded && state.popularRequestState == RequestState.loaded && state.topRatedRequestState == RequestState.loaded) {
            _goNext();
          }
        },
        child: const Center(
          child: Text('Loading...'),
        ),
      ),
    );
  }
}
