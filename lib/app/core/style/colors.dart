import 'package:flutter/material.dart';

import 'i_colors.dart';

class ColorsPetHero implements IColors {
  factory ColorsPetHero() => _instance;
  ColorsPetHero._();

  static final ColorsPetHero _instance = ColorsPetHero._();

  @override
  final MaterialColor black = const MaterialColor(
    0xFF272727,
    <int, Color>{
      50: Color(0xFFfbfbfb),
      100: Color(0xFFf6f6f6),
      200: Color(0xFFf1f1f1),
      300: Color(0xFFe7e7e7),
      400: Color(0xFFc4c4c4),
      500: Color(0xFFa6a6a6),
      600: Color(0xFF7c7c7c),
      700: Color(0xFF686868),
      800: Color(0xFF494949),
      900: Color(_blackPrimaryValue),
    },
  );
  static const int _blackPrimaryValue = 0xFF272727;

  @override
  final Color white = const Color(0xFFFAFAFA);

  @override
  final Color grey = const Color(0xFF959595);

  @override
  final MaterialColor green =
      const MaterialColor(_greenPrimaryValue, <int, Color>{
    50: Color(0xFFe0f7f9),
    100: Color(0xFFb2eaef),
    200: Color(0xFF80dde6),
    300: Color(0xFF4fcedc),
    400: Color(0xFF2bc4d4),
    500: Color(0xFF10bace),
    600: Color(_greenPrimaryValue),
    700: Color(0xFF0f95a1),
    800: Color(0xFF0e818a),
    900: Color(0xFF0b5e60),
  });
  static const int _greenPrimaryValue = 0xFF0faabb;

  @override
  final Color red = const Color(0xFFD32020);

  final Color lightOrange = const Color(0xFFFFCAA4);
  final Color brown = const Color(0xFF985B00);
  final Color darkBrown = const Color(0xFF7C4E09);
}
