import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:nft_call/core/base/view/base_view.dart';
import '../../core/base/view/view_info.dart';
import '../../core/components/choice_chip.dart';
import '../../core/components/nft_card.dart';
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
                  padding: const EdgeInsets.only(top: 10), child: ChoiceChipWidget(callback:(idx) => viewModel.choiceChipApiCall(idx),)),
              getListView(context),
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

  Widget getListView(BuildContext context) {
    return Expanded(
      child: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: 10,
          itemBuilder: (context, index) {
            return NftCard(
              isSelected: false,
              onFavChanged: (isSelected) {
              },
            );
          }),
    );
  }
}
