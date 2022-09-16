import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app_train/app/constants/app_strings.dart';
import 'package:movies_app_train/app/network/request_state.dart';
import 'package:movies_app_train/movies/domain/entities/movie.dart';
import 'package:movies_app_train/movies/presentation/blocs/movies_bloc/movies_bloc.dart';
import 'package:movies_app_train/movies/presentation/widgets/custom_list_tile_widget.dart';

class DetailsListMoviesScreen extends StatefulWidget {
  const DetailsListMoviesScreen({Key? key}) : super(key: key);

  @override
  State<DetailsListMoviesScreen> createState() => _DetailsListMoviesScreenState();
}

class _DetailsListMoviesScreenState extends State<DetailsListMoviesScreen> {
  late final MoviesBloc _moviesBloc;
  RequestState _requsetState = RequestState.loading;
  late final String _title;
  final List<Movie> _movies = [];
  int _page = 1;
  int _pagesLimit = 50;
  final ScrollController _controller = ScrollController();
  late final double _initialMaxScroll;
  double _lastScroll = 0.0;
  bool _canFetch = true;
  bool _firstTime = true;
  int _length = 20;
  final double _itemHeight = 232.0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _moviesBloc = MoviesBloc();
    _title = ModalRoute.of(context)!.settings.arguments as String;
    MoviesEvent moviesEvent = getEvent(_title);
    _moviesBloc.add(moviesEvent);
    _controller.addListener(() {
      if (_firstTime) {
        _initialMaxScroll = _controller.position.maxScrollExtent;
        _lastScroll = _initialMaxScroll;
        _firstTime = false;
      }
      if (_controller.position.maxScrollExtent - _controller.position.pixels < _itemHeight * _length && _canFetch) {
        _canFetch = false;
        _page += 1;
        if (_page < _pagesLimit) {
          moviesEvent = getEvent(_title);
          _moviesBloc.add(moviesEvent);
        }
        _lastScroll += _itemHeight * _length;
      }
      if (_requsetState == RequestState.loaded && _controller.position.pixels + _itemHeight * _length > _lastScroll) {
        _canFetch = true;
      }
    });
  }

  MoviesEvent getEvent(String title) {
    switch (title) {
      case AppString.nowPlaying:
        return GetNowPlayingMoviesEvent(_page);
      case AppString.popular:
        return GetPopularMoviesEvent(_page);
      case AppString.topRated:
        return GetTopRatedMoviesEvent(_page);
      case AppString.upcoming:
        return GetUpcomingMoviesEvent(_page);
      default:
        return GetNowPlayingMoviesEvent(_page);
    }
  }

  RequestState getRequestState(MoviesState state) {
    switch (_title) {
      case AppString.nowPlaying:
        _pagesLimit = state.nowPlayingMoviesInfo.totalPages > 50 ? 50 : state.nowPlayingMoviesInfo.totalPages;
        return state.nowPlayingRequestState;
      case AppString.popular:
        _pagesLimit = state.popularMoviesInfo.totalPages > 50 ? 50 : state.popularMoviesInfo.totalPages;
        return state.popularRequestState;
      case AppString.topRated:
        _pagesLimit = state.topRatedMoviesInfo.totalPages > 50 ? 50 : state.topRatedMoviesInfo.totalPages;
        return state.topRatedRequestState;
      case AppString.upcoming:
        _pagesLimit = state.upcomingMoviesInfo.totalPages > 50 ? 50 : state.upcomingMoviesInfo.totalPages;
        return state.upcomingRequestState;
      default:
        return RequestState.loading;
    }
  }

  void addMovies(MoviesState state) {
    switch (_title) {
      case AppString.nowPlaying:
        _length = state.nowPlayingMoviesInfo.movies.length;
        _movies.addAll(state.nowPlayingMoviesInfo.movies);
        break;
      case AppString.popular:
        _length = state.popularMoviesInfo.movies.length;
        _movies.addAll(state.popularMoviesInfo.movies);
        break;
      case AppString.topRated:
        _length = state.topRatedMoviesInfo.movies.length;
        _movies.addAll(state.topRatedMoviesInfo.movies);
        break;
      case AppString.upcoming:
        _length = state.upcomingMoviesInfo.movies.length;
        _movies.addAll(state.upcomingMoviesInfo.movies);
        break;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _moviesBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _title,
          style: GoogleFonts.combo(
            fontSize: 24,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.15,
            color: Colors.white,
          ),
        ),
      ),
      body: BlocBuilder<MoviesBloc, MoviesState>(
        bloc: _moviesBloc,
        builder: (context, state) {
          _requsetState = getRequestState(state);
          if (_requsetState == RequestState.loaded) {
            addMovies(state);
            if (_movies.isNotEmpty) {
              return AnimationLimiter(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                  controller: _controller,
                  itemCount: _movies.length + 1,
                  itemBuilder: (BuildContext _, int index) {
                    if (index < _movies.length) {
                      final movie = _movies[index];
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
                            child: CustomListTileWidget(movie: movie, itemHeight: _itemHeight, width: width),
                          ),
                        ),
                      );
                    }
                    return _page < _pagesLimit ? const Center(child: CircularProgressIndicator(color: Colors.white)) : const SizedBox();
                  },
                ),
              );
            }
          }
          return const Center(child: CircularProgressIndicator(color: Colors.white));
        },
      ),
    );
  }
}
