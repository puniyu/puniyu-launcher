import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:puniyu_launcher/theme.dart';
import 'package:puniyu_launcher/theme/pink.dart';
import 'package:puniyu_launcher/router.dart';
import 'package:puniyu_launcher/l10n/generated/app_localizations.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late final ThemeManager _themeManager;
  late final AppRouter _router;

  @override
  void initState() {
    super.initState();
    _themeManager = ThemeManager(themes: [Pink()], initialTheme: Pink());
    _router = AppRouter();
  }

  @override
  void dispose() {
    _router.dispose();
    _themeManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _themeManager,
      builder: (context, _) {
        final lightTheme = _themeManager.lightTheme.copyWith(
          textTheme: ShadTextTheme(family: 'DouyinSans'),
        );
        final darkTheme = _themeManager.darkTheme.copyWith(
          textTheme: ShadTextTheme(family: 'DouyinSans'),
        );

        return ChangeNotifierProvider.value(
          value: _themeManager,
          child: ShadApp.router(
            debugShowCheckedModeBanner: false,
            routerConfig: _router.config(),
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: _themeManager.themeMode,
            localizationsDelegates: [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: AppLocalizations.supportedLocales,
          ),
        );
      },
    );
  }
}
