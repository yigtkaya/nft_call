import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nft_call/core/base/view/base_view.dart';
import 'package:nft_call/view/login/reset_password_view.dart';
import 'package:nft_call/view/notification/notification_view.dart';
import 'package:nft_call/view/root/root_view_model.dart';
import '../../core/base/view/view_info.dart';
import '../../core/components/bottom_navigation.dart';
import '../../product/menu/menu_key.dart';
import '../../product/menu/screen_name.dart';
import '../landing/landing_view.dart';

class RootView extends BaseView<RootView, RootViewModel> {
  RootView({Key? key}) : super(key: key) {
    initViewModel(RootViewModel());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        child: Scaffold(
          backgroundColor:const Color(0xff16161f),
          resizeToAvoidBottomInset: false,
          body: Column(
            children: [
              Expanded(
                  child: PageView(
                onPageChanged: (page) => {viewModel.setCurrentPage(page)},
                controller: viewModel.pageController,
                children: [
                  /// Home View
                  LandingView(),


                  /// Stats View
                  NotificationView(),

                  Center(child: TextButton(onPressed: () { viewModel.singOut(); }, child: Text("sign Out"),

                  ),)
                ],
              )),

              /// Bottom Navigation View
              Obx(() => KTLandingBottomNavigationBar(
                    currentPage: viewModel.getCurrentPage,
                    selectedPageCallback: (selectedPage) => {
                      viewModel.setCurrentPage(selectedPage),
                      viewModel.animatePage(selectedPage)
                    },
                  )),
            ],
          ),
        ));
  }

  @override
  void setViewInfo() {
    viewInfo =
        ViewInfoModel(menuKey: MenuKey.root, screenName: ScreenName.root);
  }
}
