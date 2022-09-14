import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app_train/app/constants/app_strings.dart';
import 'package:movies_app_train/app/constants/app_urls.dart';
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
          (item) {
            return GestureDetector(
              key: const Key('openMovieMinimalDetail'),
              onTap: () {
                /// TODO : NAVIGATE TO MOVIE DETAILS
              },
              child: Stack(
                children: [
                  ShaderMask(
                    shaderCallback: (rect) {
                      return const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          // fromLTRB
                          Colors.transparent,
                          Colors.black,
                          Colors.black,
                          Colors.transparent,
                        ],
                        stops: [0.0, 0.15, 0.6, 1],
                      ).createShader(
                        Rect.fromLTRB(0, 0, rect.width, rect.height),
                      );
                    },
                    blendMode: BlendMode.dstIn,
                    child: Center(
                      child: CachedNetworkImage(
                        height: 560.0,
                        width: width,
                        imageUrl: AppUrls.imageUrl(item.posterPath),
                        fit: BoxFit.fill,
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
                            item.title,
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
