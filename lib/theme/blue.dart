import 'package:flutter/material.dart' hide Theme;
import 'package:flutter/services.dart';
import 'package:forui/forui.dart';
import 'package:puniyu_app/theme.dart';

class Blue extends Theme {
  @override
  String get name => "blue";

  @override
  FColors get light => FColors(
    brightness: Brightness.light,
    systemOverlayStyle: SystemUiOverlayStyle.dark,
    barrier: Colors.black26,
    background: const Color.fromRGBO(236, 251, 255, 1),
    foreground: const Color.fromRGBO(37, 50, 63, 1),
    card: Colors.white,
    primary: const Color.fromRGBO(69, 189, 248, 1),
    primaryForeground: Colors.white,
    secondary: const Color.fromRGBO(121, 215, 251, 1),
    secondaryForeground: const Color.fromRGBO(47, 62, 78, 1),
    muted: const Color.fromRGBO(173, 231, 255, 1),
    mutedForeground: const Color.fromRGBO(102, 127, 153, 1),
    destructive: const Color.fromRGBO(239, 68, 68, 1),
    destructiveForeground: Colors.white,
    error: const Color.fromRGBO(239, 68, 68, 1),
    errorForeground: Colors.white,
    border: const Color.fromRGBO(182, 213, 240, 1),
  );

  @override
  FColors get dark => FColors(
    brightness: Brightness.dark,
    systemOverlayStyle: SystemUiOverlayStyle.light,
    barrier: Colors.black54,
    background: const Color.fromRGBO(18, 27, 35, 1),
    foreground: const Color.fromRGBO(236, 251, 255, 1),
    card: const Color.fromRGBO(28, 40, 52, 1),
    primary: const Color.fromRGBO(69, 189, 248, 1),
    primaryForeground: Colors.white,
    secondary: const Color.fromRGBO(52, 72, 92, 1),
    secondaryForeground: const Color.fromRGBO(236, 251, 255, 1),
    muted: const Color.fromRGBO(38, 54, 70, 1),
    mutedForeground: const Color.fromRGBO(185, 210, 230, 1),
    destructive: const Color.fromRGBO(248, 113, 113, 1),
    destructiveForeground: const Color.fromRGBO(18, 27, 35, 1),
    error: const Color.fromRGBO(248, 113, 113, 1),
    errorForeground: const Color.fromRGBO(18, 27, 35, 1),
    border: const Color.fromRGBO(64, 86, 108, 1),
  );
}
