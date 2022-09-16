import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app_train/app/utils/general_functions.dart';
import 'package:movies_app_train/movies/domain/entities/genre.dart';

class DataGenresTimeLineWidget extends StatelessWidget {
  const DataGenresTimeLineWidget({
    Key? key,
    required this.releaseDate,
    required this.genres,
    required this.runtime,
  }) : super(key: key);

  final String releaseDate;
  final List<Genre> genres;
  final int runtime;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 5.0),
            child: Text(
              releaseDate.substring(0, 4),
              style: GoogleFonts.actor(
                fontSize: 16,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.0),
            child: Icon(Icons.circle, size: 4),
          ),
          Text(
            getStringOfGenre(genres),
            style: GoogleFonts.actor(
              fontSize: 15,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.0),
            child: Icon(Icons.circle, size: 4),
          ),
          Text(
            getStringTime(runtime),
            style: GoogleFonts.actor(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
