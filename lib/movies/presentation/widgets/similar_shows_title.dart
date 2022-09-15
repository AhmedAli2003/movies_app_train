import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SimilarShowsTitle extends StatelessWidget {
  const SimilarShowsTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Text(
        'Similar Movies:',
        style: GoogleFonts.dosis(
          fontSize: 28,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}