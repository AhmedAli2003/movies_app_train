import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app_train/app/constants/app_constants.dart';
import 'package:movies_app_train/movies/presentation/widgets/details_movie_header_widget.dart';

class CustomSliverAppBar extends StatelessWidget {
  final Map<String, dynamic> args;
  const CustomSliverAppBar({Key? key, required this.args}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Alignment alignment = Alignment.bottomRight;
    return SliverAppBar(
      pinned: true,
      centerTitle: true,
      automaticallyImplyLeading: false,
      expandedHeight: 450.0,
      flexibleSpace: FlexibleSpaceBar(
        background: DetailsMovieHeaderWidget(args: args),
        title: StatefulBuilder(
          builder: (context, setState) {
            Future.delayed(Duration.zero, () {
              setState(() => alignment = Alignment.bottomLeft);
            });
            return AnimatedAlign(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
              alignment: alignment,
              child: Text(
                args[AppConstants.title],
                style: GoogleFonts.dosis(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  shadows: [const Shadow(color: Colors.white, blurRadius: 2, offset: Offset(0.8, 0.8))],
                ),
              ),
            );
          },
        ),
        titlePadding: const EdgeInsets.only(bottom: 8, left: 8, right: 8),
      ),
    );
  }
}
