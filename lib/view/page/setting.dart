import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:puniyu_launcher/view/page/setting/appearance.dart';
import 'package:puniyu_launcher/view/page/setting/proxy.dart';

@RoutePage()
class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: 24,
        children: [AppearanceSetting(), ProxySetting()],
      ),
    );
  }
}
