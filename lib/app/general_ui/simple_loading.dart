import 'package:flutter/material.dart';
import 'package:movies_app_train/app/theme/app_colors.dart';

class SimpleLoading extends StatelessWidget {
  const SimpleLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: AppColors.primaryColor,
      ),
    );
  }
}
