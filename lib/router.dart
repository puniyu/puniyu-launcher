import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:forui/forui.dart';
import 'package:puniyu_app/l10n/generated/app_localizations.dart';
import 'package:puniyu_app/router.gr.dart';

Widget _routeTransition(
  BuildContext context,
  Animation<double> animation,
  Animation<double> secondaryAnimation,
  Widget child,
) {
  final colors = context.theme.colors;
  return ColoredBox(
    color: colors.background,
    child: FadeTransition(
      opacity: CurvedAnimation(parent: animation, curve: Curves.easeOut),
      child: child,
    ),
  );
}

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => RouteType.custom(
    transitionsBuilder: _routeTransition,
    duration: const Duration(milliseconds: 300),
  );

  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      page: LayoutRoute.page,
      initial: true,
      children: [
        AutoRoute(
          page: DashboardRoute.page,
          initial: true,
          title: (context, data) => AppLocalizations.of(context).dashboard,
        ),
        AutoRoute(
          page: SettingRoute.page,
          title: (context, data) => AppLocalizations.of(context).setting,
        ),
      ],
    ),
    AutoRoute(page: ErrorRoute.page),
  ];
}
