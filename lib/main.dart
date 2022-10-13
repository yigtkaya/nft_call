import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:nft_call/product/menu/menu_factory.dart';
import 'package:nft_call/product/navigation/navigation_handler.dart';
import 'package:nft_call/view/splash/splash_view.dart';
import 'core/base/binding/binding.dart';
import 'core/constants/theme/app_theme.dart';
import 'core/constants/theme/theme_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Neo Flutter Base',
      theme: AppThemeBuilder.createTheme(LightAppTheme()),
      themeMode:
          ThemeManager.instance?.getInitialThemeMode() ?? ThemeMode.light,
      initialBinding: Binding(),
      getPages: MenuFactory.getAllPages(),
      home: SplashView(),
      navigatorKey: NavigationHandler.instance?.navigatorKey,
    );
  }
}
