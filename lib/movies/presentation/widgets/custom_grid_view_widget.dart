import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:movies_app_train/app/constants/app_constants.dart';
import 'package:movies_app_train/app/constants/app_urls.dart';
import 'package:movies_app_train/app/router/app_routes.dart';
import 'package:movies_app_train/app/theme/app_colors.dart';
import 'package:movies_app_train/movies/domain/entities/movie.dart';
import 'package:shimmer/shimmer.dart';

class CustomGridView extends StatelessWidget {
  final List<Movie> movies;
  final int id;
  const CustomGridView({
    super.key,
    required this.movies,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    final Iterable<Movie> iterable = movies.where((element) => element.posterPath.isNotEmpty && element.id != id);
    final List<Movie> similars = iterable.length > 12 ? iterable.toList().sublist(0, 12) : iterable.toList();
    double width = MediaQuery.of(context).size.width;
    double heightOfGrid = width / 3 * 4 / 0.7;
    int columnCount = 3;
    return SizedBox(
      height: heightOfGrid,
      child: AnimationLimiter(
        child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.all(width / 60),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 0.7,
          ),
          itemCount: similars.length,
          itemBuilder: (BuildContext context, int index) {
            final movie = similars[index];
            return InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(AppRoutes.detailsMovieScreen, arguments: {
                  AppConstants.id: movie.id,
                  AppConstants.posterPath: movie.posterPath,
                  AppConstants.title: movie.title,
                });
              },
              highlightColor: AppColors.primaryColor,
              splashColor: AppColors.primaryColor,
              child: AnimationConfiguration.staggeredGrid(
                position: index,
                duration: const Duration(milliseconds: 500),
                columnCount: columnCount,
                child: ScaleAnimation(
                  duration: const Duration(milliseconds: 900),
                  curve: Curves.fastLinearToSlowEaseIn,
                  scale: 1.5,
                  child: FadeInAnimation(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: CachedNetworkImage(
                        fit: BoxFit.fill,
                        imageUrl: AppUrls.imageUrl(movie.posterPath),
                        placeholder: (context, url) => Shimmer.fromColors(
                          baseColor: Colors.grey[850]!,
                          highlightColor: Colors.grey[800]!,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                        errorWidget: (context, url, error) => const Icon(Icons.error),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
