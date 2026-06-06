import 'package:flutter/widgets.dart';
import 'package:window_manager/window_manager.dart';

class WindowsManger {
  static Future<void> init() async {
    await windowManager.ensureInitialized();

    const windowOptions = WindowOptions(
      size: Size(1024, 680),
      minimumSize: Size(800, 600),
      center: true,
      titleBarStyle: TitleBarStyle.hidden
    );

    windowManager.waitUntilReadyToShow(windowOptions, () async {
      await windowManager.show();
      await windowManager.focus();
    });
  }
}
