import 'package:flutter/material.dart';
import 'package:movies_app_train/app/theme/app_colors.dart';

class SimpleLoading extends StatelessWidget {
  final Color color;
  const SimpleLoading({Key? key, this.color = AppColors.primaryColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: color,
      ),
    );
  }
}
