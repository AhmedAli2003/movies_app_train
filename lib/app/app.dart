import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app_train/app/constants/app_constants.dart';
import 'package:movies_app_train/app/router/app_router.dart';
import 'package:movies_app_train/app/router/app_routes.dart';
import 'package:movies_app_train/app/theme/app_colors.dart';
import 'package:movies_app_train/movies/presentation/bloc/movies_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: AppColors.statusBarColor,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
      ),
    );

    return BlocProvider(
      create: (_) => MoviesBloc(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: AppConstants.appTitle,
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: AppRoutes.splashScreen,
      ),
    );
  }
}
