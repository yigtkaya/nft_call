import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nft_call/core/base/view/base_view.dart';
import 'package:nft_call/core/components/kt_icon.dart';
import 'package:nft_call/core/constants/asset.dart';
import 'package:nft_call/core/constants/dt_text.dart';
import 'package:nft_call/core/constants/extension.dart';
import 'package:nft_call/core/constants/horizontal_space.dart';
import 'package:nft_call/core/constants/theme/theme_manager.dart';
import 'package:nft_call/core/constants/vertical_space.dart';
import 'package:nft_call/view/drawer/drawer_model.dart';

import '../../core/base/view/view_info.dart';
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                        onTap: () => {viewModel.navigateToRoot()},
                        child: ITIcon(iconName: AssetConstants.icons.cross))
                  ],
                ),
              ),
              const Center(
                child: Image(
                  image: AssetImage("assets/images/logo_temp.png"),
                ),
              ),
              // sosyal medya linkleri her satır yeni row elemtiyle yapılacak
              const VerticalSpace(
                spaceAmount: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 75, bottom: 20),
                child: Row(
                  children: [
                    ITIcon(
                      iconName: AssetConstants.icons.twitter,
                      height: 26,
                      width: 26,
                    ),
                    const HorizontalSpace(
                      spaceAmount: 20,
                    ),
                    DTText(
                      label: "Follow us on twitter",
                      style: context.semiBold20,
                      color: ThemeManager
                          .instance?.getCurrentTheme.colorTheme.textColor,
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 75, bottom: 20),
                child: Row(
                  children: [
                    ITIcon(
                      iconName: AssetConstants.icons.twitter,
                      height: 26,
                      width: 26,
                    ),
                    const HorizontalSpace(
                      spaceAmount: 20,
                    ),
                    DTText(
                      label: "Follow us on twitter",
                      style: context.semiBold20,
                      color: ThemeManager
                          .instance?.getCurrentTheme.colorTheme.textColor,
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 75, bottom: 20),
                child: Row(
                  children: [
                    ITIcon(
                      iconName: AssetConstants.icons.gmail,
                      height: 26,
                      width: 26,
                    ),
                    const HorizontalSpace(
                      spaceAmount: 20,
                    ),
                    DTText(
                      label: "Contact us",
                      style: context.semiBold20,
                      color: ThemeManager
                          .instance?.getCurrentTheme.colorTheme.textColor,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void setViewInfo() {
    viewInfo =
        ViewInfoModel(menuKey: MenuKey.drawer, screenName: ScreenName.detay);
  }
}
