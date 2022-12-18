import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:nft_call/product/menu/menu_factory.dart';
import 'package:nft_call/product/navigation/navigation_handler.dart';
import 'package:nft_call/view/splash/splash_view.dart';
import 'core/base/binding/binding.dart';
import 'core/constants/theme/app_theme.dart';
import 'core/constants/theme/theme_manager.dart';

Future<void> main() async {
  await Hive.initFlutter();
  Binding().dependencies();

  runZonedGuarded<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [ SystemUiOverlay.bottom ]);
    /// Get any initial dynamic links
    ///final PendingDynamicLinkData? initialLink = await FirebaseDynamicLinks.instance.getInitialLink();
    runApp(const MyApp());
  }, (error, stack) => FirebaseCrashlytics.instance.recordError(error, stack));
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
