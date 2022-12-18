import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nft_call/core/components/alert_list_item.dart';
import '../../core/base/view/base_view.dart';
import '../../core/base/view/view_info.dart';
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
