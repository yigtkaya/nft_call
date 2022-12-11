import 'dart:math';
import 'package:flutter/material.dart';
import 'package:nft_call/core/constants/theme/theme_manager.dart';

extension ColorExtention on BuildContext {
  ThemeData get theme => Theme.of(this);

  Color get primaryScaffold => theme.scaffoldBackgroundColor;
  Color get secondaryScaffold => theme.backgroundColor;
  Color get primaryColor => theme.primaryColor;
  Color get selectedRowColor => theme.selectedRowColor;
  Color get disableTextColor => theme.disabledColor;
  Color get disableButtonColor => ThemeManager.instance?.getCurrentTheme.colorTheme.disableButtonColor ?? theme.primaryColor;
  Color get buttonColor => ThemeManager.instance?.getCurrentTheme.colorTheme.buttonColor ?? theme.primaryColor;
  Color get textColor => ThemeManager.instance?.getCurrentTheme.colorTheme.textColor ?? theme.primaryColor;
  Color get darkTextColor => ThemeManager.instance?.getCurrentTheme.colorTheme.darkTextColor ?? theme.primaryColor;
  Color get contentBorderColor => ThemeManager.instance?.getCurrentTheme.colorTheme.contentBorderColor ?? theme.primaryColor;
  Color get infoColor => ThemeManager.instance?.getCurrentTheme.colorTheme.infoColor ?? theme.primaryColor;
  Color get softTextColor => ThemeManager.instance?.getCurrentTheme.colorTheme.dividerColor ?? theme.primaryColor;
  Color get dividerColor => ThemeManager.instance?.getCurrentTheme.colorTheme.dividerColor ?? theme.primaryColor;
  Color get bottomNavigationBackground =>
      ThemeManager.instance?.getCurrentTheme.colorTheme.bottomNavigationBackground ?? theme.primaryColor;

  /// Only must be used for Appbar
  Color get appBarPrimary => theme.appBarTheme.backgroundColor ?? theme.primaryColor;
  Color get appBarSecondary => theme.appBarTheme.foregroundColor ?? theme.primaryColor;
  Color get appBarTertiary => theme.appBarTheme.surfaceTintColor ?? theme.primaryColor;

  /// Common Colors
  Color get commonErrorColor => theme.errorColor;
  Color get commonInfoColor => ThemeManager.instance?.getCurrentTheme.colorTheme.infoColor ?? theme.primaryColor;
  Color get commonWarningColor => ThemeManager.instance?.getCurrentTheme.colorTheme.warningColor ?? theme.primaryColor;
  Color get commonSuccessColor => ThemeManager.instance?.getCurrentTheme.colorTheme.successColor ?? theme.primaryColor;
}

extension TextExtention on BuildContext {
  TextTheme get textTheme => theme.textTheme;

  TextStyle? get bold20 => textTheme.headlineLarge;
  TextStyle? get bold16 => textTheme.headlineMedium;
  TextStyle? get bold14 => textTheme.headlineSmall;

  TextStyle? get regular20 => textTheme.bodyLarge;
  TextStyle? get regular16 => textTheme.bodyMedium;
  TextStyle? get regular14 => textTheme.bodySmall;
  TextStyle? get regular12 => textTheme.bodySmall?.copyWith(fontSize: 12);
  TextStyle? get regular10 => textTheme.bodySmall?.copyWith(fontSize: 10);
  TextStyle? get regular8 => textTheme.bodySmall?.copyWith(fontSize: 8);

  TextStyle? get medium20 => textTheme.titleLarge;
  TextStyle? get medium16 => textTheme.titleMedium;
  TextStyle? get medium14 => textTheme.titleSmall;
  TextStyle? get medium12 => textTheme.titleMedium?.copyWith(fontSize: 12);

  TextStyle? get semiBold0 => textTheme.labelLarge;
  TextStyle? get semiBold20 => textTheme.labelLarge;
  TextStyle? get semiBold16 => textTheme.labelMedium;
  TextStyle? get semiBold14 => textTheme.labelSmall;
}

extension DurationExtension on BuildContext {
  Duration get durationVeryLow => const Duration(milliseconds: 150);
  Duration get durationLow => const Duration(milliseconds: 500);
  Duration get durationNormal => const Duration(seconds: 1);
  Duration get durationHigh => const Duration(seconds: 2);
}

extension RandomExtension on BuildContext {
  MaterialColor get randomColor => Colors.primaries[Random().nextInt(17)];
  int get randomNumber => Random().nextInt(100);
}

extension MediaQueryValues on BuildContext {
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;
  double get statusBarHeight => MediaQuery.of(this).viewPadding.top;
}

