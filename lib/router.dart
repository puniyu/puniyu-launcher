import 'package:flutter/foundation.dart';

sealed class Route {
  const Route();

  String get name;
  String get path => '/${name}';
}

final class DashboardRoute extends Route {
  const DashboardRoute();

  @override
  String get name => 'dashboard';
}

final class LogsRoute extends Route {
  const LogsRoute();

  @override
  String get name => 'logs';
}

final class SettingsRoute extends Route {
  const SettingsRoute();

  @override
  String get name => 'settings';
}

class RouterManager extends ChangeNotifier {
  static const List<Route> routes = [
    DashboardRoute(),
    LogsRoute(),
    SettingsRoute(),
  ];

  Route _current = routes.first;

  Route get current => _current;

  void navigateTo(Route route) {
    if (_current == route) return;
    _current = route;
    notifyListeners();
  }
}
