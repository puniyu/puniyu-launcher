import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart' hide Theme;
import 'package:flutter/services.dart';
import 'package:forui/forui.dart';
import 'package:puniyu_launcher/l10n/generated/app_localizations.dart';
import 'package:puniyu_launcher/platform.dart';
import 'package:puniyu_launcher/router.gr.dart';

class Error extends StatelessWidget {
  const Error({
    super.key,
    required this.title,
    this.subTitle,
    this.description,
  });

  final String title;
  final String? subTitle;
  final String? description;

  @override
  Widget build(BuildContext context) {
    void callback() {
      AutoRouter.of(context).navigate(const DashboardRoute());
    }

    return isDesktop()
        ? _Desktop(
            title: title,
            subTitle: subTitle,
            description: description,
            onBack: callback,
          )
        : _Mobile(
            title: title,
            subTitle: subTitle,
            description: description,
            onBack: callback,
          );
  }
}

class _Desktop extends StatelessWidget {
  const _Desktop({
    required this.title,
    required this.subTitle,
    required this.description,
    required this.onBack,
  });

  final String title;
  final String? subTitle;
  final String? description;
  final VoidCallback? onBack;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final details = description;
    final back = onBack;

    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 520),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _Header(title: title, subTitle: subTitle),
              if (details case final details? when details.isNotEmpty) ...[
                const SizedBox(height: 16),
                _Card(
                  description: details,
                  trailing: _CopyButton(description: details),
                ),
              ],
              if (back case final back?) ...[
                const SizedBox(height: 16),
                Align(
                  alignment: Alignment.centerLeft,
                  child: FButton(
                    onPress: back,
                    variant: .secondary,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(FLucideIcons.arrowLeft, size: 16),
                        const SizedBox(width: 8),
                        Text(l10n.back),
                      ],
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _Mobile extends StatelessWidget {
  const _Mobile({
    required this.title,
    required this.subTitle,
    required this.description,
    required this.onBack,
  });

  final String title;
  final String? subTitle;
  final String? description;
  final VoidCallback? onBack;

  @override
  Widget build(BuildContext context) {
    final details = description;
    final back = onBack;
    final hasDetails = switch (details) {
      final value? when value.isNotEmpty => true,
      _ => false,
    };
    final hasActions = hasDetails || back != null;

    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 520),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _Header(title: title, subTitle: subTitle),
              if (details case final details? when details.isNotEmpty) ...[
                const SizedBox(height: 16),
                _Card(description: details),
              ],
              if (hasActions) ...[
                const SizedBox(height: 16),
                Row(
                  children: [
                    if (details case final details?
                        when details.isNotEmpty) ...[
                      Expanded(child: _CopyButton(description: details)),
                      if (back != null) const SizedBox(width: 12),
                    ],
                    if (back case final back?)
                      Expanded(child: _BackButton(onPress: back)),
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({required this.title, required this.subTitle});

  final String title;
  final String? subTitle;

  @override
  Widget build(BuildContext context) {
    final colors = context.theme.colors;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
            color: colors.secondary,
            shape: BoxShape.circle,
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Icon(
              FLucideIcons.triangleAlert,
              size: 40,
              color: colors.destructive,
            ),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          title,
          style: context.theme.typography.display.xl.copyWith(
            color: colors.foreground,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
        ),
        if (subTitle case final subTitle? when subTitle.isNotEmpty) ...[
          const SizedBox(height: 8),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 360),
            child: Text(
              subTitle,
              style: context.theme.typography.body.sm.copyWith(
                color: colors.mutedForeground,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ],
    );
  }
}

class _Card extends StatefulWidget {
  const _Card({required this.description, this.trailing});

  final String description;
  final Widget? trailing;

  @override
  State<_Card> createState() => _CardState();
}

class _CardState extends State<_Card> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final colors = context.theme.colors;

    return FCard(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: _Toggle(
                    expanded: _expanded,
                    onTap: () => setState(() => _expanded = !_expanded),
                  ),
                ),
                ?widget.trailing,
              ],
            ),
            if (_expanded) ...[
              const SizedBox(height: 8),
              SelectableText(
                widget.description,
                style: context.theme.typography.body.sm.copyWith(
                  color: colors.mutedForeground,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _Toggle extends StatefulWidget {
  const _Toggle({required this.expanded, required this.onTap});

  final bool expanded;
  final VoidCallback onTap;

  @override
  State<_Toggle> createState() => _ToggleState();
}

class _ToggleState extends State<_Toggle> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final colors = context.theme.colors;
    final l10n = AppLocalizations.of(context);

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: widget.onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Row(
            children: [
              Icon(
                widget.expanded
                    ? FLucideIcons.chevronDown
                    : FLucideIcons.chevronRight,
                size: 16,
                color: _isHovered ? colors.foreground : colors.mutedForeground,
              ),
              const SizedBox(width: 6),
              Text(
                l10n.details,
                style: context.theme.typography.body.sm.copyWith(
                  color: _isHovered
                      ? colors.foreground
                      : colors.foreground.withValues(alpha: 0.8),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CopyButton extends StatefulWidget {
  const _CopyButton({required this.description});

  final String description;

  @override
  State<_CopyButton> createState() => _CopyButtonState();
}

class _CopyButtonState extends State<_CopyButton> {
  bool _copied = false;
  bool _isHovered = false;

  Future<void> _copy() async {
    await Clipboard.setData(ClipboardData(text: widget.description));
    if (!mounted) return;
    setState(() => _copied = true);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final icon = _copied ? FLucideIcons.check : FLucideIcons.copy;
    final label = _copied ? l10n.copied : l10n.copyDetails(l10n.copy, l10n.details);

    if (isDesktop()) {
      final colors = context.theme.colors;

      return FTooltip(
        tipBuilder: (_, _) => Text(label),
        child: Semantics(
          button: true,
          label: label,
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            onEnter: (_) => setState(() => _isHovered = true),
            onExit: (_) => setState(() => _isHovered = false),
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: _copy,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: ColoredBox(
                  color: _isHovered ? colors.secondary : Colors.transparent,
                  child: SizedBox(
                    width: 32,
                    height: 32,
                    child: Icon(
                      icon,
                      size: 16,
                      color: _isHovered
                          ? colors.foreground
                          : colors.mutedForeground,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    }

    return FButton(
      onPress: _copy,
      variant: .outline,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Icon(icon, size: 16), const SizedBox(width: 8), Text(label)],
      ),
    );
  }
}

class _BackButton extends StatelessWidget {
  const _BackButton({required this.onPress});

  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return FButton(
      onPress: onPress,
      variant: .secondary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(FLucideIcons.arrowLeft, size: 16),
          const SizedBox(width: 8),
          Text(l10n.back),
        ],
      ),
    );
  }
}
