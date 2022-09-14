import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app_train/app/constants/app_constants.dart';
import 'package:movies_app_train/app/constants/app_urls.dart';
import 'package:movies_app_train/app/general_ui/custom_shader_mask.dart';
import 'package:movies_app_train/app/network/request_state.dart';
import 'package:movies_app_train/movies/presentation/blocs/movie_details/movie_details_bloc.dart';
import 'package:shimmer/shimmer.dart';

class DetailsMovieScreen extends StatelessWidget {
  const DetailsMovieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    double left = 250;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 5),
            Hero(
              tag: AppConstants.posterPathHeroTag,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  CustomShaderMask(
                    child: CachedNetworkImage(
                      width: double.infinity,
                      fit: BoxFit.cover,
                      imageUrl: AppUrls.imageUrl(args[AppConstants.posterPath]),
                      placeholder: (context, url) => Shimmer.fromColors(
                        baseColor: Colors.grey[850]!,
                        highlightColor: Colors.grey[800]!,
                        child: Container(
                          height: 450,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          alignment: Alignment.center,
                        ),
                      ),
                      errorWidget: (context, url, error) => const Icon(Icons.error),
                    ),
                  ),
                  StatefulBuilder(
                    builder: (context, setState) {
                      Future.delayed(Duration.zero, () {
                        setState(() => left = 12);
                      });
                      return AnimatedPositioned(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.bounceOut,
                        left: left,
                        bottom: 12,
                        child: Text(
                          args[AppConstants.title],
                          style: GoogleFonts.dosis(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            shadows: [const Shadow(color: Colors.white, blurRadius: 2, offset: Offset(0.8, 0.8))],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
              bloc: MovieDetailsBloc()..add(MovieDetailsEvent(args[AppConstants.id])),
              builder: (context, state) {
                if (state.requestState == RequestState.loaded) {
                  final movie = state.movie;
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [],
                    ),
                  );
                }
                return Shimmer.fromColors(
                  baseColor: Colors.grey[900]!,
                  highlightColor: Colors.grey,
                  child: const SizedBox(
                    height: 300,
                    width: double.infinity,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
