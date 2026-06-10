import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  static const _statusItems = [
    (icon: LucideIcons.clock, label: '运行时间', value: '2h 34m'),
    (icon: LucideIcons.cpu, label: 'CPU 使用', value: '12%'),
    (icon: LucideIcons.hardDrive, label: '内存使用', value: '128 MB'),
    (icon: LucideIcons.messageCircle, label: '消息处理', value: '1,234'),
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final layout = _DashboardLayout(constraints);

        return Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: layout.pagePadding,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const _Header(),
                    const SizedBox(height: 28),
                    Wrap(
                      spacing: _DashboardLayout.gap,
                      runSpacing: _DashboardLayout.gap,
                      children: _statusItems
                          .map(
                            (e) => _StatusCard(
                              icon: e.icon,
                              label: e.label,
                              value: e.value,
                              cardWidth: layout.cardWidth,
                            ),
                          )
                          .toList(),
                    ),
                    const SizedBox(height: 28),
                    if (layout.isWide)
                      const Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(flex: 3, child: _ActionCard()),
                          SizedBox(width: 20),
                          Expanded(flex: 2, child: _BotInfoCard()),
                        ],
                      )
                    else
                      const Column(
                        children: [
                          _ActionCard(),
                          SizedBox(height: 20),
                          _BotInfoCard(),
                        ],
                      ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _DashboardLayout {
  _DashboardLayout(BoxConstraints constraints) {
    final width = constraints.maxWidth;
    final padding = width > 600 ? 28.0 : 16.0;
    final vertical = constraints.maxHeight > 500 ? 36.0 : 16.0;
    pagePadding = EdgeInsets.fromLTRB(padding, vertical, padding, vertical);
    final contentWidth = width - padding * 2;
    isWide = contentWidth > 700;

    const minWidth = 200.0;
    final columns = ((contentWidth + gap) / (minWidth + gap)).floor().clamp(
      1,
      4,
    );
    cardWidth = (contentWidth - gap * (columns - 1)) / columns;
  }

  static const double gap = 16.0;
  late final EdgeInsets pagePadding;
  late final bool isWide;
  late final double cardWidth;
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final colorScheme = theme.colorScheme;

    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('控制台', style: theme.textTheme.h2),
              const SizedBox(height: 6),
              Text(
                '管理你的 Bot 实例',
                style: theme.textTheme.muted.copyWith(fontSize: 14),
              ),
            ],
          ),
        ),
        ShadBadge(
          backgroundColor: colorScheme.primary.withValues(alpha: 0.12),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 7,
                height: 7,
                decoration: BoxDecoration(
                  color: const Color(0xFF7DD3A8),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF7DD3A8).withValues(alpha: 0.5),
                      blurRadius: 6,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Text(
                '运行中',
                style: theme.textTheme.small.copyWith(
                  color: colorScheme.primary,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _StatusCard extends StatelessWidget {
  const _StatusCard({
    required this.icon,
    required this.label,
    required this.value,
    required this.cardWidth,
  });

  final IconData icon;
  final String label;
  final String value;
  final double cardWidth;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final colorScheme = theme.colorScheme;

    return SizedBox(
      width: cardWidth,
      child: ShadCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                _IconBadge(icon: icon, color: colorScheme.primary),
                const SizedBox(width: 12),
                Text(label, style: theme.textTheme.muted),
              ],
            ),
            const SizedBox(height: 14),
            Text(value, style: theme.textTheme.h3),
          ],
        ),
      ),
    );
  }
}

class _ActionCard extends StatelessWidget {
  const _ActionCard();

  @override
  Widget build(BuildContext context) {
    final colorScheme = ShadTheme.of(context).colorScheme;

    return ShadCard(
      title: const Text('快捷操作'),
      description: const Text('管理 Bot 的运行状态'),
      child: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Column(
          children: [
            const _ActionTile(
              icon: LucideIcons.play,
              label: '启动 Bot',
              description: '启动 Bot 实例',
              color: Color(0xFF7DD3A8),
            ),
            const SizedBox(height: 10),
            const _ActionTile(
              icon: LucideIcons.rotateCcw,
              label: '重启 Bot',
              description: '重启 Bot 实例',
              color: Color(0xFFF5C87A),
            ),
            const SizedBox(height: 10),
            _ActionTile(
              icon: LucideIcons.square,
              label: '停止 Bot',
              description: '停止 Bot 实例',
              color: colorScheme.destructive,
            ),
          ],
        ),
      ),
    );
  }
}

class _ActionTile extends StatelessWidget {
  const _ActionTile({
    required this.icon,
    required this.label,
    required this.description,
    required this.color,
  });

  final IconData icon;
  final String label;
  final String description;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: colorScheme.border),
      ),
      child: Row(
        children: [
          _IconBadge(icon: icon, color: color),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: theme.textTheme.p.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  description,
                  style: theme.textTheme.small.copyWith(
                    color: colorScheme.mutedForeground,
                  ),
                ),
              ],
            ),
          ),
          Icon(
            LucideIcons.chevronRight,
            size: 16,
            color: colorScheme.mutedForeground,
          ),
        ],
      ),
    );
  }
}

class _BotInfoCard extends StatelessWidget {
  const _BotInfoCard();

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return ShadCard(
      title: const Text('Bot 信息'),
      description: const Text('基本配置信息'),
      child: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Column(
          children: [
            _InfoRow(label: '名称', value: 'Puniyu Bot', theme: theme),
            const Divider(height: 24),
            _InfoRow(label: '版本', value: 'v1.0.0', theme: theme),
            const Divider(height: 24),
            _InfoRow(label: '端口', value: '8080', theme: theme),
            const Divider(height: 24),
            _InfoRow(label: '数据路径', value: './data', theme: theme),
          ],
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({
    required this.label,
    required this.value,
    required this.theme,
  });

  final String label;
  final String value;
  final ShadThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: theme.textTheme.muted),
          Text(
            value,
            style: theme.textTheme.p.copyWith(
              fontWeight: FontWeight.w500,
              fontFamily: 'monospace',
            ),
          ),
        ],
      ),
    );
  }
}

class _IconBadge extends StatelessWidget {
  const _IconBadge({required this.icon, required this.color});

  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(9),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Icon(icon, size: 16, color: color),
    );
  }
}
