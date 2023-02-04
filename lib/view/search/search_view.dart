import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:nft_call/core/base/view/base_view.dart';
import 'package:nft_call/view/search/search_view_model.dart';

import '../../core/base/view/view_info.dart';
import '../../core/components/line_item.dart';
import '../../product/menu/menu_key.dart';
import '../../product/menu/screen_name.dart';

class SearchView extends BaseView<SearchView, SearchViewModel> {
  String? chosenCollection;

  SearchView({this.chosenCollection, Key? key}) : super(key: key) {
    initViewModel(SearchViewModel());
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.grey.shade900,
        title: SizedBox(
          height: 38,
          child: TextField(
            controller: viewModel.nameController,
            onChanged: (value) => viewModel.fillFilterList(),
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[850],
                contentPadding: const EdgeInsets.all(0),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey.shade500,
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide.none),
                hintStyle: TextStyle(fontSize: 14, color: Colors.grey.shade500),
                hintText: chosenCollection ?? "Search NFT Collection"),
          ),
        ),
      ),
      body: Obx(
        () => Container(
          color: Colors.grey.shade500,
          child: viewModel.filteredCollectionList.isNotEmpty
              ? ListView.builder(
                  itemCount: viewModel.filteredCollectionList.length,
                  itemBuilder: (context, index) {
                    return KTLineItem(
                      onCallback: () {},
                        description: viewModel
                            .filteredCollectionList[index].collectionName,
                    );
                  },
                )
              : const Center(
                  child: CircularProgressIndicator()),
        ),
      ),
    );
  }

  @override
  void setViewInfo() {
    viewInfo =
        ViewInfoModel(menuKey: MenuKey.search, screenName: ScreenName.arama);
  }
}
