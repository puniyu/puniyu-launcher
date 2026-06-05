import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final colorScheme = theme.colorScheme;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: colorScheme.primary.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              LucideIcons.construction,
              size: 36,
              color: colorScheme.primary,
            ),
          ),
          const SizedBox(height: 24),
          Text(title, style: theme.textTheme.h3),
          const SizedBox(height: 8),
          Text(
            '该页面正在维护中，敬请期待',
            style: theme.textTheme.muted,
          ),
        ],
      ),
    );
  }
}
