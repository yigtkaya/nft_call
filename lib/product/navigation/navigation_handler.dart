import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../menu/menu_key.dart';


class NavigationHandler {
  static final String _debugLabel = (NavigationHandler).toString();
  static NavigationHandler? _instance;

  static NavigationHandler? get instance {
    _instance ??= NavigationHandler._init();
    return _instance;
  }

  NavigationHandler._init();

  bool Function(Route<dynamic> route) _removeAllOldRoutes() => (Route<dynamic> route) => false;

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey(debugLabel: _debugLabel);

  Future navigateToPage(MenuKey menuKey, {Object? data}) async {
    Get.toNamed(menuKey.key, arguments: data, preventDuplicates: false);
  }

  Future popAndNavigateToPage(MenuKey menuKey, {Object? data}) async {
    Get.offAndToNamed(menuKey.key, arguments: data);
  }

  Future navigateToReset(MenuKey menuKey, {Object? data}) async {
    Get.offAllNamed(menuKey.key, arguments: data);
  }

  Future pop() async {
    Get.back();
  }

  Future loading() async {
    Get.toNamed(
      MenuKey.loading.key,
    );
  }

  Future redirectGivenView(StatefulWidget view) async {
    navigatorKey.currentState?.push(
      PageRouteBuilder(pageBuilder: (context, _, __) => view, opaque: false),
    );
  }

  T getData<T>() {
    return Get.arguments as T;
  }
}
