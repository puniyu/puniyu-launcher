import 'package:flutter/material.dart';
import 'package:puniyu_launcher/platform.dart';

class Layout extends StatelessWidget {
  const Layout({required this.body, super.key, this.titleBar, this.navBar});

  final Widget body;
  final Widget? titleBar;
  final Widget? navBar;

  @override
  Widget build(BuildContext context) {
    if (isDesktop()) {
      return _DeskTop(titleBar: titleBar, navBar: navBar, body: body);
    }

    return _Mobile(titleBar: null, navBar: navBar, body: body);
  }
}

class _DeskTop extends StatelessWidget {
  const _DeskTop({required this.body, this.titleBar, this.navBar});

  final Widget body;
  final Widget? titleBar;
  final Widget? navBar;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        titleBar ?? const SizedBox.shrink(),
        Expanded(
          child: Row(
            children: [
              navBar ?? const SizedBox.shrink(),
              Expanded(child: body),
            ],
          ),
        ),
      ],
    );
  }
}

class _Mobile extends StatelessWidget {
  const _Mobile({required this.body, this.titleBar, this.navBar});

  final Widget body;
  final Widget? titleBar;
  final Widget? navBar;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        titleBar ?? const SizedBox.shrink(),
        Expanded(child: body),
        navBar ?? const SizedBox.shrink(),
      ],
    );
  }
}
