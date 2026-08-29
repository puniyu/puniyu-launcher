import 'package:flutter/widgets.dart';
import 'package:forui/forui.dart';
import 'package:material_ui/material_ui.dart' hide Theme;

class SettingItem extends StatelessWidget {
  const SettingItem({
    super.key,
    required this.title,
    required this.subTitle,
    required this.content,
  });

  final String title;
  final String subTitle;
  final Widget content;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: context.theme.typography.display.lg),
        const SizedBox(height: 4),
        Text(
          subTitle,
          style: context.theme.typography.body.sm.copyWith(
            color: context.theme.colors.mutedForeground,
          ),
        ),
        const SizedBox(height: 16),
        content,
      ],
    );
  }
}

class SettingGroup extends StatelessWidget {
  const SettingGroup({
    super.key,
    required this.title,
    required this.items,
    this.header,
  });

  final String title;
  final List<SettingItem> items;
  final Widget? header;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        const pagePadding = 24.0;
        final contentWidth = (constraints.maxWidth - pagePadding * 2).clamp(
          0.0,
          880.0,
        );

        return SingleChildScrollView(
          padding: const EdgeInsets.all(pagePadding),
          child: SizedBox(
            width: contentWidth,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (header case final header?) ...[
                  header,
                  const SizedBox(height: 24),
                ],
                FCard(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: context.theme.typography.display.xl2,
                        ),
                        const SizedBox(height: 16),
                        for (final item in items) ...[
                          item,
                          if (item != items.last) const SizedBox(height: 16),
                        ],
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
