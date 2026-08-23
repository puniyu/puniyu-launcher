import 'package:flutter/widgets.dart';
import 'package:puniyu_launcher/app.dart';
import 'package:puniyu_launcher/window.dart';
import 'package:puniyu_launcher/platform.dart';

Future<void> main() async {
  if (isDesktop()) {
    await WindowManger.initialize();
  }
  runApp(const App());
}
