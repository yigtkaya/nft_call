import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'ITextTheme.dart';

class DarkText implements ITextTheme {
  @override
  TextStyle? longButtonText;

  @override
  TextStyle? shortButtonText;

  @override
  TextStyle? textButtonText;

  @override
  TextStyle? inputHintText;

  @override
  TextStyle? bodyLarge;

  @override
  TextStyle? bodyMedium;

  @override
  TextStyle? bodySmall;

  @override
  TextStyle? headline1;

  @override
  TextStyle? headline2;

  @override
  TextStyle? headline3;

  @override
  TextStyle? headline4;

  @override
  TextStyle? headline5;

  @override
  TextStyle? labelLarge;

  @override
  TextStyle? labelMedium;

  @override
  TextStyle? labelSmall;

  @override
  TextStyle? subtitle1;

  @override
  TextStyle? subtitle2;

  @override
  TextStyle? titleLarge;

  @override
  TextStyle? titleMedium;

  @override
  TextStyle? titleSmall;

  DarkText() {
    _initTextTheme();
  }

  void _initTextTheme() {
    headlineLarge = GoogleFonts.poppins(fontSize: 20.0, fontWeight: FontWeight.bold, letterSpacing: 0);
    headlineMedium = GoogleFonts.poppins(fontSize: 16.0, fontWeight: FontWeight.bold, letterSpacing: 0);
    headlineSmall = GoogleFonts.poppins(fontSize: 14.0, fontWeight: FontWeight.bold, letterSpacing: 0);

    bodySmall = GoogleFonts.poppins(fontSize: 14.0, fontWeight: FontWeight.normal, letterSpacing: 0);
    bodyMedium = GoogleFonts.poppins(fontSize: 16.0, fontWeight: FontWeight.normal, letterSpacing: 0);
    bodyLarge = GoogleFonts.poppins(fontSize: 20.0, fontWeight: FontWeight.normal, letterSpacing: 0);

    titleSmall = GoogleFonts.poppins(fontSize: 14.0, fontWeight: FontWeight.w500, letterSpacing: 0);
    titleMedium = GoogleFonts.poppins(fontSize: 16.0, fontWeight: FontWeight.w500, letterSpacing: 0);
    titleLarge = GoogleFonts.poppins(fontSize: 20.0, fontWeight: FontWeight.w500, letterSpacing: 0);

    labelSmall = GoogleFonts.poppins(fontSize: 14.0, fontWeight: FontWeight.w600, letterSpacing: 0);
    labelMedium = GoogleFonts.poppins(fontSize: 16.0, fontWeight: FontWeight.w600, letterSpacing: 0);
    labelLarge = GoogleFonts.poppins(fontSize: 20.0, fontWeight: FontWeight.w600, letterSpacing: 0);

    longButtonText = GoogleFonts.poppins(fontSize: 15.0, fontWeight: FontWeight.w600, letterSpacing: 0, height: 1.8);
    shortButtonText = GoogleFonts.poppins(fontSize: 13.0, fontWeight: FontWeight.w600, letterSpacing: 0, height: 1.8);

    textButtonText = GoogleFonts.poppins(fontSize: 10, fontWeight: FontWeight.w700, letterSpacing: 0, height: 1.0);
    inputHintText = GoogleFonts.poppins(fontSize: 16.0, fontWeight: FontWeight.w500);
  }

  @override
  TextStyle? displayLarge;

  @override
  TextStyle? displayMedium;

  @override
  TextStyle? displaySmall;

  @override
  TextStyle? headlineLarge;

  @override
  TextStyle? headlineMedium;

  @override
  TextStyle? headlineSmall;
}
