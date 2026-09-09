import 'dart:io';

import 'package:flutter_sys_proxy/flutter_sys_proxy.dart';

class ProxyHttpOverrides extends HttpOverrides {
  ProxyHttpOverrides(this._proxy);

  final SystemProxy _proxy;

  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..findProxy = (uri) => 'PROXY ${_proxy.host}:${_proxy.port}';
  }
}
