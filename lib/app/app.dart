import 'package:flutter/material.dart';
import 'package:movies_app_train/app/constants/app_constants.dart';
import 'package:movies_app_train/movies/presentation/screens/movies_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppConstants.appTitle,
      home: MoviesScreen(),
    );
  }
}
