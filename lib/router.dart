import 'package:flutter/widgets.dart';

enum AppRoute {
  dashboard,
  logs,
  settings,
}

class RouterManager extends ChangeNotifier {
  AppRoute _current = AppRoute.dashboard;

  AppRoute get current => _current;

  void navigateTo(AppRoute route) {
    if (_current == route) return;
    _current = route;
    notifyListeners();
  }
}
