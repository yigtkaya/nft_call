import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:nft_call/product/menu/menu_factory.dart';
import 'package:nft_call/product/navigation/navigation_handler.dart';
import 'package:nft_call/view/root/root_view.dart';
import 'package:nft_call/view/splash/splash_view.dart';
import 'core/base/binding/binding.dart';
import 'core/constants/theme/app_theme.dart';
import 'core/constants/theme/theme_manager.dart';

Future<void> _messageHandler(RemoteMessage message) async {
  print('background message ${message.data["eventId"]}');
}

const channel = AndroidNotificationChannel(
    "high_importance_channel", "High_importance_channel",
    playSound: true, importance: Importance.high);
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> main() async {
  await Hive.initFlutter();
  Binding().dependencies();
  runZonedGuarded<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    FirebaseMessaging.onBackgroundMessage(_messageHandler);

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (message.notification != null) {
        flutterLocalNotificationsPlugin.show(
            message.notification.hashCode,
            message.notification!.title,
            message.notification!.body,
            const NotificationDetails(
                android: AndroidNotificationDetails(
                    "high_importance_channel", "High Importance Notifications",
                    color: Colors.blue,
                    priority: Priority.high,
                    importance: Importance.high,
                    playSound: true,
                    icon: "@mipmap/ic_launcher")));
      }
    });
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('A new onMessageOpenedApp event was published!');
      if (message.notification != null) {
        Get.to(RootView());
      }
    });
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    runApp(const MyApp());
  }, (error, stack) => FirebaseCrashlytics.instance.recordError(error, stack));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
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
