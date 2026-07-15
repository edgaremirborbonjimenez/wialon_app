import 'package:flutter/material.dart';
import 'package:wialon_app/config/theme/AppColors.dart';

class DefaultBanner extends StatelessWidget {
  final String text;
  const DefaultBanner({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
     return Container(
      margin: const EdgeInsets.only(top: 12),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.info_outline, size: 14, color: AppColors.primary),
          const SizedBox(width: 6),
          Text(
            'Estos son los últimos datos cargados',
            style: Theme.of(
              context,
            ).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}