import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app_train/app/constants/app_constants.dart';
import 'package:movies_app_train/app/general_ui/shimmer_loading_widget.dart';
import 'package:movies_app_train/app/network/request_state.dart';
import 'package:movies_app_train/movies/presentation/blocs/movie_details/movie_details_bloc.dart';
import 'package:movies_app_train/movies/presentation/widgets/custom_grid_view_widget.dart';
import 'package:movies_app_train/movies/presentation/widgets/custom_sliver_app_bar.dart';
import 'package:movies_app_train/movies/presentation/widgets/date_genres_runtime_line_widget.dart';
import 'package:movies_app_train/movies/presentation/widgets/overview_text_widget.dart';
import 'package:movies_app_train/movies/presentation/widgets/rating_row_widget.dart';
import 'package:movies_app_train/movies/presentation/widgets/similar_shows_title.dart';

class DetailsMovieScreen extends StatelessWidget {
  const DetailsMovieScreen({super.key});

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
                    builder: (context, state) {
                      if (state.requestState == RequestState.loaded && state.similarMoviesRequestState == RequestState.loaded) {
                        final movie = state.movie;
                        return Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 16),
                              DataGenresTimeLineWidget(releaseDate: movie.releaseDate, runtime: movie.runtime, genres: movie.genres),
                              RatingRowWidget(voteAverage: movie.voteAverage),
                              OverviewTextWidget(overview: movie.overview),
                              const SizedBox(height: 16),
                              const Divider(color: Colors.grey, height: 2, indent: 28, endIndent: 28, thickness: 0.8),
                              const SimilarShowsTitle(),
                              CustomGridView(movies: state.similarMovies.movies),
                            ],
                          ),
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
