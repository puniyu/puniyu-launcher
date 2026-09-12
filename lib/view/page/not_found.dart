import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:forui/forui.dart';
import 'package:puniyu_app/router.gr.dart';

@RoutePage()
class NotFoundPage extends StatelessWidget {
  const NotFoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.theme.colors;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DecoratedBox(
              decoration: BoxDecoration(
                color: colors.secondary,
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Icon(
                  FLucideIcons.construction,
                  size: 40,
                  color: colors.mutedForeground,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              '此功能尚在施工中',
              style: context.theme.typography.display.xl.copyWith(
                color: colors.foreground,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 360),
              child: Text(
                '该功能目前正在紧锣密鼓地开发中，暂时还无法使用，请耐心等待后续版本更新。',
                style: context.theme.typography.body.sm.copyWith(
                  color: colors.mutedForeground,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 24),
            FButton(
              onPress: () =>
                  AutoRouter.of(context).navigate(const DashboardRoute()),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(FLucideIcons.layoutDashboard, size: 16),
                  const SizedBox(width: 8),
                  const Text('返回控制台'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
