import 'package:flutter/material.dart' show runApp, WidgetsFlutterBinding;
import 'package:puniyu_launcher/app.dart';
import 'package:puniyu_launcher/windows.dart';
import 'package:puniyu_launcher/platform.dart';

void main() async {
  if (isDesktop()) {
    WidgetsFlutterBinding.ensureInitialized();
    await WindowsManger.init();
  }
  runApp(const App());
}
