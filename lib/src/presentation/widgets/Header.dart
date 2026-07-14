import 'package:flutter/material.dart';
import 'package:wialon_app/config/theme/AppColors.dart';

class Header extends StatelessWidget {
  final String title;
  final IconData? icon;
  final Color? color;

  const Header({
    super.key,
    required this.title,
    this.icon,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 8),
        Row(
          children: [
            if (icon != null) ...[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Icon(icon, size: 40),
              ),
            ],
            Text(
              title,
              style: TextStyle(
                color: AppColors.textPrimary,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
