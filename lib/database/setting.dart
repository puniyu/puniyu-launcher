import 'package:cindel/cindel.dart';
import 'package:material_ui/material_ui.dart' hide Theme;
import 'package:puniyu_launcher/theme/pink.dart';

part 'setting.g.dart';

@Collection()
class Setting {
  Id dbId = autoIncrement;

  AppearanceSetting appearance = AppearanceSetting();
}

@embedded
class AppearanceSetting {
  String themeId = Pink().name;
  ThemeMode themeMode = ThemeMode.system;
}
