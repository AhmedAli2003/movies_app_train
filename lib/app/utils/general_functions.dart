import 'package:flutter/services.dart';
import 'package:movies_app_train/app/theme/app_colors.dart';
import 'package:movies_app_train/movies/domain/entities/genre.dart';

void setSystemOverlayStyle(Brightness brightness) {
  if (brightness == Brightness.dark) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: AppColors.statusBarColor,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: AppColors.primaryColor,
        systemNavigationBarDividerColor: AppColors.primaryColor,
      ),
    );
  } else {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: AppColors.statusBarColor,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: AppColors.white,
        systemNavigationBarDividerColor: AppColors.white,
      ),
    );
  }
}

String getStringOfGenre(List<Genre> genres) {
  String stringOfgenre = '';
  genres = genres.length > 4 ? genres.sublist(0, 4) : genres;
  for (Genre genre in genres) {
    stringOfgenre += '${genre.name}-';
  }
  return stringOfgenre.substring(0, stringOfgenre.length - 2);
}

String getStringTime(int runtime) {
  int hours = runtime ~/ 60;
  int minutes = runtime % 60;
  return hours > 0 ? '${hours}h${minutes}m' : '${minutes}m';
}
