import 'package:material_ui/material_ui.dart' hide Theme;
import 'package:forui/forui.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:puniyu_launcher/theme/blue.dart';
import 'package:puniyu_launcher/theme/pink.dart';

part 'theme.g.dart';

abstract class Theme {
  String get id => name;
  String get name;
  FColors get light;
  FColors get dark;

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is Theme && id == other.id;

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() => name;
}

class ThemeManager {
  ThemeManager({
    required List<Theme> themes,
    required this.currentId,
    this.themeMode = ThemeMode.system,
  }) : themes = List.unmodifiable(themes),
       current = themes.firstWhere((theme) => theme.id == currentId);

  final List<Theme> themes;
  final String currentId;
  final ThemeMode themeMode;
  final Theme current;

  late final FThemeData lightTheme = _buildThemeData(current.light);
  late final FThemeData darkTheme = _buildThemeData(current.dark);

  static FThemeData _buildThemeData(FColors colors) {
    final typeface = FTypeface.inherit(
      colors: colors,
      touch: false,
      fontFamily: 'DouyinSans',
    );
    return FThemeData(
      colors: colors,
      touch: false,
      typography: FTypography(display: typeface, body: typeface),
    );
  }
}

@Riverpod(keepAlive: true)
class ThemeController extends _$ThemeController {
  @override
  ThemeManager build() {
    final defaultTheme = Pink();
    final themes = [defaultTheme, Blue()];
    return ThemeManager(themes: themes, currentId: defaultTheme.id);
  }

  bool setTheme(String id) {
    final s = state;
    if (s.currentId == id) return false;
    if (!s.themes.any((t) => t.id == id)) return false;
    state = ThemeManager(
      themes: s.themes,
      currentId: id,
      themeMode: s.themeMode,
    );
    return true;
  }

  bool setThemeMode(ThemeMode mode) {
    final s = state;
    if (s.themeMode == mode) return false;
    state = ThemeManager(
      themes: s.themes,
      currentId: s.currentId,
      themeMode: mode,
    );
    return true;
  }
}
