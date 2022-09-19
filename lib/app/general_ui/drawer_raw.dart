import 'package:flutter/material.dart';
import 'package:movies_app_train/app/theme/app_colors.dart';

class DrawerRow extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool isActive;
  final VoidCallback onTap;
  const DrawerRow({
    Key? key,
    required this.icon,
    required this.title,
    this.isActive = false,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextStyle tStyle = TextStyle(
      color: isActive ? AppColors.primaryColor : Colors.grey.shade700,
      fontSize: isActive ? 18.0 : 16.0,
      fontWeight: isActive ? FontWeight.bold : FontWeight.w400,
    );
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: Row(
          children: [
            Icon(
              icon,
              color: isActive ? AppColors.primaryColor : Colors.grey.shade700,
            ),
            const SizedBox(width: 10.0),
            Text(
              title,
              style: tStyle,
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
