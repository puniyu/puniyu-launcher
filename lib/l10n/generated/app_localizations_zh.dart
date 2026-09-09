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

  @override
  String get back => '返回';

  @override
  String get details => '详情';

  @override
  String get copy => '复制';

  @override
  String copyDetails(String copy, String details) {
    return '$copy$details';
  }

  @override
  String get copied => '已复制';

  @override
  String get errorTitle => '出现问题';

  @override
  String get errorDescription => '发生了意外问题。你可以复制下方详情以便反馈，或返回上一页面。';

  @override
  String get proxy => '代理';

  @override
  String get proxyMode => '代理模式';

  @override
  String get proxyModeDesc => '选择代理的连接方式';

  @override
  String get proxyOff => '关闭';

  @override
  String get proxySystem => '系统代理';

  @override
  String get proxyCustom => '自定义';

  @override
  String get proxyHost => '主机地址';

  @override
  String get proxyHostDesc => '代理服务器的地址';

  @override
  String get proxyPort => '端口';

  @override
  String get proxyPortDesc => '代理服务器的端口号';

  @override
  String get proxyReadSystem => '检测系统代理';

  @override
  String proxyDetected(String proxy) {
    return '已检测到: $proxy';
  }

  @override
  String get proxyNotDetected => '未检测到系统代理';
}
