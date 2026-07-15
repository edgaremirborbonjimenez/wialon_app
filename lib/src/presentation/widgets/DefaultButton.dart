import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color? color;
  final IconData? icon;
  final double? height;

  const DefaultButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.icon,
    this.color,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      width: double.infinity,
      height: height ?? 56,
      child: ElevatedButton(
        style: theme.elevatedButtonTheme.style,
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) ...[Icon(icon), const SizedBox(width: 8)],
            Text(
              text,
              style: theme.textTheme.titleMedium?.copyWith(color: color),
            ),
          ],
        ),
      ),
    );
  }
}
