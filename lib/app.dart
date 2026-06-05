import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:puniyu_launcher/view/page/home.dart';
import 'package:puniyu_launcher/theme.dart';
import 'package:puniyu_launcher/themes/pink.dart';
import 'package:puniyu_launcher/themes/dark.dart';
import 'package:puniyu_launcher/router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final themeManager = ThemeManager();
    themeManager
      ..add(Pink.new)
      ..add(Dark.new);

    return AnimatedBuilder(
      animation: themeManager,
      builder: (context, _) {
        final baseTheme = themeManager.theme;
        final themed = baseTheme.copyWith(
          textTheme: ShadTextTheme(family: 'DouyinSans'),
        );

        return ChangeNotifierProvider(
          create: (_) => RouterManager(),
          child: ShadApp(debugShowCheckedModeBanner: false, home: const Home(), theme: themed),
        );
      },
    );
  }
}
