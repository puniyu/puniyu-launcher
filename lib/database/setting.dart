import 'package:cindel/cindel.dart';
import 'package:material_ui/material_ui.dart' hide Theme;
import 'package:puniyu_launcher/proxy.dart';
import 'package:puniyu_launcher/theme/pink.dart';

part 'setting.g.dart';

@Collection()
class Setting {
  Id dbId = autoIncrement;

  AppearanceSetting appearance = AppearanceSetting();
  ProxySetting proxy = ProxySetting();
}

@embedded
class AppearanceSetting {
  String themeId = Pink().name;
  ThemeMode themeMode = ThemeMode.system;
}


@embedded
class ProxySetting {
  ProxyMode mode = ProxyMode.off;
  String? host;
  int? port;
}
