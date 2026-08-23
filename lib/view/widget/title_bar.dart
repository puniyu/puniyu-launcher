import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:window_manager/window_manager.dart';

enum _WindowAction { minimize, maximize, restore, close }

class TitleBar extends StatefulWidget {
  const TitleBar({super.key, this.title = 'Puniyu Launcher'});

  final String title;

  @override
  State<TitleBar> createState() => _TitleBarState();
}

class _TitleBarState extends State<TitleBar> {
  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final colors = theme.colorScheme;

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
                          style: theme.textTheme.small.copyWith(
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
    final colors = ShadTheme.of(context).colorScheme;
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
    _WindowAction.minimize => LucideIcons.minus,
    _WindowAction.maximize => LucideIcons.maximize2,
    _WindowAction.restore => LucideIcons.copy,
    _WindowAction.close => LucideIcons.x,
  };

  String get _label => switch (widget.action) {
    _WindowAction.minimize => '最小化',
    _WindowAction.maximize => '最大化',
    _WindowAction.restore => '还原',
    _WindowAction.close => '关闭',
  };

  @override
  Widget build(BuildContext context) {
    final foreground = ShadTheme.of(
      context,
    ).colorScheme.foreground.withValues(alpha: 0.72);

    return Semantics(
      button: true,
      label: _label,
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
    );
  }
}
