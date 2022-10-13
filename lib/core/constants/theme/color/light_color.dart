import 'package:flutter/material.dart';

import 'IColorTheme.dart';
import 'app_colors.dart';

class LightColor implements IColorTheme {
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
  Color? appbarTertiary;

  @override
  Color? appbarPrimary;

  @override
  Color? appbarSecondary;

  @override
  Color? dividerColor;

  @override
  Color? disableTextColor;

  @override
  Color? disableButtonColor;

  @override
  final AppColors colors = AppColors();

  LightColor() {
    primaryScaffoldBackground = colors.lightPurple;
    secondaryScaffoldBackground = colors.satinLinen;
    primaryColor = colors.lima;
    textColor = colors.outerSpace;
    buttonColor = colors.lima;
    inputBorder = colors.fiord;
    brightness = Brightness.light;
    cardColor = colors.white;
    contentBorderColor = colors.mystic;
    shadowColor = colors.lynch;
    selectedRowColor = colors.glacier;
    successColor = colors.lima;
    warningColor = colors.sunGlow;
    dividerColor = colors.lynch;
    infoColor = colors.azureRadiance;
    errorColor = colors.carnation;
    disableTextColor = colors.gullGray;
    disableButtonColor = colors.towerGray;
    appbarPrimary = colors.oliveDrab;
    appbarSecondary = colors.asparagus;
    appbarTertiary = colors.olivine;
    enableBorderColor = colors.gullGray;
    colorScheme = const ColorScheme.light().copyWith(onSurface: colors.lima, primary: colors.lima);
  }

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
