import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:puniyu_launcher/router.gr.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

@RoutePage()
class NotFoundPage extends StatelessWidget {
  const NotFoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final colors = theme.colorScheme;

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
                  LucideIcons.construction,
                  size: 40,
                  color: colors.mutedForeground,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              '此功能尚在施工中',
              style: theme.textTheme.h3.copyWith(
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
                style: theme.textTheme.muted,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 24),
            ShadButton(
              onPressed: () => AutoRouter.of(context).navigate(const DashboardRoute()),
              leading: const Icon(LucideIcons.layoutDashboard, size: 16),
              child: const Text('返回控制台'),
            ),
          ],
        ),
      ),
    );
  }
}
