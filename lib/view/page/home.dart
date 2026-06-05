import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:puniyu_launcher/platform.dart';
import 'package:puniyu_launcher/view/widget/nav_bar.dart';
import 'package:puniyu_launcher/view/widget/title_bar.dart';
import 'package:puniyu_launcher/view/page/dashboard.dart';
import 'package:puniyu_launcher/view/page/not_found.dart';
import 'package:puniyu_launcher/router.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: isDesktop() ? const _DeskTop() : const _Mobile());
  }
}

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

class _DeskTop extends StatelessWidget {
  const _DeskTop();

  @override
  Widget build(BuildContext context) {
    final colorScheme = ShadTheme.of(context).colorScheme;
    final currentRoute = context.watch<RouterManager>().current;

    return Column(
      children: [
        const TitleBar(),
        Expanded(
          child: Row(
            children: [
              const NavBar(),
              Expanded(
                child: Container(
                  color: colorScheme.background,
                  child: _buildPage(currentRoute),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _Mobile extends StatelessWidget {
  const _Mobile();

  @override
  Widget build(BuildContext context) {
    final currentRoute = context.watch<RouterManager>().current;

    return Column(
      children: [
        Expanded(child: _buildPage(currentRoute)),
        const NavBar(),
      ],
    );
  }
}
