import 'package:flutter/material.dart' hide Theme;
import 'package:flutter/services.dart';
import 'package:forui/forui.dart';
import 'package:puniyu_app/theme.dart';

class Pink extends Theme {
  @override
  String get name => "pink";

  @override
  FColors get light => FColors(
    brightness: Brightness.light,
    systemOverlayStyle: SystemUiOverlayStyle.dark,
    barrier: Colors.black26,
    background: const Color.fromRGBO(255, 246, 247, 1),
    foreground: const Color.fromRGBO(71, 48, 58, 1),
    card: Colors.white,
    primary: const Color.fromRGBO(247, 196, 212, 1),
    primaryForeground: const Color.fromRGBO(71, 48, 58, 1),
    secondary: const Color.fromRGBO(255, 221, 230, 1),
    secondaryForeground: const Color.fromRGBO(96, 68, 79, 1),
    muted: const Color.fromRGBO(255, 234, 242, 1),
    mutedForeground: const Color.fromRGBO(145, 116, 128, 1),
    destructive: const Color.fromRGBO(190, 60, 91, 1),
    destructiveForeground: Colors.white,
    error: const Color.fromRGBO(190, 60, 91, 1),
    errorForeground: Colors.white,
    border: const Color.fromRGBO(244, 207, 220, 1),
  );

  @override
  FColors get dark => FColors(
    brightness: Brightness.dark,
    systemOverlayStyle: SystemUiOverlayStyle.light,
    barrier: Colors.black54,
    background: const Color.fromRGBO(27, 18, 24, 1),
    foreground: const Color.fromRGBO(255, 246, 247, 1),
    card: const Color.fromRGBO(42, 27, 36, 1),
    primary: const Color.fromRGBO(229, 142, 172, 1),
    primaryForeground: const Color.fromRGBO(27, 18, 24, 1),
    secondary: const Color.fromRGBO(59, 37, 49, 1),
    secondaryForeground: const Color.fromRGBO(255, 246, 247, 1),
    muted: const Color.fromRGBO(78, 48, 64, 1),
    mutedForeground: const Color.fromRGBO(230, 185, 200, 1),
    destructive: const Color.fromRGBO(232, 121, 146, 1),
    destructiveForeground: const Color.fromRGBO(27, 18, 24, 1),
    error: const Color.fromRGBO(232, 121, 146, 1),
    errorForeground: const Color.fromRGBO(27, 18, 24, 1),
    border: const Color.fromRGBO(112, 68, 89, 1),
  );
}
