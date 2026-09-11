import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sys_proxy/flutter_sys_proxy.dart';
import 'package:puniyu_launcher/app.dart';
import 'package:puniyu_launcher/platform.dart';
import 'package:puniyu_launcher/proxy.dart';
import 'package:puniyu_launcher/window.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final proxy = await getSystemProxy();
  if (proxy != null &&
      proxy.enabled &&
      proxy.host != null &&
      proxy.host!.isNotEmpty &&
      proxy.port != null &&
      proxy.port! > 0) {
    HttpOverrides.global = ProxyHttpOverrides(proxy);
  }

  if (isDesktop()) {
    await WindowManger.initialize();
  }

  runApp(const ProviderScope(child: App()));
}
