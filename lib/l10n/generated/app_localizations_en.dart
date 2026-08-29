// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'puniyu launcher';

  @override
  String get dashboard => 'Dashboard';

  @override
  String get logs => 'Logs';

  @override
  String get setting => 'Setting';

  @override
  String get minimize => 'Minimize';

  @override
  String get maximize => 'Maximize';

  @override
  String get restore => 'Restore';

  @override
  String get close => 'Close';

  @override
  String get appearance => 'Appearance';

  @override
  String get themeColor => 'Theme Color';

  @override
  String get themeColorDesc => 'Choose the color scheme for the app';

  @override
  String get themeMode => 'Theme Mode';

  @override
  String get themeModeDesc => 'Choose the display mode for the app';

  @override
  String get themeModeLight => 'Light';

  @override
  String get themeModeDark => 'Dark';

  @override
  String get themeModeSystem => 'System';

  @override
  String get back => 'Go back';

  @override
  String get details => 'Details';

  @override
  String get copy => 'Copy';

  @override
  String copyDetails(String copy, String details) {
    return '$copy $details';
  }

  @override
  String get copied => 'Copied';

  @override
  String get errorTitle => 'Something went wrong';

  @override
  String get errorDescription =>
      'An unexpected problem occurred. You can copy the details below to report the issue, or go back.';
}
