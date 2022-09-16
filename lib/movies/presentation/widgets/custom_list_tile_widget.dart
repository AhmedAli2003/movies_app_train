import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app_train/app/constants/app_constants.dart';
import 'package:movies_app_train/app/constants/app_urls.dart';
import 'package:movies_app_train/app/router/app_routes.dart';
import 'package:movies_app_train/app/theme/app_colors.dart';
import 'package:movies_app_train/movies/domain/entities/movie.dart';
import 'package:shimmer/shimmer.dart';

class CustomListTileWidget extends StatelessWidget {
  const CustomListTileWidget({
    Key? key,
    required this.movie,
    required double itemHeight,
    required this.width,
  })  : _itemHeight = itemHeight,
        super(key: key);

  final Movie movie;
  final double _itemHeight;
  final double width;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: AppColors.primaryColor,
      splashColor: AppColors.primaryColor,
      onTap: () {
        Navigator.of(context).pushNamed(AppRoutes.detailsMovieScreen, arguments: {
          AppConstants.id: movie.id,
          AppConstants.posterPath: movie.posterPath,
          AppConstants.title: movie.title,
        });
      },
      child: SizedBox(
        height: _itemHeight - 16,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: CachedNetworkImage(
                  width: 150,
                  height: _itemHeight,
                  fit: BoxFit.fill,
                  imageUrl: AppUrls.imageUrl(movie.posterPath),
                  placeholder: (context, url) => Shimmer.fromColors(
                    baseColor: Colors.grey[850]!,
                    highlightColor: Colors.grey[800]!,
                    child: Container(
                      width: 150,
                      height: _itemHeight,
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: SizedBox(
                width: width - 32 - 150,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      movie.title,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: GoogleFonts.dosis(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        shadows: [const Shadow(color: Colors.white, blurRadius: 2, offset: Offset(0.8, 0.8))],
                      ),
                    ),
                    Text(
                      movie.overview,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 4,
                      style: GoogleFonts.dosis(
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      'Release Date: ${movie.releaseDate}',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 4,
                      style: GoogleFonts.dosis(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.star, color: Colors.amber),
                            const SizedBox(width: 3),
                            Text(movie.voteAverage.toStringAsFixed(1)),
                          ],
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.favorite_border_rounded),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
