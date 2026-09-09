// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/widgets.dart' as _i7;
import 'package:puniyu_launcher/view/page/dashboard.dart' as _i1;
import 'package:puniyu_launcher/view/page/error.dart' as _i2;
import 'package:puniyu_launcher/view/page/layout.dart' as _i3;
import 'package:puniyu_launcher/view/page/not_found.dart' as _i4;
import 'package:puniyu_launcher/view/page/setting.dart' as _i5;

/// generated route for
/// [_i1.DashboardPage]
class DashboardRoute extends _i6.PageRouteInfo<void> {
  const DashboardRoute({List<_i6.PageRouteInfo>? children})
    : super(DashboardRoute.name, initialChildren: children);

  static const String name = 'DashboardRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i1.DashboardPage();
    },
  );
}

/// generated route for
/// [_i2.ErrorPage]
class ErrorRoute extends _i6.PageRouteInfo<ErrorRouteArgs> {
  ErrorRoute({
    _i7.Key? key,
    required String description,
    List<_i6.PageRouteInfo>? children,
  }) : super(
         ErrorRoute.name,
         args: ErrorRouteArgs(key: key, description: description),
         initialChildren: children,
       );

  static const String name = 'ErrorRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ErrorRouteArgs>();
      return _i2.ErrorPage(key: args.key, description: args.description);
    },
  );
}

class ErrorRouteArgs {
  const ErrorRouteArgs({this.key, required this.description});

  final _i7.Key? key;

  final String description;

  @override
  String toString() {
    return 'ErrorRouteArgs{key: $key, description: $description}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ErrorRouteArgs) return false;
    return key == other.key && description == other.description;
  }

  @override
  int get hashCode => key.hashCode ^ description.hashCode;
}

/// generated route for
/// [_i3.LayoutPage]
class LayoutRoute extends _i6.PageRouteInfo<void> {
  const LayoutRoute({List<_i6.PageRouteInfo>? children})
    : super(LayoutRoute.name, initialChildren: children);

  static const String name = 'LayoutRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i3.LayoutPage();
    },
  );
}

/// generated route for
/// [_i4.NotFoundPage]
class NotFoundRoute extends _i6.PageRouteInfo<void> {
  const NotFoundRoute({List<_i6.PageRouteInfo>? children})
    : super(NotFoundRoute.name, initialChildren: children);

  static const String name = 'NotFoundRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i4.NotFoundPage();
    },
  );
}

/// generated route for
/// [_i5.SettingPage]
class SettingRoute extends _i6.PageRouteInfo<void> {
  const SettingRoute({List<_i6.PageRouteInfo>? children})
    : super(SettingRoute.name, initialChildren: children);

  static const String name = 'SettingRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i5.SettingPage();
    },
  );
}
