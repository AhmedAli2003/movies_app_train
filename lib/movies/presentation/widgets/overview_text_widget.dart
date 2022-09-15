import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OverviewTextWidget extends StatelessWidget {
  const OverviewTextWidget({
    Key? key,
    required this.overview,
  }) : super(key: key);

  final String overview;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 28),
      child: Text(
        overview,
        textAlign: TextAlign.center,
        style: GoogleFonts.dosis(
          fontSize: 16,
        ),
      ),
    );
  }
}
