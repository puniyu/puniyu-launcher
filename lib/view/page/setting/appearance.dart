import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forui/forui.dart';
import 'package:material_ui/material_ui.dart' hide Theme;
import 'package:puniyu_launcher/l10n/generated/app_localizations.dart';
import 'package:puniyu_launcher/theme.dart';
import 'package:puniyu_launcher/view/widget/setting.dart';

class AppearanceSetting extends ConsumerWidget {
  const AppearanceSetting({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final manager = ref.watch(themeControllerProvider);
    final controller = ref.read(themeControllerProvider.notifier);
    final l10n = AppLocalizations.of(context);
    final themeModeItems = [
      _ThemeModeItem(
        icon: FLucideIcons.sun,
        label: l10n.themeModeLight,
        isSelected: manager.themeMode == ThemeMode.light,
        onTap: () => controller.setThemeMode(ThemeMode.light),
      ),
      _ThemeModeItem(
        icon: FLucideIcons.moon,
        label: l10n.themeModeDark,
        isSelected: manager.themeMode == ThemeMode.dark,
        onTap: () => controller.setThemeMode(ThemeMode.dark),
      ),
      _ThemeModeItem(
        icon: FLucideIcons.monitor,
        label: l10n.themeModeSystem,
        isSelected: manager.themeMode == ThemeMode.system,
        onTap: () => controller.setThemeMode(ThemeMode.system),
      ),
    ];

    return SettingGroup(
      title: l10n.appearance,
      items: [
        SettingItem(
          title: l10n.themeColor,
          subTitle: l10n.themeColorDesc,
          content: Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              for (final theme in manager.themes)
                _ThemeColorItem(
                  color: theme.light.primary,
                  label: theme.name,
                  isSelected: manager.current == theme,
                  onTap: () => controller.setTheme(theme.id),
                ),
            ],
          ),
        ),
        SettingItem(
          title: l10n.themeMode,
          subTitle: l10n.themeModeDesc,
          content: LayoutBuilder(
            builder: (context, constraints) {
              final w = (constraints.maxWidth - 8) / 2;
              return Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  for (final (i, item) in themeModeItems.indexed)
                    SizedBox(
                      width: themeModeItems.length.isOdd && i == themeModeItems.length - 1
                          ? constraints.maxWidth
                          : w,
                      child: item,
                    ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}

class _ThemeColorItem extends StatelessWidget {
  const _ThemeColorItem({
    required this.color,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final Color color;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.theme.colors;

    return Semantics(
      button: true,
      selected: isSelected,
      label: label,
      child: FTooltip(
        tipBuilder: (_, _) => Text(label),
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: onTap,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
              border: Border.all(
                color: isSelected ? colors.primary : colors.border,
                width: isSelected ? 3 : 1.5,
              ),
              boxShadow: isSelected
                  ? [
                      BoxShadow(
                        color: color.withValues(alpha: 0.4),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ]
                  : null,
            ),
            child: isSelected
                ? Icon(FLucideIcons.check, size: 18, color: colors.background)
                : null,
          ),
        ),
      ),
    );
  }
}

class _ThemeModeItem extends StatelessWidget {
  const _ThemeModeItem({
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return FButton(
      onPress: onTap,
      selected: isSelected,
      semanticsLabel: label,
      variant: isSelected ? FButtonVariant.primary : FButtonVariant.outline,
      size: FButtonSizeVariant.lg,
      prefix: Icon(icon, size: 16),
      child: Text(label, maxLines: 1, overflow: TextOverflow.ellipsis),
    );
  }
}
