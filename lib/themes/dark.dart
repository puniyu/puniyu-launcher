import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:puniyu_launcher/theme.dart';

class Dark extends Theme {
  @override
  String get id => 'dark';

  @override
  String get name => '暗黑';

  @override
  ShadThemeData get themeData => ShadThemeData(
    colorScheme: const ShadSlateColorScheme.dark(),
  );
}
