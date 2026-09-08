import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:puniyu_launcher/app.dart';
import 'package:puniyu_launcher/platform.dart';
import 'package:puniyu_launcher/window.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (isDesktop()) {
    await WindowManger.initialize();
  }

  runApp(const ProviderScope(child: App()));
}
