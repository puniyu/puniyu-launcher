import 'package:flutter/widgets.dart';
import 'package:forui/forui.dart';
import 'package:puniyu_app/platform.dart';

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
    final header = _ItemHeader(title: title, subTitle: subTitle);

    if (isDesktop()) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(flex: 2, child: header),
          const SizedBox(width: 24),
          Flexible(
            flex: 3,
            child: Align(alignment: Alignment.centerRight, child: content),
          ),
        ],
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [header, const SizedBox(height: 16), content],
    );
  }
}

class _ItemHeader extends StatelessWidget {
  const _ItemHeader({required this.title, required this.subTitle});

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(title, style: context.theme.typography.display.md),
        const SizedBox(height: 4),
        Text(
          subTitle,
          style: context.theme.typography.body.sm.copyWith(
            color: context.theme.colors.mutedForeground,
          ),
        ),
      ],
    );
  }
}

class SettingGroup extends StatelessWidget {
  const SettingGroup({super.key, required this.title, required this.items});

  final String title;
  final List<SettingItem> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: context.theme.typography.display.lg),
        const SizedBox(height: 12),
        FCard(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (final (index, item) in items.indexed) ...[
                  if (index > 0) ...[
                    const SizedBox(height: 16),
                    Container(height: 1, color: context.theme.colors.border),
                    const SizedBox(height: 16),
                  ],
                  item,
                ],
              ],
            ),
          ),
        ),
      ],
    );
  }
}
