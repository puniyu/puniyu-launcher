import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

abstract class Theme {
  String get id;
  String get name;
  Color get color => themeData.colorScheme.background;
  ShadThemeData get themeData;
}

class ThemeManager extends ChangeNotifier {
  final List<Theme> _themes = [];
  Theme? _current;

  List<Theme> get themes => List.unmodifiable(_themes);
  Theme get current => _current ?? _themes.first;
  ShadThemeData get theme => current.themeData;

  ThemeManager add(Theme Function() create) {
    _themes.add(create());
    _current ??= _themes.last;
    return this;
  }

  void setTheme(Theme theme) {
    if (_current?.id == theme.id) return;
    _current = theme;
    notifyListeners();
  }
}
