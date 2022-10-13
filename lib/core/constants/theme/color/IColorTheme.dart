import 'package:flutter/material.dart';

import 'app_colors.dart';

abstract class IColorTheme {
  AppColors get colors;
  Color? primaryScaffoldBackground;
  Color? secondaryScaffoldBackground;
  Color? primaryColor;
  Color? textColor;
  Color? darkTextColor;
  Color? outlinedTextColor;
  Color? buttonColor;
  Color? cardColor;
  Color? enableBorderColor;
  Color? dividerColor;
  Color? menuItemGradientStart;
  Color? menuItemGradientEnd;
  Color? bottomNavigationBackground;

  /// can be use for card, container etc.
  Color? contentBorderColor;
  Color? shadowColor;
  Color? inputBorder;

  /// common colors
  Color? successColor;
  Color? warningColor;
  Color? errorColor;
  Color? infoColor;

  Color? selectedRowColor;
  Color? disableTextColor;
  Color? disableButtonColor;

  /// Appbar colors
  Color? appbarPrimary;
  Color? appbarSecondary;
  Color? appbarTertiary;

  Brightness? brightness;
  ColorScheme? colorScheme;
}
