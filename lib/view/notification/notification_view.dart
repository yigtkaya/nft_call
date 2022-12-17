import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:nft_call/core/components/alert_list_item.dart';
import 'package:nft_call/core/constants/extension.dart';
import 'package:nft_call/core/constants/horizontal_space.dart';
import 'package:nft_call/view/drawer/drawer_view.dart';
import '../../core/base/view/base_view.dart';
import '../../core/base/view/view_info.dart';
import '../../core/components/kt_icon.dart';
import '../../core/constants/asset.dart';
import '../../core/constants/dt_text.dart';
import '../../core/constants/theme/color/gradient_colors.dart';
import '../../product/menu/menu_key.dart';
import '../../product/menu/screen_name.dart';
import 'notification_view_model.dart';

class NotificationView
    extends BaseView<NotificationView, NotificationViewModel> {
  NotificationView({Key? key}) : super(key: key) {
    initViewModel(NotificationViewModel());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  ColorConstants.colorPlateList[7 % (ColorConstants.colorPlateList.length)].startColor,
                  ColorConstants.colorPlateList[7 % (ColorConstants.colorPlateList.length)].endColor,
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                stops: const [0.0, 1.2],
                tileMode: TileMode.clamp),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const HorizontalSpace(spaceAmount: 40,),
                        Expanded(
                          child: Align(
                            alignment: Alignment.center,
                            child: DTText(
                              label: 'Alerts',
                              style: context.bold16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        ITIcon(
                          iconName: AssetConstants.icons.drawer_menu,
                          onPress: () => {Get.to(DrawerView())},
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  AlertListItem(),
                  AlertListItem(),
                  AlertListItem(),
                  AlertListItem(),
                  AlertListItem(),
                  AlertListItem(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void setViewInfo() {
    viewInfo = ViewInfoModel(
        menuKey: MenuKey.notification, screenName: ScreenName.notification);
  }
}
