import "package:flutter/material.dart";
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:puniyu_launcher/platform.dart';
import 'package:puniyu_launcher/view/widget/nav_bar.dart';
import 'package:puniyu_launcher/view/widget/title_bar.dart';

class Layout extends StatelessWidget {
  const Layout({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return isDesktop() ? _DeskTop(child: child) : _Mobile(child: child);
  }
}

class _DeskTop extends StatelessWidget {
  const _DeskTop({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final colorScheme = ShadTheme.of(context).colorScheme;

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
                  alignment: Alignment.topLeft,
                  child: child,
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
  const _Mobile({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: child),
        const NavBar(),
      ],
    );
  }
}
