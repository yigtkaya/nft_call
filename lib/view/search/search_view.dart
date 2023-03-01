import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:nft_call/core/base/view/base_view.dart';
import 'package:nft_call/core/constants/extension.dart';
import 'package:nft_call/view/search/search_view_model.dart';
import '../../core/base/view/view_info.dart';
import '../../core/components/line_item.dart';
import '../../core/constants/dt_text.dart';
import '../../core/constants/horizontal_space.dart';
import '../../core/constants/theme/color/gradient_colors.dart';
import '../../product/menu/menu_key.dart';
import '../../product/menu/screen_name.dart';

class SearchView extends BaseView<SearchView, SearchViewModel> {
  SearchView({Key? key}) : super(key: key) {
    initViewModel(SearchViewModel());
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
        body: Container(
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
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: const [0.0, 1.2],
                  tileMode: TileMode.clamp),
            ),
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(top: 15.0, left: 15, right: 15),
                  child: TextField(
                    controller: viewModel.nameController,
                    onChanged: (value) => viewModel.fillFilterList(),
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.grey.shade500,
                        ),
                        filled: true,
                        fillColor: ColorConstants
                            .colorPlateList[
                                7 % (ColorConstants.colorPlateList.length)]
                            .endColor,
                        contentPadding: const EdgeInsets.only(left: 20),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: BorderSide.none),
                        hintStyle: TextStyle(
                            fontSize: 14, color: Colors.grey.shade500),
                        hintText: "Search NFT Collection"),
                  ),
                ),
                Expanded(child: getListView(context)),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              foregroundColor: const Color(0xff0b1b28),
                              backgroundColor: Colors.transparent,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 20),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              )),
                          onPressed: () {
                            viewModel.setSelected();
                            Get.back();
                          },
                          child: Row(
                            children: [
                              const Icon(
                                Icons.refresh,
                                color: Colors.white,
                                size: 20,
                              ),
                              const HorizontalSpace(),
                              DTText(
                                label: "Cancel",
                                color: Colors.white,
                                style: context.regular20,
                              ),
                            ],
                          )),
                      const HorizontalSpace(
                        spaceAmount: 20,
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              foregroundColor: const Color(0xff0b1b28),
                              backgroundColor: Colors.blue,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 20),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              )),
                          onPressed: () {
                            Get.back(result: {
                              "name": viewModel.chosenItemName,
                              "id": viewModel.chosenItemId
                            });
                          },
                          child: DTText(
                            label: "Accept",
                            color: Colors.white,
                            style: context.regular20,
                          )),
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }

  @override
  void setViewInfo() {
    viewInfo =
        ViewInfoModel(menuKey: MenuKey.search, screenName: ScreenName.arama);
  }

  Widget getListView(BuildContext context) {
    return Obx(
      () => viewModel.filteredCollectionList.isNotEmpty
          ? ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: viewModel.filteredCollectionList.length,
              itemBuilder: (context, index) {
                return Obx(
                  () => KTLineItem(
                    selectedIcon: viewModel.chosenItem == index,
                    description: viewModel
                            .filteredCollectionList[index].collectionName ??
                        "",
                    onCallback: () => viewModel.setChosenItem(index),
                  ),
                );
              },
            )
          : const Center(child: CircularProgressIndicator(color: Colors.white,)),
    );
  }
}
