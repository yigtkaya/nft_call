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
import '../../product/model/nft_info_model.dart';
import '../nft_card/nft_view.dart';
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
              Obx(() => Expanded(child: viewModel.pageItemsList.isEmpty ? const Center(child: CircularProgressIndicator(),): getListView(context, viewModel.chip),)),
            ],
          ),
        ),
      ),
    ));
  }
  Widget getListView(BuildContext context, String chip) {
    final stream = FirebaseFirestore.instance.collection("events").snapshots();

    return StreamBuilder(
      stream: stream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasData) {
          List<KTCardItem> collectionList = viewModel.filterByTag(snapshot.data!.docs);
          return PageView.builder(
            controller: PageController(keepPage: true),
            scrollDirection: Axis.vertical,
            itemCount: collectionList.length,
            itemBuilder: (BuildContext context, index) {
              Future.delayed(const Duration(seconds: 3));
              return NFTCardView(
                favCount: collectionList[index].favUidList?.length ?? 0,
                isFavorite: viewModel.isFavoritedByUser(collectionList, index),
                ktCardItem: collectionList[index],
                onFavChanged: () {
                  viewModel.onFavoriteChanged(collectionList[index].eventId ?? "", index);
                },
              );
            },
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
        // filter the list by choice of tag
      },
    );
  }
  @override
  void setViewInfo() {
    viewInfo =
        ViewInfoModel(menuKey: MenuKey.landing, screenName: ScreenName.landing);
  }

}
