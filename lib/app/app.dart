import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app_train/app/constants/app_constants.dart';
import 'package:movies_app_train/app/router/app_router.dart';
import 'package:movies_app_train/app/router/app_routes.dart';
import 'package:movies_app_train/app/theme/app_theme.dart';
import 'package:movies_app_train/app/utils/general_functions.dart';
import 'package:movies_app_train/auth/presentation/controller/auth_provider.dart';
import 'package:movies_app_train/movies/presentation/blocs/movies_bloc/movies_bloc.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    setSystemOverlayStyle(Brightness.dark);

    return ChangeNotifierProvider(
      create: (_) => AuthProvider(),
      child: BlocProvider(
        create: (_) => MoviesBloc(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: AppConstants.appTitle,
          theme: AppTheme.theme,
          onGenerateRoute: AppRouter.onGenerateRoute,
          initialRoute: AppRoutes.splashScreen,
        ),
      ),
    );
  }
}
