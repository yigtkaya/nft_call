import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:nft_call/core/base/view/base_view.dart';
import '../../core/base/view/view_info.dart';
import '../../core/components/choice_chip.dart';
import '../nft_card/nft_view.dart';
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
                            viewModel.choiceChipApiCall(idx),
                          })),
              Expanded(child: getListView(context, viewModel.chip)),
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

  Widget getListView(BuildContext context, String chip) {
    return Obx(() => PageView.builder(
      controller: PageController(keepPage: true),
          scrollDirection: Axis.vertical,
          itemCount: viewModel.pageItemsList.length,
          itemBuilder: (BuildContext context, index) {
            return NFTCardView(
              currentChip: viewModel.chip,
              index: index,
              isFavorite: viewModel.isFavoritedByUser(index, viewModel.getCurrentUser()),
              ktCardItem: viewModel.pageItemsList[index],
              onFavChanged: () {
                viewModel.onFavoriteChanged(chip, index);
              },
            );
          },
        ));
  }
}
