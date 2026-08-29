import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:forui/forui.dart';
import 'package:material_ui/material_ui.dart' hide Theme;
import 'package:puniyu_launcher/l10n/generated/app_localizations.dart';
import 'package:puniyu_launcher/platform.dart';
import 'package:puniyu_launcher/view/page/setting/appearance.dart';

@RoutePage()
class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  final _sections = [
    _SettingSection(
      label: (l10n) => l10n.appearance,
      child: const AppearanceSetting(),
    ),
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final selectedIndex = _selectedIndex.clamp(0, _sections.length - 1);
    final selectedSection = _sections[selectedIndex];

    return isDesktop()
        ? _Desktop(
            sections: _sections,
            selectedIndex: selectedIndex,
            selectedChild: selectedSection.content,
            onSelect: (index) => setState(() => _selectedIndex = index),
            l10n: l10n,
          )
        : _Mobile(child: selectedSection.content);
  }
}

class _SettingSection {
  _SettingSection({required this.label, required this.child});

  final String Function(AppLocalizations) label;
  final GlobalKey key = GlobalKey();
  final Widget child;

  Widget get content => KeyedSubtree(key: key, child: child);
}

class _Mobile extends StatelessWidget {
  const _Mobile({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) => child;
}

class _Desktop extends StatelessWidget {
  const _Desktop({
    required this.sections,
    required this.selectedIndex,
    required this.selectedChild,
    required this.onSelect,
    required this.l10n,
  });

  final List<_SettingSection> sections;
  final int selectedIndex;
  final Widget selectedChild;
  final ValueChanged<int> onSelect;
  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    final colors = context.theme.colors;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          width: 232,
          child: ColoredBox(
            color: colors.background,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return Stack(
                    children: [
                      AnimatedPositioned(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOutCubic,
                        top: selectedIndex * 48.0,
                        left: 0,
                        right: 0,
                        height: 44,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: colors.primary,
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                      ),
                      Positioned.fill(
                        child: Column(
                          children: [
                            for (int i = 0; i < sections.length; i++)
                              _SectionMenuItem(
                                label: sections[i].label(l10n),
                                selected: i == selectedIndex,
                                onTap: () => onSelect(i),
                              ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
        Expanded(child: selectedChild),
      ],
    );
  }
}

class _SectionMenuItem extends StatelessWidget {
  const _SectionMenuItem({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.theme.colors;

    return Semantics(
      button: true,
      selected: selected,
      label: label,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: SizedBox(
          height: 44,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Text(
                label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: context.theme.typography.body.sm.copyWith(
                  color: selected
                      ? colors.primaryForeground
                      : colors.foreground,
                  fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
