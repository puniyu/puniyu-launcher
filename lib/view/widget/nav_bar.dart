import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:forui/forui.dart';
import 'package:material_ui/material_ui.dart';
import 'package:puniyu_app/l10n/generated/app_localizations.dart';
import 'package:puniyu_app/platform.dart';
import 'package:puniyu_app/router.gr.dart';

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
    final l10n = AppLocalizations.of(context);
    final topItems = [
      NavItem(
        route: const DashboardRoute(),
        icon: FLucideIcons.layoutDashboard,
        label: l10n.dashboard,
      ),
    ];
    final bottomItems = [
      NavItem(
        route: const SettingRoute(),
        icon: FLucideIcons.settings,
        label: l10n.setting,
      ),
    ];
    final currentRoute = context.topRoute.name;

    return isDesktop()
        ? _Desktop(
            topItems: topItems,
            bottomItems: bottomItems,
            currentRoute: currentRoute,
          )
        : _Mobile(
            items: [...topItems, ...bottomItems],
            currentRoute: currentRoute,
          );
  }
}

class _Desktop extends StatelessWidget {
  const _Desktop({
    required this.topItems,
    required this.bottomItems,
    required this.currentRoute,
  });

  final List<NavItem> topItems;
  final List<NavItem> bottomItems;
  final String currentRoute;

  @override
  Widget build(BuildContext context) {
    final colors = context.theme.colors;
    final topIndex = topItems.indexWhere(
      (item) => item.route.routeName == currentRoute,
    );
    final bottomIndex = bottomItems.indexWhere(
      (item) => item.route.routeName == currentRoute,
    );
    final hasSelection = topIndex >= 0 || bottomIndex >= 0;

    Widget buildItem(NavItem item) {
      final selected = item.route.routeName == currentRoute;
      final foreground = selected
          ? colors.primaryForeground
          : colors.mutedForeground;

      return Semantics(
        button: true,
        selected: selected,
        label: item.label,
        child: FTooltip(
          tipBuilder: (_, _) => Text(item.label),
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => AutoRouter.of(context).navigate(item.route),
            child: SizedBox(
              height: 44,
              child: Center(
                child: Icon(item.icon, size: 19, color: foreground),
              ),
            ),
          ),
        ),
      );
    }

    final selectedTop = topIndex >= 0 ? topIndex * 44.0 : 0.0;

    return ColoredBox(
      color: colors.background,
      child: SizedBox(
        width: 64,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final target = topIndex >= 0
                  ? selectedTop
                  : constraints.maxHeight -
                        (bottomItems.length - bottomIndex) * 44.0;

              return Stack(
                children: [
                  if (hasSelection)
                    AnimatedPositioned(
                      duration: const Duration(milliseconds: 360),
                      curve: Curves.easeInOutCubic,
                      top: target,
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
                            height: 20,
                            margin: const EdgeInsets.symmetric(vertical: 12),
                            decoration: BoxDecoration(
                              color: colors.primaryForeground,
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                        ),
                      ),
                    ),
                  Positioned.fill(
                    child: Column(
                      children: [
                        for (final item in topItems) buildItem(item),
                        const Spacer(),
                        for (final item in bottomItems) buildItem(item),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class _Mobile extends StatelessWidget {
  const _Mobile({required this.items, required this.currentRoute});

  final List<NavItem> items;
  final String currentRoute;

  @override
  Widget build(BuildContext context) {
    final colors = context.theme.colors;
    final selectedIndex = items.indexWhere(
      (item) => item.route.routeName == currentRoute,
    );

    return ColoredBox(
      color: colors.background,
      child: SafeArea(
        top: false,
        minimum: const EdgeInsets.fromLTRB(16, 0, 16, 8),
        child: Container(
          height: 70,
          decoration: BoxDecoration(
            color: colors.card.withValues(alpha: 0.9),
            borderRadius: BorderRadius.circular(20),
          ),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final itemW = constraints.maxWidth / items.length;
              return Stack(
                children: [
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeOutCubic,
                    left: selectedIndex * itemW + (itemW - 48) / 2,
                    top: 8,
                    width: 48,
                    height: 32,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: colors.primary.withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: Row(
                      children: [
                        for (final item in items)
                          Expanded(child: _buildItem(context, item)),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildItem(BuildContext context, NavItem item) {
    final selected = item.route.routeName == currentRoute;
    final colors = context.theme.colors;
    final foreground = selected ? colors.primary : colors.mutedForeground;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => AutoRouter.of(context).navigate(item.route),
      child: Column(
        children: [
          const SizedBox(height: 8),
          SizedBox(
            width: 48,
            height: 32,
            child: Center(child: Icon(item.icon, size: 22, color: foreground)),
          ),
          const SizedBox(height: 8),
          Text(
            item.label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: foreground,
              fontSize: 10,
              fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
