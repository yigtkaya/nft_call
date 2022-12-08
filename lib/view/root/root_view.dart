import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nft_call/core/base/view/base_view.dart';
import 'package:nft_call/core/components/kt_icon.dart';
import 'package:nft_call/core/constants/asset.dart';
import 'package:nft_call/core/constants/dt_text.dart';
import 'package:nft_call/core/constants/extension.dart';
import 'package:nft_call/core/constants/theme/theme_manager.dart';
import 'package:nft_call/view/root/root_view_model.dart';
import '../../core/base/view/view_info.dart';
import '../../core/components/bottom_navigation.dart';
import '../../product/menu/menu_key.dart';
import '../../product/menu/screen_name.dart';
import '../favorite/favorite_view.dart';
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
          backgroundColor: ThemeManager.instance?.getCurrentTheme.colorTheme.primaryScaffoldBackground,
          appBar: AppBar(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            backgroundColor: ThemeManager.instance?.getCurrentTheme.colorTheme
                .bottomNavigationBackground,
            title: Row(children: [
              Expanded(
                  child: Center(
                child: DTText(
                  label: "NFT Calendar",
                  style: context.semiBold20,
                  color: ThemeManager
                      .instance?.getCurrentTheme.colorTheme.textColor,
                ),
              ))
            ]),
            automaticallyImplyLeading: false,
          ),
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

                  /// Favorite View
                  FavoriteView(),

                  /// Stats View
                  //StatsView()
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
