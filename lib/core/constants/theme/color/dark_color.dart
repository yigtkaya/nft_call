import 'package:flutter/material.dart';

import 'IColorTheme.dart';
import 'app_colors.dart';

class DarkColor implements IColorTheme {
  @override
  late final Brightness? brightness;

  @override
  late final ColorScheme? colorScheme;

  @override
  Color? primaryScaffoldBackground;

  @override
  Color? secondaryScaffoldBackground;

  @override
  Color? primaryColor;

  @override
  Color? textColor;

  @override
  Color? buttonColor;

  @override
  Color? inputBorder;

  @override
  Color? cardColor;

  @override
  Color? contentBorderColor;

  @override
  Color? shadowColor;

  @override
  Color? selectedRowColor;

  @override
  Color? errorColor;

  @override
  Color? infoColor;

  @override
  Color? successColor;

  @override
  Color? warningColor;

  @override
  Color? disableTextColor;

  @override
  Color? disableButtonColor;

  @override
  final AppColors colors = AppColors();

  DarkColor() {
    colorScheme = const ColorScheme.dark().copyWith(onPrimary: colors.azureRadiance, onSurface: colors.outerSpace);
    successColor = colors.sunGlow;
    warningColor = colors.lima;
    infoColor = colors.carnation;
    errorColor = colors.azureRadiance;
    textColor = colors.white;
    primaryColor = colors.azureRadiance;
    buttonColor = colors.sunGlow;
    outlinedTextColor = colors.azureRadiance;
    contentBorderColor = colors.white;
    menuItemGradientStart = colors.abbey;
    menuItemGradientEnd = colors.paleSlate;
    bottomNavigationBackground = colors.darkPurple;
    disableButtonColor = colors.fiord;
    secondaryScaffoldBackground = colors.black;
    darkTextColor = colors.outerSpace;
  }

  @override
  Color? dividerColor;

  @override
  Color? appbarPrimary;

  @override
  Color? appbarSecondary;

  @override
  Color? appbarTertiary;

  @override
  Color? enableBorderColor;

  @override
  Color? outlinedTextColor;

  @override
  Color? menuItemGradientEnd;

  @override
  Color? menuItemGradientStart;

  @override
  Color? bottomNavigationBackground;

  @override
  Color? darkTextColor;
}
