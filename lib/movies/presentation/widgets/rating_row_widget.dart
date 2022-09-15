import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';

class RatingRowWidget extends StatelessWidget {
  const RatingRowWidget({
    required this.voteAverage,
    Key? key,
  }) : super(key: key);

  final double voteAverage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Rating: ${voteAverage.toStringAsFixed(1)}/10',
            style: GoogleFonts.actor(
              fontSize: 16,
            ),
          ),
          RatingBarIndicator(
            itemCount: 5,
            itemBuilder: (_, __) {
              return const Icon(Icons.star, color: Colors.amber);
            },
            itemSize: 24,
            rating: voteAverage / 2,
            unratedColor: Colors.amber.withAlpha(50),
          ),
        ],
      ),
    );
  }
}
