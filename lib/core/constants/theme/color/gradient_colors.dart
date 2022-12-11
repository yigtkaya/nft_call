import 'package:flutter/material.dart';

class ColorConstants {
  static List<MenuGradientColor> colorPlateList = [
    MenuGradientColor(const Color(0xff889eff), const Color(0xff515aff)),
    MenuGradientColor(const Color(0xfffbab7e), const Color(0xfff7ce68)),
    MenuGradientColor(const Color(0xffff3ea2), const Color(0xfffa424e)),
    MenuGradientColor(const Color(0xff0ba360), const Color(0xff3cba92)),
    MenuGradientColor(const Color(0xfffad0c4), const Color(0xffff9a9e)),
    MenuGradientColor(const Color(0xfff09819), const Color(0xfffe6767)),
    MenuGradientColor(const Color(0xfffbc2eb), const Color(0xffa18cd1)),
  ];
}

class MenuGradientColor {
  final Color startColor;
  Color endColor;

  MenuGradientColor(this.startColor, this.endColor);
}