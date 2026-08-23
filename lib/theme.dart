import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

abstract class Theme {
  String get id;
  String get name;
  ShadColorScheme get light;
  ShadColorScheme get dark;
}

class ThemeManager extends ChangeNotifier {
  ThemeManager();

  final List<Theme> _themes = [];
  late Theme _current;
  ThemeMode _themeMode = ThemeMode.system;

  List<Theme> get themes => List.unmodifiable(_themes);
  Theme get current => _current;
  ThemeMode get themeMode => _themeMode;

  ShadColorScheme get lightColorScheme => current.light;
  ShadColorScheme get darkColorScheme => current.dark;

  ShadThemeData get lightTheme => ShadThemeData(
    brightness: Brightness.light,
    colorScheme: lightColorScheme,
  );

  ShadThemeData get darkTheme =>
      ShadThemeData(brightness: Brightness.dark, colorScheme: darkColorScheme);

  void register(Theme theme) {
    _themes.add(theme);
    if (_themes.length == 1) {
      _current = theme;
    }
    notifyListeners();
  }

  bool setTheme(String id) {
    final index = _themes.indexWhere((theme) => theme.id == id);
    if (index == -1 || _current.id == id) return false;

    _current = _themes[index];
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
