import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nft_call/core/components/alert_list_item.dart';
import 'package:nft_call/view/event_detail/event_detail.dart';
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
      body: RefreshIndicator(
        onRefresh: () async {viewModel.getEventIdList;},
        child: Container(
          width: double.infinity,
          height: double.infinity,
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
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                stops: const [0.0, 1.2],
                tileMode: TileMode.clamp),
          ),
          child: Obx(
            () => viewModel.pageItemsList.isNotEmpty
                ? getListView(context)
                : Center(
                    child: TextButton(child: Text("Add Alert to get notificate"), onPressed: () {
                      viewModel.getEventIdList();
                    },),
                  ),
          ),
        ),
      ),
    ));
  }

  Widget getListView(BuildContext context) {
    return Obx(
      () => ListView.builder(
          itemCount: viewModel.pageItemsList.length,
          itemBuilder: (BuildContext context, index) {
            return AlertListItem(
              ktCardItem: viewModel.pageItemsList[index],
              onPress: () => Get.to(() => EventDetailView(currentChip: "currentChip", index: index)),
            );
          })
    );
  }

  @override
  void setViewInfo() {
    viewInfo = ViewInfoModel(
        menuKey: MenuKey.notification, screenName: ScreenName.notification);
  }
}
