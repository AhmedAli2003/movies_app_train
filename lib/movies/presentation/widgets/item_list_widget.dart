import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app_train/app/constants/app_constants.dart';
import 'package:movies_app_train/app/constants/app_urls.dart';
import 'package:movies_app_train/app/router/app_routes.dart';
import 'package:movies_app_train/app/theme/app_colors.dart';
import 'package:movies_app_train/movies/domain/entities/movie.dart';
import 'package:shimmer/shimmer.dart';


class ItemListWidget extends StatelessWidget {
  const ItemListWidget({
    Key? key,
    required this.width,
    required this.movie,
    required this.height,
  }) : super(key: key);

  final double width;
  final Movie movie;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 8.0),
      child: InkWell(
        highlightColor: AppColors.primaryColor,
        onTap: () {
          Navigator.of(context).pushNamed(AppRoutes.detailsMovieScreen, arguments: {
            AppConstants.id: movie.id,
            AppConstants.posterPath: movie.posterPath,
            AppConstants.title: movie.title,
          });
        },
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(8.0)),
          child: Hero(
            tag: AppConstants.posterPathHeroTag,
            child: CachedNetworkImage(
              width: width,
              fit: BoxFit.cover,
              imageUrl: AppUrls.imageUrl(movie.posterPath),
              placeholder: (context, url) => Shimmer.fromColors(
                baseColor: Colors.grey[850]!,
                highlightColor: Colors.grey[800]!,
                child: Container(
                  height: height,
                  width: width,
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
    );
  }
}
