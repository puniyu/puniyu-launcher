import 'package:flutter/material.dart' hide Theme;
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:puniyu_launcher/theme.dart';

class Pink extends Theme {
  static const _cherryPink = Color(0xFFF7C4D4);
  static const _peach = Color(0xFFFFDDE6);
  static const _morningDew = Color(0xFFFFEAF2);
  static const _plainWhite = Color(0xFFFFF6F7);

  @override
  String get id => 'pink';

  @override
  String get name => '粉色';

  @override
  ShadColorScheme get light => const ShadColorScheme(
    background: _plainWhite,
    foreground: Color(0xFF3D252E),
    card: Colors.white,
    cardForeground: Color(0xFF3D252E),
    popover: Colors.white,
    popoverForeground: Color(0xFF3D252E),
    primary: _cherryPink,
    primaryForeground: Color(0xFF3D252E),
    secondary: _peach,
    secondaryForeground: Color(0xFF4D2D39),
    muted: _morningDew,
    mutedForeground: Color(0xFF8B6673),
    accent: _morningDew,
    accentForeground: Color(0xFF4D2D39),
    destructive: Color(0xFFD94A6A),
    destructiveForeground: Colors.white,
    border: Color(0xFFE9B6C8),
    input: Color(0xFFFFD2DE),
    ring: _cherryPink,
    selection: _peach,
  );

  @override
  ShadColorScheme get dark => const ShadColorScheme(
    background: Color(0xFF24171D),
    foreground: _plainWhite,
    card: Color(0xFF34212A),
    cardForeground: _plainWhite,
    popover: Color(0xFF34212A),
    popoverForeground: _plainWhite,
    primary: _cherryPink,
    primaryForeground: Color(0xFF3D252E),
    secondary: Color(0xFF5A3544),
    secondaryForeground: _plainWhite,
    muted: Color(0xFF422833),
    mutedForeground: Color(0xFFE6B9C8),
    accent: Color(0xFF573442),
    accentForeground: _plainWhite,
    destructive: Color(0xFFE87992),
    destructiveForeground: Color(0xFF24171D),
    border: Color(0xFF684052),
    input: Color(0xFF422833),
    ring: _peach,
    selection: Color(0xFF6A3C4D),
  );
}
