import 'dart:async';
import 'package:flutter/material.dart';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app_train/app/constants/app_constants.dart';
import 'package:movies_app_train/app/router/app_routes.dart';
import 'package:movies_app_train/app/theme/app_colors.dart';
import 'package:movies_app_train/app/utils/general_functions.dart';
import 'package:movies_app_train/movies/presentation/bloc/movies_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late final MoviesBloc moviesBloc;

  @override
  void initState() {
    super.initState();

    moviesBloc = BlocProvider.of<MoviesBloc>(context);
    moviesBloc
      ..add(const GetNowPlayingMoviesEvent())
      ..add(const GetPopularMoviesEvent())
      ..add(const GetTopRatedMoviesEvent())
      ..add(const GetUpcomingMoviesEvent());
    makeAnimation();
  }

  makeAnimation() {
    Future.delayed(const Duration(milliseconds: 400), () => setState(() => _a = true));
    Future.delayed(const Duration(milliseconds: 400), () => setState(() => _b = true));
    Future.delayed(const Duration(milliseconds: 1300), () => setState(() => _c = true));
    Future.delayed(const Duration(milliseconds: 1700), () => setState(() => _e = true));
    Future.delayed(const Duration(milliseconds: 3400), () => setState(() => _d = true));
    Future.delayed(
      const Duration(milliseconds: 3850),
      () => Navigator.of(context).pushReplacementNamed(AppRoutes.moviesScreen),
    );
  }

  @override
  void dispose() {
    setSystemOverlayStyle(Brightness.dark);
    super.dispose();
  }

  bool _a = false;
  bool _b = false;
  bool _c = false;
  bool _d = false;
  bool _e = false;

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    setSystemOverlayStyle(Brightness.light);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            AnimatedContainer(
              duration: Duration(milliseconds: _d ? 900 : 2500),
              curve: _d ? Curves.fastLinearToSlowEaseIn : Curves.elasticOut,
              height: _d
                  ? 0
                  : _a
                      ? h / 2
                      : 20,
              width: 20,
            ),
            AnimatedContainer(
              duration: Duration(
                  seconds: _d
                      ? 1
                      : _c
                          ? 2
                          : 0),
              curve: Curves.fastLinearToSlowEaseIn,
              height: _d
                  ? h
                  : _c
                      ? 80
                      : 20,
              width: _d
                  ? w
                  : _c
                      ? 200
                      : 20,
              decoration: BoxDecoration(
                  color: _b ? AppColors.primaryColor : Colors.transparent,
                  borderRadius: _d ? const BorderRadius.only() : BorderRadius.circular(30)),
              child: Center(
                child: _e
                    ? AnimatedTextKit(
                        totalRepeatCount: 1,
                        animatedTexts: [
                          FadeAnimatedText(
                            AppConstants.appTitle,
                            duration: const Duration(milliseconds: 1700),
                            textStyle: GoogleFonts.dosis(
                              fontSize: 30,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      )
                    : const SizedBox(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
