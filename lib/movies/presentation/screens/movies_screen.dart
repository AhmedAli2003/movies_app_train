import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app_train/app/network/request_state.dart';
import 'package:movies_app_train/movies/presentation/bloc/movies_bloc.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({super.key});

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  late final MoviesBloc moviesBloc;

  @override
  void initState() {
    super.initState();
    moviesBloc = BlocProvider.of<MoviesBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<MoviesBloc, MoviesState>(
          builder: (context, state) {
            if (state.nowPlayingRequestState == RequestState.loaded && state.popularRequestState == RequestState.loaded && state.topRatedRequestState == RequestState.loaded) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(state.nowPlayingMoviesInfo.movies[5].title),
                  Text(state.popularMoviesInfo.movies[5].title),
                  Text(state.topRatedMoviesInfo.movies[5].title),
                ],
              );
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
