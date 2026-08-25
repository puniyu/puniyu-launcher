import 'package:flutter/material.dart' hide Theme;
import 'package:shadcn_ui/shadcn_ui.dart';

abstract class Theme {
  String get id;
  String get name;
  ShadColorScheme get light;
  ShadColorScheme get dark;

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is Theme && id == other.id;

  @override
  int get hashCode => id.hashCode;
}


class ThemeManager extends ChangeNotifier {
  ThemeManager({
    required List<Theme> themes,
    Theme? initialTheme,
    ThemeMode initialMode = ThemeMode.system,
  }) : _themes = List.unmodifiable(themes),
       _current = initialTheme ?? themes.first,
       _themeMode = initialMode {
    assert(themes.isNotEmpty, 'themes list must not be empty');
    if (initialTheme != null) {
      assert(themes.contains(initialTheme), 'initialTheme must be in the themes list');
    }
  }

  final List<Theme> _themes;
  Theme _current;
  ThemeMode _themeMode;

  List<Theme> get themes => _themes;
  Theme get current => _current;
  ThemeMode get themeMode => _themeMode;

  ShadColorScheme get lightColorScheme => _current.light;
  ShadColorScheme get darkColorScheme => _current.dark;

  ShadThemeData get lightTheme => ShadThemeData(
    brightness: Brightness.light,
    colorScheme: lightColorScheme,
  );

  ShadThemeData get darkTheme =>
      ShadThemeData(brightness: Brightness.dark, colorScheme: darkColorScheme);

  bool setTheme(Theme theme) {
    if (_current == theme) return false;
    if (!_themes.contains(theme)) return false;
    _current = theme;
    notifyListeners();
    return true;
  }

  bool setThemeMode(ThemeMode mode) {
    if (_themeMode == mode) return false;
    _themeMode = mode;
    notifyListeners();
    return true;
  }
}
