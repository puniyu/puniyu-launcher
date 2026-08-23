import 'package:flutter/material.dart' hide Route;
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:puniyu_launcher/platform.dart';
import 'package:puniyu_launcher/router.dart';

class NavItem {
  const NavItem({required this.route, required this.icon, required this.label});

  final Route route;
  final IconData icon;
  final String label;
}

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    const items = [
      NavItem(
        route: DashboardRoute(),
        icon: LucideIcons.layoutDashboard,
        label: '控制台',
      ),
      NavItem(route: LogsRoute(), icon: LucideIcons.scrollText, label: '日志'),
      NavItem(route: SettingsRoute(), icon: LucideIcons.settings, label: '设置'),
    ];
    return isDesktop() ? _Desktop(items: items) : _Mobile(items: items);
  }
}

class _Desktop extends StatelessWidget {
  const _Desktop({required this.items});

  final List<NavItem> items;

  @override
  Widget build(BuildContext context) {
    final colors = ShadTheme.of(context).colorScheme;
    final currentRoute = context.watch<RouterManager>().current;

    return Container(
      width: 64,
      color: colors.background,
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
        children: [
          for (final item in items)
            Builder(
              builder: (context) {
                final selected = currentRoute == item.route;
                final foreground = selected
                    ? colors.primaryForeground
                    : colors.mutedForeground;

                return Semantics(
                  button: true,
                  selected: selected,
                  label: item.label,
                  child: Tooltip(
                    message: item.label,
                    waitDuration: const Duration(milliseconds: 400),
                    child: GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () =>
                          context.read<RouterManager>().navigateTo(item.route),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 180),
                        curve: Curves.easeOut,
                        height: 44,
                        decoration: BoxDecoration(
                          color: selected ? colors.primary : Colors.transparent,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Row(
                          children: [
                            AnimatedContainer(
                              duration: const Duration(milliseconds: 220),
                              curve: Curves.easeOutCubic,
                              width: 3,
                              height: selected ? 20 : 0,
                              decoration: BoxDecoration(
                                color: selected
                                    ? colors.accentForeground
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(2),
                              ),
                            ),
                            Expanded(
                              child: Center(
                                child: Icon(
                                  item.icon,
                                  size: 19,
                                  color: foreground,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
        ],
      ),
    );
  }
}

class _Mobile extends StatelessWidget {
  const _Mobile({required this.items});

  final List<NavItem> items;

  @override
  Widget build(BuildContext context) {
    final colors = ShadTheme.of(context).colorScheme;
    final currentRoute = context.watch<RouterManager>().current;

    return Container(
      height: 58,
      color: colors.secondary,
      child: SafeArea(
        top: false,
        bottom: false,
        child: Row(
          children: [
            for (final item in items)
              Expanded(
                child: Builder(
                  builder: (context) {
                    final selected = currentRoute == item.route;
                    final foreground = selected
                        ? colors.secondaryForeground
                        : colors.mutedForeground;

                    return Semantics(
                      button: true,
                      selected: selected,
                      label: item.label,
                      child: GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () => context.read<RouterManager>().navigateTo(
                          item.route,
                        ),
                        child: SizedBox(
                          height: 58,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(item.icon, size: 20, color: foreground),
                              const SizedBox(height: 3),
                              AnimatedDefaultTextStyle(
                                duration: const Duration(milliseconds: 180),
                                curve: Curves.easeOut,
                                style: TextStyle(
                                  color: foreground,
                                  fontSize: 11,
                                  fontWeight: selected
                                      ? FontWeight.w600
                                      : FontWeight.w400,
                                ),
                                child: Text(
                                  item.label,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
