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
        final layout = _DashboardLayout(constraints.maxWidth);
        final items = _statusItems
            .map((e) => _StatusCard(icon: e.icon, label: e.label, value: e.value, cardWidth: layout.cardWidth))
            .toList();

        return SingleChildScrollView(
          padding: EdgeInsets.all(layout.padding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const _Header(),
              SizedBox(height: layout.spacing),
              Wrap(spacing: 16, runSpacing: 16, children: items),
              const SizedBox(height: 24),
              layout.isWide
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Expanded(flex: 2, child: _ActionCard()),
                        const SizedBox(width: 16),
                        const Expanded(child: _BotInfoCard()),
                      ],
                    )
                  : const Column(
                      children: [
                        _ActionCard(),
                        SizedBox(height: 16),
                        _BotInfoCard(),
                      ],
                    ),
            ],
          ),
        );
      },
    );
  }
}

class _DashboardLayout {
  _DashboardLayout(this.width)
      : padding = width > 600 ? 24.0 : 16.0,
        spacing = width > 600 ? 24.0 : 16.0,
        isWide = width > 1100 {
    const minWidth = 220.0;
    const gap = 16.0;
    final available = width - padding * 2;
    final columns = ((available + gap) / (minWidth + gap)).floor().clamp(2, 6);
    cardWidth = (available - gap * (columns - 1)) / columns;
  }

  final double width;
  final double padding;
  final double spacing;
  final bool isWide;
  late final double cardWidth;
}

// ───────────────────── Header ─────────────────────

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
              const SizedBox(height: 4),
              Text('管理你的 Bot 实例', style: theme.textTheme.muted),
            ],
          ),
        ),
        ShadBadge(
          backgroundColor: colorScheme.primary.withValues(alpha: 0.15),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 6,
                height: 6,
                decoration: BoxDecoration(
                  color: const Color(0xFF7DD3A8),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF7DD3A8).withValues(alpha: 0.4),
                      blurRadius: 4,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 6),
              Text('运行中', style: TextStyle(color: colorScheme.primary)),
            ],
          ),
        ),
      ],
    );
  }
}

// ───────────────────── Status Card ─────────────────────

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
            const SizedBox(height: 12),
            Text(value, style: theme.textTheme.h3),
          ],
        ),
      ),
    );
  }
}

// ───────────────────── Action Card ─────────────────────

class _ActionCard extends StatelessWidget {
  const _ActionCard();

  @override
  Widget build(BuildContext context) {
    return ShadCard(
      title: const Text('快捷操作'),
      description: const Text('管理 Bot 的运行状态'),
      child: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Column(
          children: [
            _ActionTile(icon: LucideIcons.play, label: '启动 Bot', description: '启动 Bot 实例', color: const Color(0xFF7DD3A8)),
            const SizedBox(height: 8),
            _ActionTile(icon: LucideIcons.rotateCcw, label: '重启 Bot', description: '重启 Bot 实例', color: const Color(0xFFF5C87A)),
            const SizedBox(height: 8),
            _ActionTile(icon: LucideIcons.square, label: '停止 Bot', description: '停止 Bot 实例', color: ShadTheme.of(context).colorScheme.destructive),
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

    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(12),
        hoverColor: colorScheme.accent,
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: colorScheme.border),
          ),
          child: Row(
            children: [
              _IconBadge(icon: icon, color: color),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(label, style: theme.textTheme.p.copyWith(fontWeight: FontWeight.w500)),
                    Text(description, style: theme.textTheme.small.copyWith(color: colorScheme.mutedForeground)),
                  ],
                ),
              ),
              Icon(LucideIcons.chevronRight, size: 16, color: colorScheme.mutedForeground),
            ],
          ),
        ),
      ),
    );
  }
}

// ───────────────────── Bot Info Card ─────────────────────

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
            const SizedBox(height: 12),
            _InfoRow(label: '版本', value: 'v1.0.0', theme: theme),
            const SizedBox(height: 12),
            _InfoRow(label: '端口', value: '8080', theme: theme),
            const SizedBox(height: 12),
            _InfoRow(label: '数据路径', value: './data', theme: theme),
          ],
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({required this.label, required this.value, required this.theme});

  final String label;
  final String value;
  final ShadThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: theme.textTheme.muted),
        Text(value, style: theme.textTheme.p.copyWith(fontWeight: FontWeight.w500)),
      ],
    );
  }
}

// ───────────────────── Shared Widget ─────────────────────

class _IconBadge extends StatelessWidget {
  const _IconBadge({required this.icon, required this.color});

  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(icon, size: 16, color: color),
    );
  }
}
