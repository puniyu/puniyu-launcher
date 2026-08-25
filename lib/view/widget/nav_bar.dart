import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:puniyu_launcher/l10n/generated/app_localizations.dart';
import 'package:puniyu_launcher/platform.dart';
import 'package:puniyu_launcher/router.gr.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class NavItem {
  const NavItem({required this.route, required this.icon, required this.label});

  final PageRouteInfo route;
  final IconData icon;
  final String label;
}

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final currentRouteName = context.topRoute.name;
    final l10n = AppLocalizations.of(context);
    final items = [
      NavItem(
        route: const DashboardRoute(),
        icon: LucideIcons.layoutDashboard,
        label: l10n.dashboard,
      ),
      NavItem(
        route: const SettingRoute(),
        icon: LucideIcons.settings,
        label: l10n.setting,
      ),
    ];
    final selectedIndex = items.indexWhere(
      (item) => item.route.routeName == currentRouteName,
    );

    return isDesktop()
        ? _Desktop(items: items, selectedIndex: selectedIndex)
        : _Mobile(items: items, selectedIndex: selectedIndex);
  }
}

class _Desktop extends StatelessWidget {
  const _Desktop({required this.items, required this.selectedIndex});

  final List<NavItem> items;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    final currentRouteName = context.topRoute.name;
    final colors = ShadTheme.of(context).colorScheme;

    return Container(
      width: 64,
      color: colors.background,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      child: Stack(
        children: [
          if (selectedIndex >= 0)
            AnimatedPositioned(
              duration: const Duration(milliseconds: 360),
              curve: Curves.easeInOutCubic,
              top: selectedIndex * 44,
              left: 0,
              right: 0,
              height: 44,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: colors.primary,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    width: 3,
                    height: 24,
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color: colors.primaryForeground,
                      borderRadius: BorderRadius.circular(1.5),
                    ),
                  ),
                ),
              ),
            ),
          Positioned.fill(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                for (final item in items)
                  Semantics(
                    button: true,
                    selected: item.route.routeName == currentRouteName,
                    label: item.label,
                    child: ShadTooltip(
                      waitDuration: const Duration(milliseconds: 800),
                      builder: (context) => Text(item.label),
                      child: ShadGestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () =>
                            AutoRouter.of(context).navigate(item.route),
                        child: SizedBox(
                          height: 44,
                          child: Center(
                            child: Icon(
                              item.icon,
                              size: 19,
                              color: item.route.routeName == currentRouteName
                                  ? colors.primaryForeground
                                  : colors.mutedForeground,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Mobile extends StatelessWidget {
  const _Mobile({required this.items, required this.selectedIndex});

  final List<NavItem> items;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    final currentRouteName = context.topRoute.name;
    final colors = ShadTheme.of(context).colorScheme;

    return ColoredBox(
      color: colors.secondary,
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: 72,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: LayoutBuilder(
              builder: (context, constraints) {
                final itemWidth = constraints.maxWidth / items.length;
                const pillWidth = 64.0;
                const iconSlotHeight = 32.0;
                final left = selectedIndex < 0
                    ? 0.0
                    : selectedIndex * itemWidth + (itemWidth - pillWidth) / 2;

                return Stack(
                  children: [
                    if (selectedIndex >= 0)
                      AnimatedPositioned(
                        duration: const Duration(milliseconds: 320),
                        curve: Curves.easeInOutCubic,
                        left: left,
                        top: 8,
                        width: pillWidth,
                        height: iconSlotHeight,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: colors.primary,
                            borderRadius: BorderRadius.circular(999),
                          ),
                        ),
                      ),
                    Positioned(
                      top: 8,
                      left: 0,
                      right: 0,
                      child: Row(
                        children: [
                          for (final item in items)
                            Expanded(
                              child: Semantics(
                                button: true,
                                selected:
                                    item.route.routeName ==
                                    context.topRoute.name,
                                label: item.label,
                                child: GestureDetector(
                                  behavior: HitTestBehavior.opaque,
                                  onTap: () => AutoRouter.of(
                                    context,
                                  ).navigate(item.route),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: iconSlotHeight,
                                        child: Center(
                                          child: Icon(
                                            item.icon,
                                            size: 20,
                                            color:
                                                item.route.routeName ==
                                                    currentRouteName
                                                ? colors.primaryForeground
                                                : colors.mutedForeground,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        item.label,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          color:
                                              item.route.routeName ==
                                                  currentRouteName
                                              ? colors.foreground
                                              : colors.mutedForeground,
                                          fontSize: 11,
                                          fontWeight:
                                              item.route.routeName ==
                                                  currentRouteName
                                              ? FontWeight.w600
                                              : FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
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
    );
  }
}
