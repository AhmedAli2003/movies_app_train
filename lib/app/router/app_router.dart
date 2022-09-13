import 'package:flutter/material.dart';
import 'package:movies_app_train/app/router/app_routes.dart';
import 'package:movies_app_train/movies/presentation/screens/details_list_movies_screen.dart';
import 'package:movies_app_train/movies/presentation/screens/details_movie_screen.dart';
import 'package:movies_app_train/movies/presentation/screens/movies_screen.dart';
import 'package:movies_app_train/movies/presentation/screens/splash_screen.dart';

class AppRouter {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case AppRoutes.moviesScreen:
        return MaterialPageRoute(builder: (_) => const MoviesScreen());
      case AppRoutes.detailsListMoviesScreen:
        return MaterialPageRoute(builder: (_) => const DetailsListMoviesScreen());
      case AppRoutes.detailsMovieScreen:
        return MaterialPageRoute(builder: (_) => const DetailsMovieScreen());
      default:
        return null;
    }
  }
}
