import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

enum ThemeMode {
  light(
    brightness: Brightness.light,
    background: Color.fromARGB(255, 255, 192, 203),
  ),
  dark(
    brightness: Brightness.dark,
    background: Colors.black,
  );

  final Brightness brightness;
  final Color background;

  const ThemeMode({
    required this.brightness,
    required this.background,
  });

  ShadThemeData get themeData => ShadThemeData(
    colorScheme: ShadSlateColorScheme.light(background: background),
    brightness: brightness,
  );
}

class ThemeManager {
  static final ThemeManager _instance = ThemeManager._();
  factory ThemeManager() => _instance;

  ThemeManager._();

  ThemeMode _mode = ThemeMode.light;

  ThemeMode get mode => _mode;

  ShadThemeData get theme => _mode.themeData;

  ShadThemeData getTheme(ThemeMode mode) => mode.themeData;

  void setTheme(ThemeMode mode) {
    _mode = mode;
  }
}
