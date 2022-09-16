import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app_train/app/constants/app_constants.dart';
import 'package:movies_app_train/app/constants/app_strings.dart';
import 'package:movies_app_train/app/general_ui/custom_bottom_navigation_bar.dart';
import 'package:movies_app_train/app/network/request_state.dart';
import 'package:movies_app_train/app/theme/app_colors.dart';
import 'package:movies_app_train/app/theme/app_dimentions.dart';
import 'package:movies_app_train/movies/domain/entities/movie.dart';
import 'package:movies_app_train/movies/presentation/blocs/movies_bloc/movies_bloc.dart';
import 'package:movies_app_train/movies/presentation/widgets/carousal_shows_widget.dart';
import 'package:movies_app_train/movies/presentation/widgets/list_loading_widget.dart';
import 'package:movies_app_train/movies/presentation/widgets/list_title_widget.dart';
import 'package:movies_app_train/movies/presentation/widgets/shows_list_view_widget.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final moviesBloc = BlocProvider.of<MoviesBloc>(context);
    final width = MediaQuery.of(context).size.width;
    final oneThirdWidth = width / 3;
    final listMovieHeight = oneThirdWidth * 1.42;
    return Scaffold(
      body: RefreshIndicator(
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
      ),
      bottomNavigationBar: const MyCustomBottomNavigationBar(),
    );
  }
}
