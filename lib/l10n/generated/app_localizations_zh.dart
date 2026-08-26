// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get appName => '汐奈启动器';

  @override
  String get dashboard => '控制台';

  @override
  String get logs => '日志';

  @override
  String get setting => '设置';

  @override
  String get minimize => '最小化';

  @override
  String get maximize => '最大化';

  @override
  String get restore => '还原';

  @override
  String get close => '关闭';

  @override
  String get appearance => '外观';

  @override
  String get themeColor => '主题颜色';

  @override
  String get themeColorDesc => '选择应用的主题配色方案';

  @override
  String get themeMode => '主题模式';

  @override
  String get themeModeDesc => '选择应用的显示模式';

  @override
  String get themeModeLight => '亮色';

  @override
  String get themeModeDark => '暗色';

  @override
  String get themeModeSystem => '跟随系统';
}
