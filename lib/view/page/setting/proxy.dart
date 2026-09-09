import 'package:detect_proxy_setting/detect_proxy_setting.dart' as detect;
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forui/forui.dart';
import 'package:puniyu_launcher/l10n/generated/app_localizations.dart';
import 'package:puniyu_launcher/proxy.dart';
import 'package:puniyu_launcher/view/widget/setting.dart';

class ProxySetting extends ConsumerStatefulWidget {
  const ProxySetting({super.key});

  @override
  ConsumerState<ProxySetting> createState() => _ProxySettingViewState();
}

class _ProxySettingViewState extends ConsumerState<ProxySetting> {
  Future<detect.ProxySetting?>? _systemProxyFuture;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final proxy = ref.watch(proxyProvider);
    final controller = ref.read(proxyProvider.notifier);
    final modeItems = [
      _ProxyModeItem(
        icon: FLucideIcons.x,
        label: l10n.proxyOff,
        isSelected: proxy.mode == ProxyMode.off,
        onTap: () => controller.setMode(ProxyMode.off),
      ),
      _ProxyModeItem(
        icon: FLucideIcons.monitor,
        label: l10n.proxySystem,
        isSelected: proxy.mode == ProxyMode.system,
        onTap: () => controller.setMode(ProxyMode.system),
      ),
      _ProxyModeItem(
        icon: FLucideIcons.settings,
        label: l10n.proxyCustom,
        isSelected: proxy.mode == ProxyMode.custom,
        onTap: () => controller.setMode(ProxyMode.custom),
      ),
    ];

    return SettingGroup(
      title: l10n.proxy,
      items: [
        SettingItem(
          title: l10n.proxyMode,
          subTitle: l10n.proxyModeDesc,
          content: LayoutBuilder(
            builder: (context, constraints) {
              final cols = constraints.maxWidth > 400 ? modeItems.length : 2;
              final w = (constraints.maxWidth - 8 * (cols - 1)) / cols;
              return Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  for (final (i, item) in modeItems.indexed)
                    SizedBox(
                      width:
                          cols == 2 &&
                              modeItems.length.isOdd &&
                              i == modeItems.length - 1
                          ? constraints.maxWidth
                          : w,
                      child: item,
                    ),
                ],
              );
            },
          ),
        ),
        if (proxy.mode == ProxyMode.system) ...[
          SettingItem(
            title: l10n.proxyReadSystem,
            subTitle: '',
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              spacing: 8,
              children: [
                FButton(
                  onPress: () {
                    setState(() {
                      _systemProxyFuture = controller.readSystemProxy();
                    });
                  },
                  variant: FButtonVariant.outline,
                  child: Text(l10n.proxyReadSystem),
                ),
                if (_systemProxyFuture != null)
                  FutureBuilder<detect.ProxySetting?>(
                    future: _systemProxyFuture,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const FCircularProgress();
                      }
                      if (snapshot.hasError) {
                        return Text(
                          snapshot.error.toString(),
                          style: context.theme.typography.body.sm.copyWith(
                            color: context.theme.colors.destructive,
                          ),
                        );
                      }
                      final data = snapshot.data;
                      if (data == null ||
                          data.mode == detect.ProxySettingModeEnum.direct) {
                        return Text(
                          l10n.proxyNotDetected,
                          style: context.theme.typography.body.sm.copyWith(
                            color: context.theme.colors.mutedForeground,
                          ),
                        );
                      }
                      return Text(
                        l10n.proxyDetected(data.proxy),
                        style: context.theme.typography.body.sm.copyWith(
                          color: context.theme.colors.primary,
                        ),
                      );
                    },
                  ),
              ],
            ),
          ),
        ],
        if (proxy.mode == ProxyMode.custom) ...[
          SettingItem(
            title: l10n.proxyHost,
            subTitle: l10n.proxyHostDesc,
            content: FTextField(
              hint: '127.0.0.1',
              control: FTextFieldControl.managed(
                initial: TextEditingValue(text: proxy.host ?? ''),
                onChange: (v) => controller.setHost(v.text),
              ),
            ),
          ),
          SettingItem(
            title: l10n.proxyPort,
            subTitle: l10n.proxyPortDesc,
            content: FTextField(
              hint: '7890',
              keyboardType: TextInputType.number,
              control: FTextFieldControl.managed(
                initial: TextEditingValue(text: proxy.port?.toString() ?? ''),
                onChange: (v) => controller.setPort(int.tryParse(v.text)),
              ),
            ),
          ),
        ],
      ],
    );
  }
}

class _ProxyModeItem extends StatelessWidget {
  const _ProxyModeItem({
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return FButton(
      onPress: onTap,
      selected: isSelected,
      semanticsLabel: label,
      variant: isSelected ? FButtonVariant.primary : FButtonVariant.outline,
      size: FButtonSizeVariant.lg,
      prefix: Icon(icon, size: 16),
      child: Text(label, maxLines: 1, overflow: TextOverflow.ellipsis),
    );
  }
}
