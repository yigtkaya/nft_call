import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nft_call/core/components/alert_list_item.dart';
import 'package:nft_call/core/components/costum_switch.dart';
import 'package:nft_call/core/components/line_item.dart';
import 'package:nft_call/core/constants/dt_text.dart';
import 'package:nft_call/core/constants/theme/styles.dart';
import 'package:nft_call/view/event_detail/event_detail.dart';
import '../../core/base/view/base_view.dart';
import '../../core/base/view/view_info.dart';
import '../../core/constants/theme/color/gradient_colors.dart';
import '../../product/menu/menu_key.dart';
import '../../product/menu/screen_name.dart';
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                KTCustomViewSwitch(
                  callback: (isSelected) => {viewModel.setView(isSelected)},
                ),
              ],
            ),
            Obx(() => Expanded(
                child: viewModel.isListViewSelected
                    ? addAlertView(context)
                    : getListView(context)))
          ],
        ),
      ),
    ));
  }

  Widget addAlertView(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Flexible(
          child: DTText(
            label: "Only 5 alert can be turned on during beta phase.",
            style: KTLabelStyle,
          ),
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.white, width: 0.5)),
          child: GestureDetector(
              onTap: () => Get.to(
                  () => searchList(context)),
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: DTText(
                    label: viewModel.nameController.text == "" ? "Select NFT Collection" : viewModel.nameController.text,
                    style: const TextStyle(color: Colors.blueGrey)),
              )),
        ),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
              disabledBackgroundColor: Colors.blue.withOpacity(0.1),
              foregroundColor: const Color(0xff364d64),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                )),
            onPressed: true ? (){
              viewModel.getEventList();  } : null,
            child: const DTText(
              label: "LOGIN",
              color: Colors.black,
              style: KTLabelStyle,
            )),
      ],
    );
  }
  Widget searchList(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      elevation: 0,
      backgroundColor: Colors.grey.shade900,
      title: SizedBox(
        height: 38,
        child: TextField(
          onChanged: (value) => viewModel.fillFilterList(),
          decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey[850],
              contentPadding: const EdgeInsets.all(0),
              prefixIcon: Icon(Icons.search, color: Colors.grey.shade500,),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: BorderSide.none
              ),
              hintStyle: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade500
              ),
              hintText: "Search NFT Collection"
          ),
        ),
      ),
    ),
      body: Obx(() => Container(
          color: Colors.grey.shade500,
          child: viewModel.filteredCollection.isNotEmpty ? ListView.builder(
            itemCount:  viewModel.filteredCollection.length,
            itemBuilder: (context, index) {
              return KTLineItem(name: "name", description: viewModel.filteredCollection[index].collectionName, subDescription: "subDescription");
            },
          )
              :
          const Center(child: Text("No users found", style: TextStyle(color: Colors.white),)),
        ),
      ),
    );
  }
  Widget getListView(BuildContext context) {
    return Obx(() => ListView.builder(
        itemCount: viewModel.pageItemsList.length,
        itemBuilder: (BuildContext context, index) {
          return AlertListItem(
            ktCardItem: viewModel.pageItemsList[index],
            onPress: () => Get.to(() =>
                EventDetailView(currentChip: "currentChip", index: index)),
          );
        }));
  }

  @override
  void setViewInfo() {
    viewInfo = ViewInfoModel(
        menuKey: MenuKey.notification, screenName: ScreenName.notification);
  }
}
