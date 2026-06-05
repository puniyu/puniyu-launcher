import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:puniyu_launcher/platform.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return isDesktop() ? const _DeskTop() : const _Mobile();
  }
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



class _DeskTop extends StatelessWidget {
  const _DeskTop();

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final colorScheme = theme.colorScheme;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _Header(),
          const SizedBox(height: 24),
          // Status cards - 4 in a row
          Row(
            children: [
              Expanded(child: _StatusCard(icon: LucideIcons.clock, label: '运行时间', value: '2h 34m', colorScheme: colorScheme, theme: theme)),
              const SizedBox(width: 16),
              Expanded(child: _StatusCard(icon: LucideIcons.cpu, label: 'CPU 使用', value: '12%', colorScheme: colorScheme, theme: theme)),
              const SizedBox(width: 16),
              Expanded(child: _StatusCard(icon: LucideIcons.hardDrive, label: '内存使用', value: '128 MB', colorScheme: colorScheme, theme: theme)),
              const SizedBox(width: 16),
              Expanded(child: _StatusCard(icon: LucideIcons.messageCircle, label: '消息处理', value: '1,234', colorScheme: colorScheme, theme: theme)),
            ],
          ),
          const SizedBox(height: 24),
          // Action cards - side by side
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: _QuickActions(colorScheme: colorScheme, theme: theme),
              ),
              const SizedBox(width: 16),
              Expanded(child: _BotInfo(theme: theme)),
            ],
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

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _Header(),
          const SizedBox(height: 16),
          // Status cards - 2x2 grid
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 1.4,
            children: [
              _StatusCard(icon: LucideIcons.clock, label: '运行时间', value: '2h 34m', colorScheme: colorScheme, theme: theme),
              _StatusCard(icon: LucideIcons.cpu, label: 'CPU 使用', value: '12%', colorScheme: colorScheme, theme: theme),
              _StatusCard(icon: LucideIcons.hardDrive, label: '内存使用', value: '128 MB', colorScheme: colorScheme, theme: theme),
              _StatusCard(icon: LucideIcons.messageCircle, label: '消息处理', value: '1,234', colorScheme: colorScheme, theme: theme),
            ],
          ),
          const SizedBox(height: 16),
          // Action cards - stacked
          _QuickActions(colorScheme: colorScheme, theme: theme),
          const SizedBox(height: 16),
          _BotInfo(theme: theme),
        ],
      ),
    );
  }
}


class _StatusCard extends StatelessWidget {
  const _StatusCard({
    required this.icon,
    required this.label,
    required this.value,
    required this.colorScheme,
    required this.theme,
  });

  final IconData icon;
  final String label;
  final String value;
  final ShadColorScheme colorScheme;
  final ShadThemeData theme;

  @override
  Widget build(BuildContext context) {
    return ShadCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: colorScheme.primary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, size: 16, color: colorScheme.primary),
              ),
              const SizedBox(width: 12),
              Text(label, style: theme.textTheme.muted),
            ],
          ),
          const SizedBox(height: 12),
          Text(value, style: theme.textTheme.h3),
        ],
      ),
    );
  }
}

class _QuickActions extends StatelessWidget {
  const _QuickActions({required this.colorScheme, required this.theme});

  final ShadColorScheme colorScheme;
  final ShadThemeData theme;

  @override
  Widget build(BuildContext context) {
    return ShadCard(
      title: const Text('快捷操作'),
      description: const Text('管理 Bot 的运行状态'),
      child: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Column(
          children: [
            _ActionTile(icon: LucideIcons.play, label: '启动 Bot', description: '启动 Bot 实例', color: const Color(0xFF7DD3A8), colorScheme: colorScheme, theme: theme),
            const SizedBox(height: 8),
            _ActionTile(icon: LucideIcons.rotateCcw, label: '重启 Bot', description: '重启 Bot 实例', color: const Color(0xFFF5C87A), colorScheme: colorScheme, theme: theme),
            const SizedBox(height: 8),
            _ActionTile(icon: LucideIcons.square, label: '停止 Bot', description: '停止 Bot 实例', color: colorScheme.destructive, colorScheme: colorScheme, theme: theme),
          ],
        ),
      ),
    );
  }
}

class _BotInfo extends StatelessWidget {
  const _BotInfo({required this.theme});

  final ShadThemeData theme;

  @override
  Widget build(BuildContext context) {
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

class _ActionTile extends StatelessWidget {
  const _ActionTile({
    required this.icon,
    required this.label,
    required this.description,
    required this.color,
    required this.colorScheme,
    required this.theme,
  });

  final IconData icon;
  final String label;
  final String description;
  final Color color;
  final ShadColorScheme colorScheme;
  final ShadThemeData theme;

  @override
  Widget build(BuildContext context) {
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
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, size: 16, color: color),
              ),
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
