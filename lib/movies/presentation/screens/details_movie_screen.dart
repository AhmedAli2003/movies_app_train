import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app_train/app/constants/app_constants.dart';
import 'package:movies_app_train/app/general_ui/shimmer_loading_widget.dart';
import 'package:movies_app_train/app/general_ui/simple_loading.dart';
import 'package:movies_app_train/app/network/request_state.dart';
import 'package:movies_app_train/movies/domain/entities/movie.dart';
import 'package:movies_app_train/movies/presentation/blocs/add_user_movies/add_user_movies_bloc.dart';
import 'package:movies_app_train/movies/presentation/blocs/get_user_movies/get_user_movies_bloc.dart';
import 'package:movies_app_train/movies/presentation/blocs/movie_details/movie_details_bloc.dart';
import 'package:movies_app_train/movies/presentation/widgets/custom_grid_view_widget.dart';
import 'package:movies_app_train/movies/presentation/widgets/custom_sliver_app_bar.dart';
import 'package:movies_app_train/movies/presentation/widgets/date_genres_runtime_line_widget.dart';
import 'package:movies_app_train/movies/presentation/widgets/overview_text_widget.dart';
import 'package:movies_app_train/movies/presentation/widgets/rating_row_widget.dart';
import 'package:movies_app_train/movies/presentation/widgets/similar_shows_title.dart';

class DetailsMovieScreen extends StatefulWidget {
  const DetailsMovieScreen({super.key});

  @override
  State<DetailsMovieScreen> createState() => _DetailsMovieScreenState();
}

class _DetailsMovieScreenState extends State<DetailsMovieScreen> {
  late final UserMoviesBloc _userMoviesBloc;
  late final AddUserMoviesBloc _addUserMoviesBloc;
  List<Movie> _favoriteMovies = [];
  List<Movie> _wantToWatchMovies = [];
  List<Movie> _watcedMovies = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _userMoviesBloc = BlocProvider.of<UserMoviesBloc>(context);
    _addUserMoviesBloc = BlocProvider.of<AddUserMoviesBloc>(context);
    _userMoviesBloc.add(const GetFavoritesEvent());
    _userMoviesBloc.add(const GetWantToWatchEvent());
    _userMoviesBloc.add(const GetWatchedEvent());
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final int id = args[AppConstants.id];
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          CustomSliverAppBar(args: args),
          SliverToBoxAdapter(
            child: FadeInUp(
              from: 50,
              duration: const Duration(milliseconds: 500),
              child: Column(
                children: [
                  BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
                    bloc: MovieDetailsBloc()
                      ..add(MovieDetailsEvent(id))
                      ..add(SimilarMoviesEvent(id)),
                    builder: (context, similarState) {
                      if (similarState.requestState == RequestState.loaded && similarState.similarMoviesRequestState == RequestState.loaded) {
                        final movie = similarState.movie;
                        final movieModel = movie.toMovieEntity().toModel();

                        return BlocBuilder<UserMoviesBloc, UserMoviesState>(
                          builder: (context, state) {
                            if (state.favoriteMoviesState == RequestState.loaded &&
                                state.wantToWatchMoviesState == RequestState.loaded &&
                                state.watchedMoviesState == RequestState.loaded) {
                              _favoriteMovies = state.favoriteMovies;
                              _wantToWatchMovies = state.wantToWatchMovies;
                              _watcedMovies = state.watchedMovies;
                              final bool inFavorite = _favoriteMovies.contains(movieModel);
                              print(inFavorite);
                              print(_favoriteMovies);
                              print(movieModel);
                              final bool inWantToWatch = _wantToWatchMovies.contains(movieModel);
                              final bool inWatched = _watcedMovies.contains(movieModel);

                              return Center(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 16),
                                    DataGenresTimeLineWidget(releaseDate: movie.releaseDate, runtime: movie.runtime, genres: movie.genres),
                                    RatingRowWidget(voteAverage: movie.voteAverage),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            if (inWatched) {
                                              _addUserMoviesBloc.add(RemoveFromWathcedEvent(movieModel));
                                            } else {
                                              _addUserMoviesBloc.add(AddToWathcedEvent(movieModel));
                                            }
                                            _userMoviesBloc.add(const GetWatchedEvent());
                                          },
                                          icon: inWatched
                                              ? const Icon(
                                                  Icons.highlight_remove_rounded,
                                                )
                                              : const Icon(
                                                  Icons.add_task_rounded,
                                                ),
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            if (inWantToWatch) {
                                              _addUserMoviesBloc.add(RemoveFromWantToWatchEvent(movieModel));
                                            } else {
                                              _addUserMoviesBloc.add(AddToWantToWatchEvent(movieModel));
                                            }
                                            _userMoviesBloc.add(const GetWantToWatchEvent());
                                          },
                                          icon: inWantToWatch
                                              ? const Icon(
                                                  Icons.playlist_add_check_rounded,
                                                )
                                              : const Icon(
                                                  Icons.playlist_add_rounded,
                                                ),
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            if (inFavorite) {
                                              _addUserMoviesBloc.add(RemoveFromFavoriteEvent(movieModel));
                                            } else {
                                              _addUserMoviesBloc.add(AddToFavoriteEvent(movieModel));
                                            }
                                            _userMoviesBloc.add(const GetFavoritesEvent());
                                          },
                                          icon: inFavorite
                                              ? const Icon(
                                                  Icons.favorite_rounded,
                                                  color: Colors.red,
                                                )
                                              : const Icon(
                                                  Icons.favorite_border_rounded,
                                                ),
                                        ),
                                      ],
                                    ),
                                    OverviewTextWidget(overview: movie.overview),
                                    const SizedBox(height: 16),
                                    const Divider(color: Colors.grey, height: 2, indent: 28, endIndent: 28, thickness: 0.8),
                                    const SimilarShowsTitle(),
                                    CustomGridView(movies: similarState.similarMovies.movies),
                                  ],
                                ),
                              );
                            } else {
                              return const SimpleLoading(color: Colors.white);
                            }
                          },
                        );
                      }
                      return const ShimmerLoadingWidget();
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
