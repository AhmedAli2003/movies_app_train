import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app_train/app/constants/app_constants.dart';
import 'package:movies_app_train/app/constants/app_strings.dart';
import 'package:movies_app_train/app/general_ui/app_drawer.dart';
import 'package:movies_app_train/app/general_ui/list_empty_widget.dart';
import 'package:movies_app_train/app/general_ui/simple_loading.dart';
import 'package:movies_app_train/app/network/request_state.dart';
import 'package:movies_app_train/app/router/app_routes.dart';
import 'package:movies_app_train/app/theme/app_colors.dart';
import 'package:movies_app_train/app/theme/app_dimentions.dart';
import 'package:movies_app_train/movies/domain/entities/movie.dart';
import 'package:movies_app_train/movies/presentation/blocs/add_user_movies/add_user_movies_bloc.dart';
import 'package:movies_app_train/movies/presentation/blocs/get_user_movies/get_user_movies_bloc.dart';
import 'package:movies_app_train/movies/presentation/blocs/movies_bloc/movies_bloc.dart';
import 'package:movies_app_train/movies/presentation/blocs/search/search_bloc.dart';
import 'package:movies_app_train/movies/presentation/widgets/carousal_shows_widget.dart';
import 'package:movies_app_train/movies/presentation/widgets/custom_list_tile_widget.dart';
import 'package:movies_app_train/movies/presentation/widgets/list_loading_widget.dart';
import 'package:movies_app_train/movies/presentation/widgets/list_title_widget.dart';
import 'package:movies_app_train/movies/presentation/widgets/shows_list_view_widget.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({super.key});

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  bool _didChangeDependencies = true;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  int currentIndex = 0;
  int previousIndex = 0;
  late final UserMoviesBloc _userMoviesBloc;
  late final AddUserMoviesBloc _addUserMoviesBloc;
  late final SearchBloc _searchBloc;
  bool _firstSearchCall = true;
  late String _title;
  List<Movie> _favoriteMovies = [];
  List<Movie> _wantToWatchMovies = [];
  List<Movie> _watcedMovies = [];
  List<Movie> _searchedMovies = [];
  late final bool _isFavorite;
  late final bool _isWantToWatch;
  late final bool _isWatched;
  final double _itemHeight = 232.0;

  @override
  void didChangeDependencies() {
    if (_didChangeDependencies) {
      super.didChangeDependencies();
      _userMoviesBloc = BlocProvider.of<UserMoviesBloc>(context);
      _addUserMoviesBloc = BlocProvider.of<AddUserMoviesBloc>(context);
      _searchBloc = BlocProvider.of<SearchBloc>(context);
      _userMoviesBloc.add(const GetFavoritesEvent());
      _userMoviesBloc.add(const GetWantToWatchEvent());
      _userMoviesBloc.add(const GetWatchedEvent());
      _title = AppConstants.favorites;
      _isFavorite = _title == AppConstants.favorites;
      _isWantToWatch = _title == AppConstants.wantToWatch;
      _isWatched = _title == AppConstants.watched;
      _didChangeDependencies = false;
    }
  }

  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Are you sure?'),
            content: const Text('Do you want to exit HoShows?'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('No', style: TextStyle(color: Colors.white)),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: const Text('Yes', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        )) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    final moviesBloc = BlocProvider.of<MoviesBloc>(context);
    final size = MediaQuery.of(context).size;
    final oneThirdWidth = size.width / 3;
    final listMovieHeight = oneThirdWidth * 1.42;
    return WillPopScope(
      onWillPop: () async {
        if (currentIndex == 1 || currentIndex == 2) {
          setState(() => currentIndex = 0);
          return false;
        }
        if (currentIndex == 0) {
          return _onWillPop();
        }
        return true;
      },
      child: Scaffold(
        appBar: currentIndex == 1 || (previousIndex == 1 && currentIndex == 3)
            ? AppBar(
                leadingWidth: 0.0,
                leading: const SizedBox(),
                title: Text(
                  'Favorites',
                  style: GoogleFonts.dosis(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.15,
                    color: Colors.white,
                  ),
                ),
              )
            : null,
        key: _scaffoldKey,
        onDrawerChanged: (isOpened) {
          if (isOpened) {
            setState(() => previousIndex = currentIndex);
            setState(() => currentIndex = 3);
          } else {
            setState(() => currentIndex = previousIndex);
          }
        },
        drawer: AppDrawer(AppRoutes.moviesScreen),
        body: _buildBody(moviesBloc, size.width, listMovieHeight, oneThirdWidth),
        bottomNavigationBar: _buildNavigationBar(size),
      ),
    );
  }

  Widget _buildBody(MoviesBloc moviesBloc, double width, double listMovieHeight, double oneThirdWidth) {
    if (currentIndex == 0) {
      return _buildMoviesScreen(moviesBloc, width, listMovieHeight, oneThirdWidth);
    } else if (currentIndex == 1) {
      return _buildUserMoviesScreen(width);
    } else if (currentIndex == 2) {
      return _buildSearchScreen();
    } else {
      if (previousIndex == 0) {
        return _buildMoviesScreen(moviesBloc, width, listMovieHeight, oneThirdWidth);
      } else if (previousIndex == 1) {
        return _buildUserMoviesScreen(width);
      } else {
        return _buildSearchScreen();
      }
    }
  }

  Widget _buildSearchScreen() {
    final width = MediaQuery.of(context).size.width;
    if (_firstSearchCall) {
      _searchBloc.add(const SearchEvent('HGFDSRGFVXZCVREHGDDFGHTEFDFGSDFG', 1));
      _firstSearchCall = false;
    }
    return SafeArea(
      child: Column(
        children: [
          TextField(
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              suffixIcon: Icon(
                Icons.search,
                color: AppColors.white,
              ),
              hintText: 'Search..',
            ),
            cursorColor: AppColors.white,
            onChanged: (value) {
              if (value.trim().isNotEmpty) {
                _searchBloc.add(SearchEvent(value, 1));
              }
            },
          ),
          Expanded(
            child: BlocBuilder<SearchBloc, SearchState>(
              bloc: _searchBloc,
              builder: (context, searchState) {
                if (searchState is SearchedMoviesState) {
                  _searchedMovies = searchState.moviesInfo.movies;
                  return BlocBuilder<UserMoviesBloc, UserMoviesState>(
                    builder: (context, state) {
                      if (state.favoriteMoviesState == RequestState.loaded &&
                          state.wantToWatchMoviesState == RequestState.loaded &&
                          state.watchedMoviesState == RequestState.loaded) {
                        if (_searchedMovies.isNotEmpty) {
                          return AnimationLimiter(
                            child: ListView.builder(
                              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                              physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                              itemCount: _searchedMovies.length,
                              itemBuilder: (BuildContext context, int index) {
                                final movie = _searchedMovies[index];
                                _favoriteMovies = state.favoriteMovies;
                                _wantToWatchMovies = state.wantToWatchMovies;
                                _watcedMovies = state.watchedMovies;
                                final bool inFavorite = _favoriteMovies.contains(movie);
                                final bool inWantToWatch = _wantToWatchMovies.contains(movie);
                                final bool inWatched = _watcedMovies.contains(movie);
                                return AnimationConfiguration.staggeredList(
                                  position: index,
                                  delay: const Duration(milliseconds: 100),
                                  child: SlideAnimation(
                                    duration: const Duration(milliseconds: 2500),
                                    curve: Curves.fastLinearToSlowEaseIn,
                                    child: FadeInAnimation(
                                      curve: Curves.fastLinearToSlowEaseIn,
                                      duration: const Duration(milliseconds: 2500),
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
                                        wantToWatch: inWantToWatch
                                            ? const Icon(
                                                Icons.playlist_add_check_rounded,
                                              )
                                            : const Icon(
                                                Icons.playlist_add_rounded,
                                              ),
                                        watched: inWatched
                                            ? const Icon(
                                                Icons.highlight_remove_rounded,
                                              )
                                            : const Icon(
                                                Icons.add_task_rounded,
                                              ),
                                        onPressedFavorite: () {
                                          if (inFavorite) {
                                            _addUserMoviesBloc.add(RemoveFromFavoriteEvent(movie));
                                          } else {
                                            _addUserMoviesBloc.add(AddToFavoriteEvent(movie));
                                          }
                                          _userMoviesBloc.add(const GetFavoritesEvent());
                                        },
                                        onPressedWantToWatch: () {
                                          if (inWantToWatch) {
                                            _addUserMoviesBloc.add(RemoveFromWantToWatchEvent(movie));
                                          } else {
                                            _addUserMoviesBloc.add(AddToWantToWatchEvent(movie));
                                          }
                                          _userMoviesBloc.add(const GetWantToWatchEvent());
                                        },
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
                        }
                        return const Center(child: Text('Type valid movie name to search...'));
                      }
                      return const SimpleLoading(color: AppColors.white);
                    },
                  );
                }
                return const SimpleLoading(color: AppColors.white);
              },
            ),
          ),
        ],
      ),
    );
  }

  RefreshIndicator _buildUserMoviesScreen(double width) {
    return RefreshIndicator(
      backgroundColor: AppColors.white,
      color: AppColors.primaryColor,
      onRefresh: () async {
        _userMoviesBloc.add(const GetFavoritesEvent());
        _userMoviesBloc.add(const GetWantToWatchEvent());
        _userMoviesBloc.add(const GetWatchedEvent());
      },
      child: BlocBuilder<UserMoviesBloc, UserMoviesState>(
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
      ),
    );
  }

  SizedBox _buildNavigationBar(Size size) {
    return SizedBox(
      height: size.width * 0.155,
      child: ListView.builder(
        itemCount: _listOfIcons.length,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.024),
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            if (index == 3) {
              _scaffoldKey.currentState!.openDrawer();
            }
            setState(() {
              currentIndex = index;
            });
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(height: size.width * 0.014),
              Icon(_listOfIcons[index], size: size.width * 0.076, color: Colors.white),
              AnimatedContainer(
                duration: const Duration(milliseconds: 1500),
                curve: Curves.fastLinearToSlowEaseIn,
                margin: EdgeInsets.only(
                  top: index == currentIndex ? 0 : size.width * 0.029,
                  right: size.width * 0.0422,
                  left: size.width * 0.0422,
                ),
                width: size.width * 0.153,
                height: index == currentIndex ? size.width * 0.014 : 0,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  final List<IconData> _listOfIcons = [
    Icons.home_rounded,
    Icons.favorite_rounded,
    Icons.search_rounded,
    Icons.menu_rounded,
  ];

  RefreshIndicator _buildMoviesScreen(MoviesBloc moviesBloc, double width, double listMovieHeight, double oneThirdWidth) {
    return RefreshIndicator(
      backgroundColor: AppColors.white,
      color: AppColors.primaryColor,
      onRefresh: () async {
        const int initialPage = 1;
        moviesBloc
          ..add(const GetNowPlayingMoviesEvent(initialPage))
          ..add(const GetPopularMoviesEvent(initialPage))
          ..add(const GetTopRatedMoviesEvent(initialPage))
          ..add(const GetUpcomingMoviesEvent(initialPage));
      },
      child: SingleChildScrollView(
        key: const Key(AppConstants.moviesSingleChildScrollViewKey),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocBuilder<MoviesBloc, MoviesState>(
              builder: (context, state) {
                if (state.nowPlayingRequestState == RequestState.loaded) {
                  final List<Movie> nowPlayingMovies = state.nowPlayingMoviesInfo.movies;
                  return Stack(
                    children: [
                      CarousalShowsWidget(nowPlayingMovies: nowPlayingMovies, width: width),
                    ],
                  );
                }
                return const Center(child: CircularProgressIndicator());
              },
            ),
            const ListTitleWidget(title: AppString.popular),
            BlocBuilder<MoviesBloc, MoviesState>(
              builder: (context, state) {
                if (state.popularRequestState == RequestState.loaded) {
                  final List<Movie> popularMovies = state.popularMoviesInfo.movies;
                  return ShowsListView(
                    listMovieHeight: listMovieHeight,
                    movies: popularMovies,
                    oneThirdWidth: oneThirdWidth,
                  );
                }
                return const Center(child: CircularProgressIndicator());
              },
            ),
            const ListTitleWidget(title: AppString.topRated),
            BlocBuilder<MoviesBloc, MoviesState>(
              builder: (context, state) {
                if (state.topRatedRequestState == RequestState.loaded) {
                  final List<Movie> topRatedMovies = state.topRatedMoviesInfo.movies;
                  return ShowsListView(
                    listMovieHeight: listMovieHeight,
                    movies: topRatedMovies,
                    oneThirdWidth: oneThirdWidth,
                  );
                }
                return ListLoadingWidget(height: listMovieHeight, width: oneThirdWidth);
              },
            ),
            const ListTitleWidget(title: AppString.upcoming),
            BlocBuilder<MoviesBloc, MoviesState>(
              builder: (context, state) {
                if (state.upcomingRequestState == RequestState.loaded) {
                  final List<Movie> upcomingMovies = state.upcomingMoviesInfo.movies;
                  return ShowsListView(
                    listMovieHeight: listMovieHeight,
                    movies: upcomingMovies,
                    oneThirdWidth: oneThirdWidth,
                  );
                }
                return ListLoadingWidget(height: listMovieHeight, width: oneThirdWidth);
              },
            ),
            const SizedBox(height: AppDimentions.spaceFromBottomPage),
          ],
        ),
      ),
    );
  }
}
