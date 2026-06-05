import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:window_manager/window_manager.dart';

class TitleBar extends StatefulWidget {
  const TitleBar({super.key});

  @override
  State<TitleBar> createState() => _TitleBarState();
}

class _TitleBarState extends State<TitleBar> with WindowListener {
  bool _isMaximized = false;

  @override
  void initState() {
    super.initState();
    windowManager.addListener(this);
    _checkMaximized();
  }

  @override
  void dispose() {
    windowManager.removeListener(this);
    super.dispose();
  }

  @override
  void onWindowMaximize() => setState(() => _isMaximized = true);

  @override
  void onWindowUnmaximize() => setState(() => _isMaximized = false);

  Future<void> _checkMaximized() async {
    final maximized = await windowManager.isMaximized();
    setState(() => _isMaximized = maximized);
  }

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      height: 36,
      decoration: BoxDecoration(
        color: colorScheme.background,
        border: Border(bottom: BorderSide(color: colorScheme.border)),
      ),
      child: Row(
        children: [
          Expanded(
            child: DragToMoveArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  children: [
                    ClipOval(
                      child: Image.asset(
                        'assets/icons/icon.png',
                        width: 20,
                        height: 20,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Puniyu Launcher',
                      style: theme.textTheme.small.copyWith(
                        color: colorScheme.foreground,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          _WindowButton(
            icon: LucideIcons.minus,
            onPressed: () => windowManager.minimize(),
            colorScheme: colorScheme,
          ),
          _WindowButton(
            icon: _isMaximized ? LucideIcons.copy : LucideIcons.maximize2,
            onPressed: () async {
              _isMaximized
                  ? await windowManager.unmaximize()
                  : await windowManager.maximize();
            },
            colorScheme: colorScheme,
          ),
          _WindowButton(
            icon: LucideIcons.x,
            onPressed: () => windowManager.close(),
            colorScheme: colorScheme,
            isClose: true,
          ),
        ],
      ),
    );
  }
}

class _WindowButton extends StatefulWidget {
  const _WindowButton({
    required this.icon,
    required this.onPressed,
    required this.colorScheme,
    this.isClose = false,
  });

  final IconData icon;
  final VoidCallback onPressed;
  final ShadColorScheme colorScheme;
  final bool isClose;

  @override
  State<_WindowButton> createState() => _WindowButtonState();
}

class _WindowButtonState extends State<_WindowButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final bg = _hovered
        ? (widget.isClose
            ? widget.colorScheme.destructive
            : Colors.black.withValues(alpha: 0.05))
        : Colors.transparent;

    final fg = _hovered && widget.isClose
        ? Colors.white
        : widget.colorScheme.foreground.withValues(alpha: 0.7);

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onPressed,
        child: Container(
          width: 46,
          height: 36,
          color: bg,
          child: Icon(widget.icon, size: 14, color: fg),
        ),
      ),
    );
  }
}
