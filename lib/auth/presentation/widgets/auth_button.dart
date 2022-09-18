import 'package:flutter/material.dart';
import 'package:movies_app_train/app/theme/app_colors.dart';

class AuthButton extends StatelessWidget {
  final VoidCallback onTap;
  final double width;
  final String text;
  const AuthButton({
    Key? key,
    required this.onTap,
    required this.width,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: onTap,
      child: Container(
      width: width,
      padding: const EdgeInsets.symmetric(vertical: 16),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
      ),
    ),
    );
  }
}
