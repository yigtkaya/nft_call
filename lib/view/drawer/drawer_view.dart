import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:nft_call/core/base/view/base_view.dart';
import 'package:nft_call/core/components/kt_icon.dart';
import 'package:nft_call/core/constants/asset.dart';
import 'package:nft_call/core/constants/dt_text.dart';
import 'package:nft_call/core/constants/extension.dart';
import 'package:nft_call/core/constants/horizontal_space.dart';
import 'package:nft_call/core/constants/theme/theme_manager.dart';
import 'package:nft_call/core/constants/vertical_space.dart';
import 'package:nft_call/view/drawer/drawer_model.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/base/view/view_info.dart';
import '../../core/constants/theme/color/gradient_colors.dart';
import '../../product/menu/menu_key.dart';
import '../../product/menu/screen_name.dart';

class DrawerView extends BaseView<DrawerView, DrawerViewModel> {
  DrawerView({Key? key}) : super(key: key) {
    initViewModel(DrawerViewModel());
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: Scaffold(
        body: Center(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      ColorConstants
                          .colorPlateList[7 % (ColorConstants.colorPlateList.length)]
                          .startColor,
                      ColorConstants
                          .colorPlateList[7 % (ColorConstants.colorPlateList.length)]
                          .endColor,
                    ],
                    begin: Alignment.bottomRight,
                    end: Alignment.topCenter,
                    stops: const [0.0, 1.2],
                    tileMode: TileMode.clamp),
              ),
              child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                      padding: const EdgeInsets.all(25),
                      child: ITIcon(
                        iconName: AssetConstants.icons.cross,
                        height: 22,
                        width: 22,
                        onPress: () => Get.back(),
                      )),
                ],
              ),
            Center(
                child: ITIcon(iconName: AssetConstants.icons.nft_call, color: const Color(
                    0xff2f4dbd),)
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextButton(
                        onPressed: () => launchURL("https://www.twitter.com"),
                        child: Row(
                          children: [
                            ITIcon(
                              iconName: AssetConstants.icons.twitter,
                              width: 26,
                              height: 26,
                            ),
                            const HorizontalSpace(
                              spaceAmount: 20,
                            ),
                            DTText(
                                label: "Follow us on Twitter",
                                color: Colors.white,
                                style: context.regular20)
                          ],
                        ),
                      ),
                      TextButton(
                        onPressed: () => launchURL(
                            "mailto:yigitkaya@vivitate.com?subject=<subject>&body=<body>"),
                        child: Row(
                          children: [
                            ITIcon(
                              iconName: AssetConstants.icons.gmail,
                              width: 26,
                              height: 26,
                            ),
                            const HorizontalSpace(
                              spaceAmount: 20,
                            ),
                            DTText(
                                label: "Contact us",
                                color: Colors.white,
                                style: context.regular20)
                          ],
                        ),
                      ),
                      TextButton(
                        onPressed: () => launchURL(
                            "mailto:yigitkaya@vivitate.com?subject=Collection Apply&body=<body>"),
                        child: Row(
                          children: [
                            ITIcon(
                              iconName: AssetConstants.icons.gmail,
                              width: 26,
                              height: 26,
                            ),
                            const HorizontalSpace(
                              spaceAmount: 20,
                            ),
                            DTText(
                                label: "To add collection",
                                color: Colors.white,
                                style: context.regular20)
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: TextButton(
                        onPressed: () => viewModel.signOut(),
                        child: DTText(
                            label: "Sign out",
                            color: Colors.white,
                            style: context.regular20)),
                  ),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: DTText(
                        label: "1.0.0",
                        color: Colors.white,
                        style: context.regular12),
                  ),
                ),
              ),
          ],
        ),
            )),
      ),
    );
  }

  @override
  void setViewInfo() {
    viewInfo =
        ViewInfoModel(menuKey: MenuKey.drawer, screenName: ScreenName.detay);
  }

  Future<void> launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw "Can not launch url";
    }
  }
}
