import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:puniyu_launcher/platform.dart';
import 'package:puniyu_launcher/router.dart';

const _items = [
  _NavItem(
    route: AppRoute.dashboard,
    icon: LucideIcons.layoutDashboard,
    label: '控制台',
  ),
  _NavItem(route: AppRoute.logs, icon: LucideIcons.scrollText, label: '日志'),
  _NavItem(route: AppRoute.settings, icon: LucideIcons.settings, label: '设置'),
];

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return isDesktop() ? const _DeskTop() : const _Mobile();
  }
}

class _DeskTop extends StatefulWidget {
  const _DeskTop();

  @override
  State<_DeskTop> createState() => _DeskTopState();
}

class _DeskTopState extends State<_DeskTop> {
  bool _expanded = true;

  static const _expandedWidth = 220.0;
  static const _collapsedWidth = 64.0;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final colorScheme = theme.colorScheme;
    final currentRoute = context.watch<RouterManager>().current;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeOut,
      width: _expanded ? _expandedWidth : _collapsedWidth,
      decoration: BoxDecoration(
        color: colorScheme.muted,
        border: Border(right: BorderSide(color: colorScheme.border)),
      ),
      child: Column(
        children: [
          const SizedBox(height: 8),
          // Nav items
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              itemCount: _items.length,
              itemBuilder: (context, index) {
                final item = _items[index];
                final isSelected = currentRoute == item.route;

                return Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Tooltip(
                    message: _expanded ? '' : item.label,
                    waitDuration: const Duration(milliseconds: 400),
                    child: Material(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(10),
                      child: InkWell(
                        onTap: () => context
                            .read<RouterManager>()
                            .navigateTo(item.route),
                        borderRadius: BorderRadius.circular(10),
                        hoverColor: colorScheme.accent,
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 150),
                          padding: EdgeInsets.symmetric(
                            horizontal: _expanded ? 12 : 0,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? colorScheme.primary
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: isSelected
                                ? [
                                    BoxShadow(
                                      color: colorScheme.primary
                                          .withValues(alpha: 0.25),
                                      blurRadius: 10,
                                      offset: const Offset(0, 2),
                                    ),
                                  ]
                                : null,
                          ),
                          child: Row(
                            mainAxisAlignment: _expanded
                                ? MainAxisAlignment.start
                                : MainAxisAlignment.center,
                            children: [
                              Icon(
                                item.icon,
                                size: 18,
                                color: isSelected
                                    ? colorScheme.primaryForeground
                                    : colorScheme.mutedForeground,
                              ),
                              if (_expanded) ...[
                                const SizedBox(width: 12),
                                Flexible(
                                  child: Text(
                                    item.label,
                                    overflow: TextOverflow.ellipsis,
                                    style: theme.textTheme.p.copyWith(
                                      fontSize: 14,
                                      color: isSelected
                                          ? colorScheme.primaryForeground
                                          : colorScheme.foreground
                                              .withValues(alpha: 0.7),
                                      fontWeight: isSelected
                                          ? FontWeight.w600
                                          : FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          // Bottom toggle
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: ShadSeparator.horizontal(color: colorScheme.border),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Material(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(10),
              child: InkWell(
                onTap: () => setState(() => _expanded = !_expanded),
                borderRadius: BorderRadius.circular(10),
                hoverColor: colorScheme.accent,
                child: Container(
                  height: 40,
                  padding: EdgeInsets.symmetric(
                    horizontal: _expanded ? 12 : 0,
                  ),
                  child: Row(
                    mainAxisAlignment: _expanded
                        ? MainAxisAlignment.start
                        : MainAxisAlignment.center,
                    children: [
                      AnimatedRotation(
                        turns: _expanded ? 0 : 0.5,
                        duration: const Duration(milliseconds: 200),
                        child: Icon(
                          LucideIcons.chevronsLeft,
                          size: 18,
                          color: colorScheme.mutedForeground,
                        ),
                      ),
                      if (_expanded) ...[
                        const SizedBox(width: 12),
                        Text(
                          '收起侧栏',
                          style: theme.textTheme.small.copyWith(
                            color: colorScheme.mutedForeground,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Mobile extends StatelessWidget {
  const _Mobile();

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final colorScheme = theme.colorScheme;
    final currentRoute = context.watch<RouterManager>().current;

    return Container(
      height: 56,
      decoration: BoxDecoration(
        color: colorScheme.muted,
        border: Border(top: BorderSide(color: colorScheme.border)),
      ),
      child: SafeArea(
        top: false,
        bottom: false,
        child: Row(
          children: _items.map((item) {
            final isSelected = currentRoute == item.route;

            return Expanded(
              child: InkWell(
                onTap: () =>
                    context.read<RouterManager>().navigateTo(item.route),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      item.icon,
                      size: 20,
                      color: isSelected
                          ? colorScheme.primary
                          : colorScheme.mutedForeground,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      item.label,
                      style: theme.textTheme.small.copyWith(
                        color: isSelected
                            ? colorScheme.primary
                            : colorScheme.mutedForeground,
                        fontWeight:
                            isSelected ? FontWeight.w600 : FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class _NavItem {
  const _NavItem({
    required this.route,
    required this.icon,
    required this.label,
  });

  final AppRoute route;
  final IconData icon;
  final String label;
}
