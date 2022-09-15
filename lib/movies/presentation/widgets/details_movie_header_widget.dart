import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app_train/app/constants/app_constants.dart';
import 'package:movies_app_train/app/constants/app_urls.dart';
import 'package:movies_app_train/app/general_ui/custom_shader_mask.dart';
import 'package:shimmer/shimmer.dart';

class DetailsMovieHeaderWidget extends StatelessWidget {
  final Map<String, dynamic> args;
  const DetailsMovieHeaderWidget({
    Key? key,
    required this.args,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Hero(
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
          
        ],
      ),
    );
  }
}
