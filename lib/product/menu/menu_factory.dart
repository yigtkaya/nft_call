import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:nft_call/view/drawer/drawer_view.dart';
import 'package:nft_call/view/login/login_view.dart';

import '../../view/event_detail/event_detail.dart';
import '../../view/landing/landing_view.dart';
import '../../view/login/sign_up_view.dart';
import '../../view/notification/notification_view.dart';
import '../../view/root/root_view.dart';
import '../../view/splash/splash_view.dart';
import 'menu_key.dart';

abstract class IMenuFactory {
  String getInitialRoute();
}

class MenuFactory extends IMenuFactory {
  static MenuFactory? _instance;

  static MenuFactory? get instance {
    _instance ??= MenuFactory._init();
    return _instance;
  }

  MenuFactory._init();

  static List<GetPage> getAllPages() {
    return [
      GetPage(name: MenuKey.splash.key, page: () => SplashView()),
      GetPage(
          name: MenuKey.login.key,
          page: () => LoginView(),
          transition: Transition.fadeIn),
      GetPage(
          name: MenuKey.signUp.key,
          page: () => SignUpView(),
          transition: Transition.fadeIn),
      GetPage(name: MenuKey.landing.key, page: () => LandingView()),
      GetPage(
          name: MenuKey.root.key,
          page: () => RootView(),
          transition: Transition.fadeIn),
      GetPage(name: MenuKey.notification.key, page: () => NotificationView()),
      GetPage(
          name: MenuKey.drawer.key,
          page: () => DrawerView(),
          transition: Transition.rightToLeft),
      GetPage(
          name: MenuKey.detail.key,
          page: () => EventDetailView(
                ktCardItem: null,
                currentChip: '',
            index: 0,
              ),
          transition: Transition.fadeIn),
    ];
  }

  /// To be able to manage environment selection page visibility, choose route menu by release mode.
  @override
  String getInitialRoute() {
    if (!kReleaseMode) {
      return MenuKey.environment_selection.key;
    }
    return MenuKey.splash.key;
  }
}
