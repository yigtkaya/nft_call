import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:nft_call/core/base/view/base_view.dart';
import '../../core/base/view/view_info.dart';
import '../../core/components/choice_chip.dart';
import '../../core/constants/theme/color/gradient_colors.dart';
import '../../product/menu/menu_key.dart';
import '../../product/menu/screen_name.dart';
import 'landing_view_model.dart';

class LandingView extends BaseView<LandingView, LandingViewModel> {
  LandingView({Key? key}) : super(key: key) {
    initViewModel(LandingViewModel());
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  ColorConstants
                      .colorPlateList[
                          7 % (ColorConstants.colorPlateList.length)]
                      .startColor,
                  ColorConstants
                      .colorPlateList[
                          7 % (ColorConstants.colorPlateList.length)]
                      .endColor,
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                stops: const [0.0, 1.2],
                tileMode: TileMode.clamp),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: ChoiceChipWidget(
                      callback: (idx) => {
                            viewModel.getEventList(idx),
                          })),
              Obx(() => Expanded(child: viewModel.getListView(context, viewModel.chip),)),
            ],
          ),
        ),
      ),
    ));
  }

  @override
  void setViewInfo() {
    viewInfo =
        ViewInfoModel(menuKey: MenuKey.landing, screenName: ScreenName.landing);
  }

}
