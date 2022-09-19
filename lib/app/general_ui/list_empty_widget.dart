  import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Stack emptyListText(double width) {
    return Stack(
      children: [
        Center(
          child: SizedBox(
            width: width * 0.7,
            child: Text(
              'You don\'t have any movie in this list, try to add one.',
              textAlign: TextAlign.center,
              style: GoogleFonts.dosis(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        ListView(),
      ],
    );
  }