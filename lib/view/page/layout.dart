import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:puniyu_launcher/platform.dart';
import 'package:puniyu_launcher/view/widget/nav_bar.dart';
import 'package:puniyu_launcher/view/widget/title_bar.dart';

@RoutePage()
class LayoutPage extends StatelessWidget {
  const LayoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    const titleBar = TitleBar();
    const navBar = NavBar();

    if (isDesktop()) {
      return _Desktop(titleBar: titleBar, navBar: navBar);
    }

    return _Mobile(titleBar: const SizedBox.shrink(), navBar: navBar);
  }
}

class _Desktop extends StatelessWidget {
  const _Desktop({required this.titleBar, required this.navBar});

  final Widget titleBar;
  final Widget navBar;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        titleBar,
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              navBar,
              const Expanded(child: AutoRouter()),
            ],
          ),
        ),
      ],
    );
  }
}

class _Mobile extends StatelessWidget {
  const _Mobile({required this.titleBar, required this.navBar});

  final Widget titleBar;
  final Widget navBar;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        titleBar,
        const Expanded(child: AutoRouter()),
        navBar,
      ],
    );
  }
}
