import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app_train/app/constants/app_constants.dart';
import 'package:movies_app_train/app/general_ui/list_empty_widget.dart';
import 'package:movies_app_train/app/general_ui/simple_loading.dart';
import 'package:movies_app_train/app/network/request_state.dart';
import 'package:movies_app_train/movies/domain/entities/movie.dart';
import 'package:movies_app_train/movies/presentation/blocs/add_user_movies/add_user_movies_bloc.dart';
import 'package:movies_app_train/movies/presentation/blocs/get_user_movies/get_user_movies_bloc.dart';
import 'package:movies_app_train/movies/presentation/widgets/custom_list_tile_widget.dart';

class UserMoviesScreen extends StatefulWidget {
  const UserMoviesScreen({Key? key}) : super(key: key);

  @override
  State<UserMoviesScreen> createState() => _UserMoviesScreenState();
}

class _UserMoviesScreenState extends State<UserMoviesScreen> {
  late final UserMoviesBloc _userMoviesBloc;
  late final AddUserMoviesBloc _addUserMoviesBloc;
  late final String _title;
  List<Movie> _favoriteMovies = [];
  List<Movie> _wantToWatchMovies = [];
  List<Movie> _watcedMovies = [];
  late final bool _isFavorite;
  late final bool _isWantToWatch;
  late final bool _isWatched;
  final double _itemHeight = 232.0;
  late final String _titleText;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _userMoviesBloc = BlocProvider.of<UserMoviesBloc>(context);
    _addUserMoviesBloc = BlocProvider.of<AddUserMoviesBloc>(context);
    _userMoviesBloc.add(const GetFavoritesEvent());
    _userMoviesBloc.add(const GetWantToWatchEvent());
    _userMoviesBloc.add(const GetWatchedEvent());
    _title = ModalRoute.of(context)!.settings.arguments as String;
    _isFavorite = _title == AppConstants.favorites;
    _isWantToWatch = _title == AppConstants.wantToWatch;
    _isWatched = _title == AppConstants.watched;
    _titleText = _isFavorite
        ? 'Favorites'
        : _isWantToWatch
            ? 'Watch Later'
            : 'Watched';
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 0.0,
        leading: const SizedBox(),
        title: Text(
          _titleText,
          style: GoogleFonts.dosis(
            fontSize: 24,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.15,
            color: Colors.white,
          ),
        ),
      ),
      body: _buildUserMoviesScreen(width),
    );
  }

  BlocBuilder<UserMoviesBloc, UserMoviesState> _buildUserMoviesScreen(double width) {
    return BlocBuilder<UserMoviesBloc, UserMoviesState>(
      builder: (context, state) {
        if (state.favoriteMoviesState == RequestState.loaded &&
            state.wantToWatchMoviesState == RequestState.loaded &&
            state.watchedMoviesState == RequestState.loaded) {
          _favoriteMovies = state.favoriteMovies;
          _wantToWatchMovies = state.wantToWatchMovies;
          _watcedMovies = state.watchedMovies;
          if ((_isFavorite && _favoriteMovies.isEmpty) || (_isWantToWatch && _wantToWatchMovies.isEmpty) || (_isWatched && _watcedMovies.isEmpty)) {
            return emptyListText(width);
          }
          return AnimationLimiter(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
              itemCount: _isFavorite
                  ? _favoriteMovies.length
                  : _isWantToWatch
                      ? _wantToWatchMovies.length
                      : _watcedMovies.length,
              itemBuilder: (BuildContext _, int index) {
                final movie = _isFavorite
                    ? _favoriteMovies[index]
                    : _isWantToWatch
                        ? _wantToWatchMovies[index]
                        : _watcedMovies[index];
                final bool inFavorite = _favoriteMovies.contains(movie);
                final bool inWantToWatch = _wantToWatchMovies.contains(movie);
                final bool inWatched = _watcedMovies.contains(movie);
                return AnimationConfiguration.staggeredList(
                  position: index,
                  delay: const Duration(milliseconds: 100),
                  child: SlideAnimation(
                    duration: const Duration(milliseconds: 2500),
                    curve: Curves.fastLinearToSlowEaseIn,
                    horizontalOffset: 30,
                    verticalOffset: 300.0,
                    child: FlipAnimation(
                      duration: const Duration(milliseconds: 3000),
                      curve: Curves.fastLinearToSlowEaseIn,
                      flipAxis: FlipAxis.y,
                      child: CustomListTileWidget(
                        movie: movie,
                        itemHeight: _itemHeight,
                        width: width,
                        favorite: inFavorite
                            ? const Icon(
                                Icons.favorite_rounded,
                                color: Colors.red,
                              )
                            : const Icon(
                                Icons.favorite_border_rounded,
                              ),
                        onPressedFavorite: () {
                          if (inFavorite) {
                            _addUserMoviesBloc.add(RemoveFromFavoriteEvent(movie));
                          } else {
                            _addUserMoviesBloc.add(AddToFavoriteEvent(movie));
                          }
                          _userMoviesBloc.add(const GetFavoritesEvent());
                        },
                        wantToWatch: inWantToWatch
                            ? const Icon(
                                Icons.playlist_add_check_rounded,
                              )
                            : const Icon(
                                Icons.playlist_add_rounded,
                              ),
                        onPressedWantToWatch: () {
                          if (inWantToWatch) {
                            _addUserMoviesBloc.add(RemoveFromWantToWatchEvent(movie));
                          } else {
                            _addUserMoviesBloc.add(AddToWantToWatchEvent(movie));
                          }
                          _userMoviesBloc.add(const GetWantToWatchEvent());
                        },
                        watched: inWatched
                            ? const Icon(
                                Icons.highlight_remove_rounded,
                              )
                            : const Icon(
                                Icons.add_task_rounded,
                              ),
                        onPressedWatched: () {
                          if (inWatched) {
                            _addUserMoviesBloc.add(RemoveFromWathcedEvent(movie));
                          } else {
                            _addUserMoviesBloc.add(AddToWathcedEvent(movie));
                          }
                          _userMoviesBloc.add(const GetWatchedEvent());
                        },
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        } else {
          return const SimpleLoading(color: Colors.white);
        }
      },
    );
  }
}
