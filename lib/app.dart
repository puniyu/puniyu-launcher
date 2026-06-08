import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:puniyu_launcher/view/widget/layout.dart';
import 'package:puniyu_launcher/view/page/dashboard.dart';
import 'package:puniyu_launcher/view/page/not_found.dart';
import 'package:puniyu_launcher/theme.dart';
import 'package:puniyu_launcher/themes/pink.dart';
import 'package:puniyu_launcher/themes/dark.dart';
import 'package:puniyu_launcher/router.dart';

Widget _buildPage(AppRoute route) {
  switch (route) {
    case AppRoute.dashboard:
      return const Dashboard();
    case AppRoute.logs:
      return const NotFoundPage(title: '日志');
    case AppRoute.settings:
      return const NotFoundPage(title: '设置');
  }
}

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
          child: ShadApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              body: Layout(
                child: Builder(
                  builder: (context) => _buildPage(context.watch<RouterManager>().current),
                ),
              ),
            ),
            theme: themed,
          ),
        );
      },
    );
  }
}
