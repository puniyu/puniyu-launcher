import 'package:material_ui/material_ui.dart';
import 'package:window_manager/window_manager.dart';

class WindowManger {
  static const Size _size = Size(1024, 768);
  static const _minimumSize = Size(800, 600);

  static Future<void> initialize() async {
    WidgetsFlutterBinding.ensureInitialized();
    await windowManager.ensureInitialized();
    WindowOptions windowOptions = WindowOptions(
      size: _size,
      minimumSize: _minimumSize,
      center: true,
      backgroundColor: Colors.transparent,
      skipTaskbar: false,
      titleBarStyle: TitleBarStyle.hidden,
    );
    windowManager.waitUntilReadyToShow(windowOptions, () async {
      await windowManager.show();
      await windowManager.focus();
    });
  }
}
