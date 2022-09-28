import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app_train/app/router/app_routes.dart';
import 'package:movies_app_train/app/theme/animation_transitions.dart';
import 'package:movies_app_train/auth/presentation/screens/email_verfication_screen.dart';
import 'package:movies_app_train/auth/presentation/screens/login_screen.dart';
import 'package:movies_app_train/auth/presentation/screens/register_screen.dart';
import 'package:movies_app_train/auth/presentation/screens/reset_password_screen.dart';
import 'package:movies_app_train/movies/presentation/blocs/add_user_movies/add_user_movies_bloc.dart';
import 'package:movies_app_train/movies/presentation/blocs/get_user_movies/get_user_movies_bloc.dart';
import 'package:movies_app_train/movies/presentation/blocs/movie_details/movie_details_bloc.dart';
import 'package:movies_app_train/movies/presentation/blocs/search/search_bloc.dart';
import 'package:movies_app_train/movies/presentation/screens/details_list_movies_screen.dart';
import 'package:movies_app_train/movies/presentation/screens/details_movie_screen.dart';
import 'package:movies_app_train/movies/presentation/screens/movies_screen.dart';
import 'package:movies_app_train/movies/presentation/screens/splash_screen.dart';
import 'package:movies_app_train/movies/presentation/screens/user_movies_screen.dart';

class AppRouter {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case AppRoutes.moviesScreen:
        return ThisIsFadeRoute(
          route: MultiBlocProvider(
            providers: [
              BlocProvider(create: (_) => UserMoviesBloc()),
              BlocProvider(create: (_) => AddUserMoviesBloc()),
              BlocProvider(create: (_) => SearchBloc()),
            ],
            child: const MoviesScreen(),
          ),
        );
      case AppRoutes.detailsListMoviesScreen:
        return SlideTransitionRightToLeft(
          page: MultiBlocProvider(
            providers: [
              BlocProvider(create: (_) => UserMoviesBloc()),
              BlocProvider(create: (_) => AddUserMoviesBloc()),
            ],
            child: const DetailsListMoviesScreen(),
          ),
          routeSettings: settings,
        );
      case AppRoutes.detailsMovieScreen:
        return ThisIsFadeRoute(
          routeSettings: settings,
          route: MultiBlocProvider(
            providers: [
              BlocProvider(create: (_) => MovieDetailsBloc()),
              BlocProvider(create: (_) => UserMoviesBloc()),
              BlocProvider(create: (_) => AddUserMoviesBloc()),
            ],
            child: const DetailsMovieScreen(),
          ),
        );
      case AppRoutes.userMoviesScreen:
        return ThisIsFadeRoute(
          routeSettings: settings,
          route: MultiBlocProvider(
            providers: [
              BlocProvider(create: (_) => UserMoviesBloc()),
              BlocProvider(create: (_) => AddUserMoviesBloc()),
            ],
            child: const UserMoviesScreen(),
          ),
        );
      case AppRoutes.registerScreen:
        return ThisIsFadeRoute(route: const RegisterScreen());
      case AppRoutes.loginScreen:
        return ThisIsFadeRoute(route: const LoginScreen());
      case AppRoutes.resetPasswordScreen:
        return ThisIsFadeRoute(route: const ResetPasswordScreen());
      case AppRoutes.emailVerficationScreen:
        return ThisIsFadeRoute(route: const EmailVerficationScreen());
      default:
        return null;
    }
  }
}
