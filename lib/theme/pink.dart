import 'package:flutter/material.dart' hide Theme;
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:puniyu_launcher/theme.dart';

class Pink extends Theme {
  // 命名色
  static const _cherryPink = Color.fromRGBO(247, 196, 212, 1);
  static const _peach = Color.fromRGBO(255, 221, 230, 1);
  static const _morningDew = Color.fromRGBO(255, 234, 242, 1);
  static const _plainWhite = Color.fromRGBO(255, 246, 247, 1);

  // 暗色
  static const _deepPlum = Color.fromRGBO(36, 23, 29, 1);
  static const _darkRose = Color.fromRGBO(52, 33, 42, 1);
  static const _dustyRose = Color.fromRGBO(66, 40, 51, 1);
  static const _mauve = Color.fromRGBO(90, 53, 68, 1);
  static const _plum = Color.fromRGBO(87, 52, 66, 1);
  static const _berry = Color.fromRGBO(104, 64, 82, 1);
  static const _deepBerry = Color.fromRGBO(106, 60, 77, 1);

  // 文字色
  static const _darkText = Color.fromRGBO(61, 37, 46, 1);
  static const _mediumText = Color.fromRGBO(77, 45, 57, 1);
  static const _mutedText = Color.fromRGBO(139, 102, 115, 1);
  static const _lightMutedText = Color.fromRGBO(230, 185, 200, 1);

  // 强调色
  static const _roseRed = Color.fromRGBO(217, 74, 106, 1);
  static const _softRed = Color.fromRGBO(232, 121, 146, 1);
  static const _pinkBorder = Color.fromRGBO(233, 182, 200, 1);
  static const _pinkInput = Color.fromRGBO(255, 210, 222, 1);

  @override
  String get id => 'pink';

  @override
  String get name => id;

  @override
  ShadColorScheme get light => const ShadColorScheme(
    background: _plainWhite,
    foreground: _darkText,
    card: Colors.white,
    cardForeground: _darkText,
    popover: Colors.white,
    popoverForeground: _darkText,
    primary: _cherryPink,
    primaryForeground: _darkText,
    secondary: _peach,
    secondaryForeground: _mediumText,
    muted: _morningDew,
    mutedForeground: _mutedText,
    accent: _morningDew,
    accentForeground: _mediumText,
    destructive: _roseRed,
    destructiveForeground: Colors.white,
    border: _pinkBorder,
    input: _pinkInput,
    ring: _cherryPink,
    selection: _peach,
  );

  @override
  ShadColorScheme get dark => const ShadColorScheme(
    background: _deepPlum,
    foreground: _plainWhite,
    card: _darkRose,
    cardForeground: _plainWhite,
    popover: _darkRose,
    popoverForeground: _plainWhite,
    primary: _cherryPink,
    primaryForeground: _darkText,
    secondary: _mauve,
    secondaryForeground: _plainWhite,
    muted: _dustyRose,
    mutedForeground: _lightMutedText,
    accent: _plum,
    accentForeground: _plainWhite,
    destructive: _softRed,
    destructiveForeground: _deepPlum,
    border: _berry,
    input: _dustyRose,
    ring: _peach,
    selection: _deepBerry,
  );
}
