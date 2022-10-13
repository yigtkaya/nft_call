import 'package:flutter/material.dart';
import 'package:nft_call/view/splash/splash_view_model.dart';
import '../../core/base/view/base_view.dart';
import '../../core/base/view/view_info.dart';
import '../../core/components/kt_icon.dart';
import '../../core/constants/asset.dart';
import '../../product/menu/menu_key.dart';
import '../../product/menu/screen_name.dart';

class SplashView extends BaseView<SplashView, SplashViewModel> {
  SplashView({Key? key}) : super(key: key) {
    initViewModel(SplashViewModel());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ITIcon(iconName: AssetConstants.icons.splashFullWave),
                  // Icon(
                  //   Icons.build,
                  //   size: 50.0,
                  //   color: context.secondaryScaffold,
                  // ),
                  //const Text("Splash Page")
                ],
              )),
        ));
  }

  @override
  void setViewInfo() {
    viewInfo = ViewInfoModel(menuKey: MenuKey.splash, screenName: ScreenName.splash_ekrani);
  }
}