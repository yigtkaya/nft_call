import 'package:flutter/material.dart';
import 'package:nft_call/core/constants/theme/text/ITextTheme.dart';
import 'package:nft_call/core/constants/theme/text/dark_text.dart';
import 'package:nft_call/core/constants/theme/text/light_text.dart';

import 'color/IColorTheme.dart';
import 'color/dark_color.dart';
import 'color/light_color.dart';


abstract class IAppTheme {
  ITextTheme get textTheme;

  IColorTheme get colorTheme;
}

class LightAppTheme extends IAppTheme {
  @override
  IColorTheme get colorTheme => LightColor();

  @override
  ITextTheme get textTheme => LightText();
}

class DarkAppTheme extends IAppTheme {
  @override
  IColorTheme get colorTheme => DarkColor();

  @override
  ITextTheme get textTheme => DarkText();
}

abstract class AppThemeBuilder {
  static ThemeData createTheme(IAppTheme theme) {
    return ThemeData(
        scaffoldBackgroundColor: theme.colorTheme.primaryScaffoldBackground,
        backgroundColor: theme.colorTheme.secondaryScaffoldBackground,
        primaryColor: theme.colorTheme.primaryColor,
        selectedRowColor: theme.colorTheme.selectedRowColor,
        errorColor: theme.colorTheme.errorColor,
        indicatorColor: theme.colorTheme.warningColor,
        listTileTheme: const ListTileThemeData(contentPadding: EdgeInsets.zero),
        splashColor: theme.colorTheme.successColor,
        unselectedWidgetColor: theme.colorTheme.infoColor,
        disabledColor: theme.colorTheme.disableTextColor,
        canvasColor: Colors.transparent,
        cardTheme: CardTheme(
            color: theme.colorTheme.cardColor,
            shadowColor: theme.colorTheme.shadowColor,
            elevation: 2,
            shape: RoundedRectangleBorder(
                side: BorderSide(color: theme.colorTheme.contentBorderColor ?? Colors.green, width: 0.5),
                borderRadius: BorderRadius.circular(8.0))),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              onPrimary: theme.colorTheme.primaryColor,
              primary: theme.colorTheme.buttonColor,
              textStyle: theme.textTheme.longButtonText,
              onSurface: theme.colorTheme.disableButtonColor,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(textStyle: theme.textTheme.textButtonText, primary: theme.colorTheme.primaryColor),
        ),
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: theme.textTheme.inputHintText,
          hintStyle: theme.textTheme.inputHintText,
          contentPadding: const EdgeInsets.all(18.0),
          fillColor: Colors.black,
          filled: true,
        ),
        textTheme: TextTheme(
          headlineLarge: theme.textTheme.headlineLarge,
          headlineMedium: theme.textTheme.headlineMedium,
          headlineSmall: theme.textTheme.headlineSmall,
          bodySmall: theme.textTheme.bodySmall,
          bodyMedium: theme.textTheme.bodyMedium,
          bodyLarge: theme.textTheme.bodyLarge,
          titleSmall: theme.textTheme.titleSmall,
          titleMedium: theme.textTheme.titleMedium,
          titleLarge: theme.textTheme.titleLarge,
          labelSmall: theme.textTheme.labelSmall,
          labelMedium: theme.textTheme.labelMedium,
          labelLarge: theme.textTheme.labelLarge,
          displaySmall: theme.textTheme.inputHintText,
        ).apply(displayColor: theme.colorTheme.textColor),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: theme.colorTheme.secondaryScaffoldBackground,
        ),
        checkboxTheme: CheckboxThemeData(
          fillColor: MaterialStateProperty.all(theme.colorTheme.primaryColor),
        ),
        toggleButtonsTheme: ToggleButtonsThemeData(
          fillColor: theme.colorTheme.secondaryScaffoldBackground,
          color: theme.colorTheme.primaryColor,
          selectedColor: theme.colorTheme.primaryColor,
          borderColor: theme.colorTheme.primaryColor,
          selectedBorderColor: theme.colorTheme.primaryColor,
          disabledColor: theme.colorTheme.secondaryScaffoldBackground,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: theme.colorTheme.appbarPrimary,
          foregroundColor: theme.colorTheme.appbarSecondary,
          surfaceTintColor: theme.colorTheme.appbarTertiary,
        ),
        dividerColor: theme.colorTheme.dividerColor,
        colorScheme: theme.colorTheme.colorScheme,
        tabBarTheme: TabBarTheme(
          indicator: const BoxDecoration(),
          labelColor: theme.colorTheme.primaryColor,
          unselectedLabelColor: theme.colorTheme.primaryColor,
        ));
  }
}
