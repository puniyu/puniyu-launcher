import 'dart:async';

import 'package:cindel/cindel.dart';
import 'package:detect_proxy_setting/detect_proxy_setting.dart' as detect;
import 'package:puniyu_launcher/database.dart';
import 'package:puniyu_launcher/database/setting.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'proxy.g.dart';

enum ProxyMode { off, system, custom }


@Riverpod(keepAlive: true)
class Proxy extends _$Proxy {
  Timer? _debounce;

  @override
  ProxySetting build() {
    _load();
    ref.onDispose(() => _debounce?.cancel());
    return ProxySetting();
  }

  Future<CindelDatabase> _getDb() => ref.read(dataBaseProvider.future);

  Future<void> _load() async {
    final db = await _getDb();
    final s = await db.setting.all().findFirst();
    if (s == null) return;
    state = s.proxy;
  }

  void setMode(ProxyMode mode) {
    if (state.mode == mode) return;
    state = ProxySetting()
      ..mode = mode
      ..host = state.host
      ..port = state.port;
    _persistNow();
  }

  void setHost(String host) {
    state = ProxySetting()
      ..mode = state.mode
      ..host = host
      ..port = state.port;
    _persistDebounced();
  }

  void setPort(int? port) {
    state = ProxySetting()
      ..mode = state.mode
      ..host = state.host
      ..port = port;
    _persistDebounced();
  }

  Future<detect.ProxySetting?> readSystemProxy() => detect.proxySetting();

  void _persistNow() {
    _debounce?.cancel();
    _persist();
  }

  void _persistDebounced() {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), _persist);
  }

  Future<void> _persist() async {
    final db = await _getDb();
    final s =
        await db.setting.all().findFirst() ??
        (Setting()..appearance = AppearanceSetting());
    s.proxy = state;
    await db.setting.put(s);
  }
}
