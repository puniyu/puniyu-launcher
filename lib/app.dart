import 'package:material_ui/material_ui.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:puniyu_launcher/view/widget/layout.dart';
import 'package:puniyu_launcher/view/widget/nav_bar.dart';
import 'package:puniyu_launcher/view/widget/title_bar.dart';
import 'package:puniyu_launcher/theme.dart';
import 'package:puniyu_launcher/themes/pink.dart';
import 'package:puniyu_launcher/router.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late final ThemeManager _themeManager;

  @override
  void initState() {
    super.initState();
    _themeManager = ThemeManager()..register(Pink());
  }

  @override
  void dispose() {
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

        return MultiProvider(
          providers: [
            ChangeNotifierProvider.value(value: _themeManager),
            ChangeNotifierProvider(create: (_) => RouterManager()),
          ],
          child: ShadApp(
            debugShowCheckedModeBanner: false,
            home: Builder(
              builder: (context) {
                final colors = ShadTheme.of(context).colorScheme;
                return Scaffold(
                  backgroundColor: colors.background,
                  body: Layout(
                    titleBar: const TitleBar(),
                    navBar: const NavBar(),
                    body: const Center(child: Text('Hello World')),
                  ),
                );
              },
            ),
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: _themeManager.themeMode,
          ),
        );
      },
    );
  }
}
