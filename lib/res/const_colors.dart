import 'dart:math';

import 'package:flutter/material.dart';

class ConstColors {
  static final MaterialColor primarySwatch = generateMaterialColors(_app);

  static const _app = Color(0xff151D3B);

  static const _appBlack = Colors.black;
  static const _appWhite = Colors.white;
  static const _appGrey = Colors.grey;

  static const _appMercury = Color(0xffE5E5E5);
  static const appTitle = Color(0xff8a8bb3);

  static const toastBackground = _appBlack;
  static const scaffoldBackgroundSpindle = _appMercury;
  static const toastText = _appWhite;
  static const feedBackCard = _appMercury;
  static const toggleColor = _appMercury;

  static const bannerBackground = _appBlack;
  static const bannerText = _appWhite;
  static const bannerIcon = _appWhite;

  static const divider = _appGrey;
  static const scaffoldBackground = _appWhite;
  static const movieCardBackground = _app;

  static const statusBar = _app;
}

MaterialColor generateMaterialColors(Color color) {
  return MaterialColor(color.value, {
    50: tintColor(color, 0.9),
    100: tintColor(color, 0.8),
    200: tintColor(color, 0.6),
    300: tintColor(color, 0.4),
    400: tintColor(color, 0.2),
    500: color,
    600: shadeColor(color, 0.1),
    700: shadeColor(color, 0.2),
    800: shadeColor(color, 0.3),
    900: shadeColor(color, 0.4),
  });
}

int tintValue(int value, double factor) =>
    max(0, min((value + ((255 - value) * factor)).round(), 255));

Color tintColor(Color color, double factor) => Color.fromRGBO(
    tintValue(color.red, factor),
    tintValue(color.green, factor),
    tintValue(color.blue, factor),
    1);

int shadeValue(int value, double factor) =>
    max(0, min(value - (value * factor).round(), 255));

Color shadeColor(Color color, double factor) => Color.fromRGBO(
    shadeValue(color.red, factor),
    shadeValue(color.green, factor),
    shadeValue(color.blue, factor),
    1);

/**
    Hexadecimal opacity values
    100% — FF
    95% — F2
    90% — E6
    85% — D9
    80% — CC
    75% — BF
    70% — B3
    65% — A6
    60% — 99
    55% — 8C
    50% — 80
    45% — 73
    40% — 66
    35% — 59
    30% — 4D
    25% — 40
    20% — 33
    15% — 26
    10% — 1A
    5% — 0D
    0% — 00
 */
