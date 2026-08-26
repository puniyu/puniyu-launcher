import 'package:flutter/widgets.dart';
import 'package:window_manager/window_manager.dart';

class WindowManger {
  static const Size _size = Size(1024, 768);
  static const _minimumSize = Size(800, 600);

  static Future<void> initialize() async {
    await windowManager.ensureInitialized();
    WindowOptions windowOptions = WindowOptions(
      size: _size,
      minimumSize: _minimumSize,
      center: true,
      backgroundColor: const Color(0x00000000),
      skipTaskbar: false,
      titleBarStyle: TitleBarStyle.hidden,
    );
    windowManager.waitUntilReadyToShow(windowOptions, () async {
      await windowManager.show();
      await windowManager.focus();
    });
  }
}
