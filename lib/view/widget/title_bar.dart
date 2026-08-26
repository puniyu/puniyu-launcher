import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart' hide Theme;
import 'package:forui/forui.dart';
import 'package:window_manager/window_manager.dart';
import 'package:puniyu_launcher/l10n/generated/app_localizations.dart';
import 'package:puniyu_launcher/platform.dart';

enum _WindowAction { minimize, maximize, restore, close }

class TitleBar extends StatelessWidget {
  const TitleBar({super.key});

  @override
  Widget build(BuildContext context) {
    final title = isDesktop()
        ? AppLocalizations.of(context).appName
        : context.topRoute.title(context);
    return isDesktop() ? _DeskTop(title: title) : _Mobile(title: title);
  }
}

class _DeskTop extends StatefulWidget {
  const _DeskTop({required this.title});

  final String title;

  @override
  State<_DeskTop> createState() => _DeskTopState();
}

class _DeskTopState extends State<_DeskTop> {
  @override
  Widget build(BuildContext context) {
    final colors = context.theme.colors;

    return SizedBox(
      width: double.infinity,
      height: 36,
      child: ColoredBox(
        color: colors.background,
        child: Row(
          children: [
            Expanded(
              child: DragToMoveArea(
                child: Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: Image.asset(
                          'assets/icons/icon.png',
                          width: 18,
                          height: 18,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Flexible(
                        child: Text(
                          widget.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: context.theme.typography.body.sm.copyWith(
                            color: colors.foreground,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            _Window(),
          ],
        ),
      ),
    );
  }
}

class _Window extends StatefulWidget {
  const _Window();

  @override
  State<_Window> createState() => _WindowState();
}

class _WindowState extends State<_Window> with WindowListener {
  _WindowAction _action = _WindowAction.maximize;

  @override
  void initState() {
    super.initState();
    windowManager.addListener(this);
  }

  @override
  void dispose() {
    windowManager.removeListener(this);
    super.dispose();
  }

  @override
  void onWindowMaximize() => setState(() => _action = _WindowAction.restore);

  @override
  void onWindowUnmaximize() => setState(() => _action = _WindowAction.maximize);

  @override
  Widget build(BuildContext context) {
    final colors = context.theme.colors;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _WindowButton(
          action: _WindowAction.minimize,
          hoverBackground: colors.secondary,
          hoverForeground: colors.foreground.withValues(alpha: 0.72),
          onAction: () => windowManager.minimize(),
        ),
        _WindowButton(
          action: _action,
          hoverBackground: colors.secondary,
          hoverForeground: colors.foreground.withValues(alpha: 0.72),
          onAction: () => _action == _WindowAction.restore
              ? windowManager.unmaximize()
              : windowManager.maximize(),
        ),
        _WindowButton(
          action: _WindowAction.close,
          hoverBackground: colors.destructive,
          hoverForeground: colors.destructiveForeground,
          onAction: () => windowManager.close(),
        ),
      ],
    );
  }
}

class _WindowButton extends StatefulWidget {
  const _WindowButton({
    required this.action,
    required this.hoverBackground,
    required this.hoverForeground,
    required this.onAction,
  });

  final _WindowAction action;
  final Color hoverBackground;
  final Color hoverForeground;
  final VoidCallback onAction;

  @override
  State<_WindowButton> createState() => _WindowButtonState();
}

class _WindowButtonState extends State<_WindowButton> {
  bool _isHovered = false;

  IconData get _icon => switch (widget.action) {
    _WindowAction.minimize => FLucideIcons.minus,
    _WindowAction.maximize => FLucideIcons.maximize2,
    _WindowAction.restore => FLucideIcons.copy,
    _WindowAction.close => FLucideIcons.x,
  };

  String _label(BuildContext context) => switch (widget.action) {
    _WindowAction.minimize => AppLocalizations.of(context).minimize,
    _WindowAction.maximize => AppLocalizations.of(context).maximize,
    _WindowAction.restore => AppLocalizations.of(context).restore,
    _WindowAction.close => AppLocalizations.of(context).close,
  };

  @override
  Widget build(BuildContext context) {
    final foreground = context.theme.colors.foreground.withValues(alpha: 0.72);

    return FTooltip(
      tipBuilder: (_, _) => Text(_label(context)),
      child: Semantics(
        button: true,
        label: _label(context),
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          onEnter: (_) => setState(() => _isHovered = true),
          onExit: (_) => setState(() => _isHovered = false),
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: widget.onAction,
            child: SizedBox(
              width: 46,
              height: 36,
              child: ColoredBox(
                color: _isHovered ? widget.hoverBackground : Colors.transparent,
                child: Icon(
                  _icon,
                  size: 15,
                  color: _isHovered ? widget.hoverForeground : foreground,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Mobile extends StatelessWidget {
  const _Mobile({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final colors = context.theme.colors;

    return ColoredBox(
      color: colors.background,
      child: SafeArea(
        bottom: false,
        child: SizedBox(
          height: 48,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: context.theme.typography.display.lg.copyWith(
                  color: colors.foreground,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
