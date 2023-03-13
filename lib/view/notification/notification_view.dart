import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nft_call/core/components/costum_switch.dart';
import 'package:nft_call/core/components/kt_icon.dart';
import 'package:nft_call/core/constants/asset.dart';
import 'package:nft_call/core/constants/dt_text.dart';
import 'package:nft_call/core/constants/extension.dart';
import 'package:nft_call/core/constants/horizontal_space.dart';
import 'package:nft_call/core/constants/vertical_space.dart';
import 'package:nft_call/view/drawer/drawer_view.dart';
import '../../core/base/view/base_view.dart';
import '../../core/base/view/view_info.dart';
import '../../core/constants/dimen.dart';
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
              begin: Alignment.bottomRight,
              end: Alignment.topCenter,
              stops: const [0.0, 1.2],
              tileMode: TileMode.clamp),
        ),
        child: Padding(
          padding: const EdgeInsets.all(DimenConstant.LARGE),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.center,
                      child: DTText(
                        label: 'Alerts',
                        style: context.bold20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  ITIcon(
                    iconName: AssetConstants.icons.drawer_menu,
                    color: Colors.white,
                    onPress: () => {
                      Get.to(() => DrawerView(),
                          transition: Transition.rightToLeftWithFade)
                    },
                  ),
                ],
              ),
              const VerticalSpace(
                spaceAmount: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  KTCustomViewSwitch(
                    callback: (isSelected) => viewModel.setView(isSelected),
                    isViewSelected: viewModel.isViewSelected,
                  )
                ],
              ),
              const VerticalSpace(
                spaceAmount: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xff364d64),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
                  child: DTText(
                    label: "Only 3 alerts can be turned on during beta phase.",
                    style: context.regular16,
                    color: Colors.white,
                  ),
                ),
              ),
              Obx(() => Expanded(
                  child: viewModel.isViewSelected
                      ? addAlertView(context)
                      : Center(
                          child: viewModel.getUsersAlerts(),
                        ),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }

  Widget addAlertView(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Spacer(),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                side: const BorderSide(width: 1, color: Colors.blue),
                foregroundColor: const Color(0xff364d64),
                backgroundColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                )),
            onPressed: () async {
              viewModel.navigateToSearch();
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                DTText(
                  label: viewModel.resultName != ""
                      ? viewModel.resultName
                      : "Search for NFT Collection",
                  color: Colors.blueGrey,
                  style: context.regular16,
                ),
                const HorizontalSpace(),
                const Icon(
                  Icons.arrow_drop_down,
                  color: Colors.white,
                ),
              ],
            )),
        const VerticalSpace(
          spaceAmount: 50,
        ),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff364d64),
                disabledBackgroundColor: const Color(0xff0f1418),
                foregroundColor: const Color(0xff0f1418),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                )),
            onPressed: (viewModel.isAddButtonEnable && viewModel.isVerified)
                ? () {
                    viewModel.createAlert();
                  }
                : null,
            child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Obx(
                  () => DTText(
                    label: "Create",
                    color: viewModel.isAddButtonEnable
                        ? Colors.white
                        : Colors.blueGrey,
                    style: context.regular16,
                  ),
                ))),
        const Spacer(),
        Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color(0xff364d64),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text.rich(
                TextSpan(
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                    children: [
                      WidgetSpan(
                          child: ITIcon(
                        iconName: AssetConstants.icons.info_icon,
                        color: Colors.white,
                        width: 16,
                        height: 16,
                      )),
                      const TextSpan(
                          text:
                              " Notifications for the beta version will be sent on a daily and hourly basis. In future releases, we will provide the option for the user to specify the frequency of notifications.")
                    ]),
              ),
            )),
      ],
    );
  }

//

  @override
  void setViewInfo() {
    viewInfo = ViewInfoModel(
        menuKey: MenuKey.notification, screenName: ScreenName.notification);
  }
}
