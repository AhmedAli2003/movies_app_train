import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import 'package:movies_app_train/movies/domain/entities/movie.dart';
import 'package:movies_app_train/movies/presentation/widgets/item_list_widget.dart';

class ShowsListView extends StatelessWidget {
  const ShowsListView({
    Key? key,
    required this.listMovieHeight,
    required this.movies,
    required this.oneThirdWidth,
  }) : super(key: key);

  final double listMovieHeight;
  final List<Movie> movies;
  final double oneThirdWidth;

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      duration: const Duration(milliseconds: 500),
      child: SizedBox(
        height: listMovieHeight,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.only(left: 8.0),
          physics: const BouncingScrollPhysics(),
          itemCount: movies.length,
          itemBuilder: (context, index) {
            final movie = movies[index];
            return ItemListWidget(width: oneThirdWidth, movie: movie, height: listMovieHeight);
          },
        ),
      ),
    );
  }
}
