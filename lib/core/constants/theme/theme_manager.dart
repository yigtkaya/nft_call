import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app_theme.dart';

class ThemeManager {
  static ThemeManager? _instance;

  static ThemeManager? get instance {
    _instance ??= ThemeManager._init();
    return _instance;
  }

  ThemeManager._init() {
    _currentTheme = LightAppTheme();
  }

  IAppTheme? _currentTheme;

  void changeTheme() {
    if (Get.isDarkMode) {
      _currentTheme = LightAppTheme();
      Get.changeThemeMode(ThemeMode.light);
    } else {
      _currentTheme = DarkAppTheme();
      Get.changeThemeMode(ThemeMode.dark);
    }
  }

  ThemeMode getInitialThemeMode() {
    _currentTheme = DarkAppTheme();
    return ThemeMode.dark;
  }

  IAppTheme get getCurrentTheme => _currentTheme ?? LightAppTheme();

  static getColor() {}
}
