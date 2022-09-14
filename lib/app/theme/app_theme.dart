import 'package:flutter/material.dart';
import 'package:movies_app_train/app/theme/app_colors.dart';

class AppTheme {
  static final ThemeData theme = ThemeData(
    // Colors
    scaffoldBackgroundColor: AppColors.primaryColor,
    primaryColor: AppColors.primaryColor,
    colorScheme: const ColorScheme.dark(
      primary: AppColors.primaryColor,
      secondary: AppColors.secondaryColor,
    ),
    // Text Theme
    textTheme: const TextTheme(
      
    ),
  );
}
