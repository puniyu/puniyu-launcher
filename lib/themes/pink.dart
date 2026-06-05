import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:puniyu_launcher/theme.dart';

class Pink extends Theme {
  @override
  String get id => 'pink';

  @override
  String get name => '粉色';

  @override
  ShadThemeData get themeData => ShadThemeData(
    colorScheme: const ShadSlateColorScheme.light(
      background: Color.fromARGB(255, 255, 245, 247),
      foreground: Color.fromARGB(255, 74, 53, 64),
      card: Color.fromARGB(255, 255, 255, 255),
      cardForeground: Color.fromARGB(255, 74, 53, 64),
      primary: Color.fromARGB(255, 249, 168, 201),
      primaryForeground: Color.fromARGB(255, 255, 255, 255),
      secondary: Color.fromARGB(255, 255, 238, 244),
      secondaryForeground: Color.fromARGB(255, 107, 74, 90),
      accent: Color.fromARGB(255, 255, 228, 237),
      accentForeground: Color.fromARGB(255, 90, 58, 74),
      muted: Color.fromARGB(255, 255, 238, 244),
      mutedForeground: Color.fromARGB(255, 139, 107, 122),
      border: Color.fromARGB(255, 255, 214, 228),
      input: Color.fromARGB(255, 255, 238, 244),
      ring: Color.fromARGB(255, 249, 168, 201),
      destructive: Color.fromARGB(255, 232, 90, 122)
    ),
  );
}
