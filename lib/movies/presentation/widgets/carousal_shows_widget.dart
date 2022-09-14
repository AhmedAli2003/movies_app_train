import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app_train/app/constants/app_constants.dart';
import 'package:movies_app_train/app/constants/app_strings.dart';
import 'package:movies_app_train/app/constants/app_urls.dart';
import 'package:movies_app_train/app/general_ui/custom_shader_mask.dart';
import 'package:movies_app_train/app/router/app_routes.dart';
import 'package:movies_app_train/movies/domain/entities/movie.dart';

class CarousalShowsWidget extends StatelessWidget {
  const CarousalShowsWidget({
    Key? key,
    required this.nowPlayingMovies,
    required this.width,
  }) : super(key: key);

  final List<Movie> nowPlayingMovies;
  final double width;

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      duration: const Duration(milliseconds: 500),
      child: CarouselSlider(
        options: CarouselOptions(
          autoPlay: true,
          height: 450.0,
          viewportFraction: 1.0,
          onPageChanged: (index, reason) {},
        ),
        items: nowPlayingMovies.map(
          (movie) {
            return GestureDetector(
              key: const Key(AppConstants.gestureDetectorMoviesKey),
              onTap: () {
                Navigator.of(context).pushNamed(AppRoutes.detailsMovieScreen, arguments: {
                  AppConstants.id: movie.id,
                  AppConstants.posterPath: movie.posterPath,
                  AppConstants.title: movie.title,
                });
              },
              child: Stack(
                children: [
                  CustomShaderMask(
                    child: Center(
                      child: Hero(
                        tag: AppConstants.posterPathHeroTag,
                        child: CachedNetworkImage(
                          height: 560.0,
                          width: width,
                          imageUrl: AppUrls.imageUrl(movie.posterPath),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.circle,
                                color: Colors.redAccent,
                                size: 12.0,
                              ),
                              const SizedBox(width: 4.0),
                              Text(
                                AppString.nowPlaying.toUpperCase(),
                                style: GoogleFonts.dosis(
                                  fontSize: 16.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: Text(
                            movie.title,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.dosis(
                              fontSize: 24,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}
