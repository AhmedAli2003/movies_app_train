import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:movies_app_train/movies/domain/entities/movie.dart';
import 'package:movies_app_train/movies/presentation/widgets/custom_list_tile_widget.dart';

class CustomListView extends StatelessWidget {
  final ScrollController controller;
  final List<Movie> movies;
  final double itemHeight;
  final double width;
  const CustomListView({
    super.key,
    required this.controller,
    required this.movies,
    required this.itemHeight,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: ListView.builder(
        physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        controller: controller,
        itemCount: movies.length + 1,
        itemBuilder: (BuildContext _, int index) {
          final movie = movies[index];
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
                child: CustomListTileWidget(movie: movie, itemHeight: itemHeight, width: width),
              ),
            ),
          );
        },
      ),
    );
  }
}
