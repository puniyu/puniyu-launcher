import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('zh'),
  ];

  /// 应用名称
  ///
  /// In zh, this message translates to:
  /// **'汐奈启动器'**
  String get appName;

  /// 控制台页面名称
  ///
  /// In zh, this message translates to:
  /// **'控制台'**
  String get dashboard;

  /// 日志页面名称
  ///
  /// In zh, this message translates to:
  /// **'日志'**
  String get logs;

  /// 设置页面名称
  ///
  /// In zh, this message translates to:
  /// **'设置'**
  String get setting;

  /// 窗口最小化操作
  ///
  /// In zh, this message translates to:
  /// **'最小化'**
  String get minimize;

  /// 窗口最大化操作
  ///
  /// In zh, this message translates to:
  /// **'最大化'**
  String get maximize;

  /// 窗口还原操作
  ///
  /// In zh, this message translates to:
  /// **'还原'**
  String get restore;

  /// 窗口关闭操作
  ///
  /// In zh, this message translates to:
  /// **'关闭'**
  String get close;

  /// 外观设置页面标题
  ///
  /// In zh, this message translates to:
  /// **'外观'**
  String get appearance;

  /// 主题颜色设置项标题
  ///
  /// In zh, this message translates to:
  /// **'主题颜色'**
  String get themeColor;

  /// 主题颜色设置项描述
  ///
  /// In zh, this message translates to:
  /// **'选择应用的主题配色方案'**
  String get themeColorDesc;

  /// 主题模式设置项标题
  ///
  /// In zh, this message translates to:
  /// **'主题模式'**
  String get themeMode;

  /// 主题模式设置项描述
  ///
  /// In zh, this message translates to:
  /// **'选择应用的显示模式'**
  String get themeModeDesc;

  /// 亮色模式
  ///
  /// In zh, this message translates to:
  /// **'亮色'**
  String get themeModeLight;

  /// 暗色模式
  ///
  /// In zh, this message translates to:
  /// **'暗色'**
  String get themeModeDark;

  /// 跟随系统主题模式
  ///
  /// In zh, this message translates to:
  /// **'跟随系统'**
  String get themeModeSystem;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'zh'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
