import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nft_call/core/components/costum_switch.dart';
import 'package:nft_call/core/components/line_item.dart';
import 'package:nft_call/core/constants/dt_text.dart';
import 'package:nft_call/core/constants/extension.dart';
import 'package:nft_call/core/constants/horizontal_space.dart';
import 'package:nft_call/core/constants/vertical_space.dart';
import '../../core/base/view/base_view.dart';
import '../../core/base/view/view_info.dart';
import '../../core/constants/theme/color/gradient_colors.dart';
import '../../product/menu/menu_key.dart';
import '../../product/menu/screen_name.dart';
import '../search/search_view.dart';
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
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              stops: const [0.0, 1.2],
              tileMode: TileMode.clamp),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const VerticalSpace(
              spaceAmount: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                KTCustomViewSwitch(
                  callback: (isSelected) => {viewModel.setView(isSelected)},
                ),
              ],
            ),
            Obx(() => Expanded(
                child: viewModel.isViewSelected
                    ? addAlertView(context)
                    : const Center(
                        child: Text("data"),
                      )))
          ],
        ),
      ),
    ));
  }

  Widget searchView(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.grey.shade900,
        title: SizedBox(
          height: 38,
          child: TextField(
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
                hintText: "Search NFT Collection"),
          ),
        ),
      ),
      body: Obx(
        () => Container(
          color: Colors.grey.shade500,
          child: viewModel.filteredList.isNotEmpty
              ? ListView.builder(
                  itemCount: viewModel.filteredList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                          viewModel.filteredList[index].collectionName ?? ""),
                    );
                  },
                )
              : const Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }

  Widget addAlertView(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: DTText(
            label: "Only 5 alert can be turned on during beta phase.",
            style: context.regular14,
            color: Colors.white,
          ),
        ),
        const VerticalSpace(
          spaceAmount: 50,
        ),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                side: const BorderSide(width: 1, color: Colors.blue),
                foregroundColor: const Color(0xff364d64),
                backgroundColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                )),
            onPressed: () async {
              final result = await Navigator.push(context, MaterialPageRoute(
                builder: (BuildContext context) => SearchView(),));
              print(result);
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                DTText(
                  label: "Search NFT Collection",
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
            onPressed: true ? () {} : null,
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
