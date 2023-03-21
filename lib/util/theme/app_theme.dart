import 'package:swypex/res/const_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  ThemeData get themeDataLight {
    return ThemeData(
        primarySwatch: ConstColors.primarySwatch,
        scaffoldBackgroundColor: ConstColors.scaffoldBackground);
  }
}
