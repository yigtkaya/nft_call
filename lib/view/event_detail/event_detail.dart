import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:nft_call/core/components/image_card.dart';
import 'package:nft_call/core/components/kt_icon.dart';
import 'package:nft_call/core/constants/dimen.dart';
import 'package:nft_call/core/constants/dt_text.dart';
import 'package:nft_call/core/constants/extension.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/base/view/base_view.dart';
import '../../core/base/view/view_info.dart';
import '../../core/constants/asset.dart';
import '../../core/constants/horizontal_space.dart';
import '../../core/constants/vertical_space.dart';
import '../../product/menu/menu_key.dart';
import '../../product/menu/screen_name.dart';
import '../../product/model/nft_info_model.dart';
import 'event_detail_model.dart';

class EventDetailView extends BaseView<EventDetailView, EventDetailViewModel> {
  late KTCardItem? ktCardItem;
  final String currentChip;
  final int index;

  EventDetailView({
    Key? key,
    this.ktCardItem,
    required this.currentChip,
    required this.index,
  }) : super(key: key) {
    initViewModel(EventDetailViewModel());
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xf5263848),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(DimenConstant.LARGE),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      ITIcon(
                        iconName: AssetConstants.icons.cross,
                        onPress: () => {Get.back()},
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.center,
                          child: DTText(
                            label: 'Detail',
                            style: context.bold20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const VerticalSpace(
                    spaceAmount: 20,
                  ),
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(10),
                    ),
                    child: ImageNFT(url: ktCardItem?.imageUrl ?? "", onFavChanged: (isSelected) => {}),
                  ),
                  const VerticalSpace(
                    spaceAmount: 20,
                  ),
            DTText(
              label: ktCardItem?.collectionName ?? "NFT Collection Name",
              style: context.semiBold20,
              color: Colors.white,
            ),
            const VerticalSpace(
              spaceAmount: 5,
            ),
            SizedBox(
              width: double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  DTText(
                      label: "Mint Price :",
                      style: context.semiBold14,
                      color: Colors.white),
                  const HorizontalSpace(),
                  DTText(
                    label: ktCardItem?.mintPrice ?? "00.5 ETH",
                    style: context.regular20,
                    color: Colors.blue,
                  ),
                ],
              ),
            ),
            const Opacity(
              opacity: 0.4,
              child: Divider(
                color: Colors.grey,
                thickness: 1.5,
              ),
            ),
            const VerticalSpace(
              spaceAmount: 5,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: DTText(
                    label:
                    'If you want to receive notifications from this collection tap the bell!',
                    style: context.semiBold14,
                    color: Colors.white,
                  ),
                ),
                const HorizontalSpace(
                  spaceAmount: 10,
                ),
                // bildirim add kısmı ekelencek
                Obx(() => ITIcon(
                    iconName: viewModel.isAlertOn
                        ? AssetConstants.icons.added_alarm
                        : AssetConstants.icons.add_alarm,
                    width: 50,
                    height: 50,
                    onPress: () => {
                      viewModel.getEventDetail(currentChip, index),
                      viewModel.onAlertChanged(currentChip, index)
                    },
                  ),
                ),
                const HorizontalSpace(
                  spaceAmount: 10,
                ),
              ],
            ),
            const VerticalSpace(
              spaceAmount: 10,
            ),
            const Opacity(
              opacity: 0.4,
              child: Divider(
                color: Colors.grey,
                thickness: 1.5,
              ),
            ),
            const VerticalSpace(
              spaceAmount: 25,
            ),
            DTText(
              label: ktCardItem?.description ?? "empty desc",
              style: context.regular16,
              color: Colors.white,
            ),
            const VerticalSpace(
              spaceAmount: 35,
            ),
            SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  DTText(
                      label: "Mint Date",
                      style: context.semiBold20,
                      color: Colors.white),
                  DTText(
                    label: ktCardItem?.mintDate ?? "00:00:00",
                    style: context.regular20,
                    color: Colors.blue,
                  )
                ],
              ),
            ),
            const VerticalSpace(
              spaceAmount: 20,
            ),
            const Opacity(
              opacity: 0.4,
              child: Divider(
                color: Colors.grey,
                thickness: 1.5,
              ),
            ),
            const VerticalSpace(
              spaceAmount: 20,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ITIcon(
                  iconName: AssetConstants.icons.discord,
                  height: 30,
                  width: 30,
                  onPress: () => {
                    launchURL(ktCardItem?.discord ?? "")
                  },
                ),
                ITIcon(
                  iconName: AssetConstants.icons.twitter,
                  height: 30,
                  width: 30,
                  onPress: () => {
                    launchURL(ktCardItem?.twitter ?? "")
                  },
                ),
                ITIcon(
                  iconName: AssetConstants.icons.marketplace,
                  height: 30,
                  width: 30,
                  color: Colors.white,
                  onPress: () => {
                    launchURL(ktCardItem?.marketplace ?? "")
                  },
                ),
                ITIcon(
                  iconName: AssetConstants.icons.website,
                  height: 30,
                  width: 30,
                  color: Colors.white,
                  onPress: () => {
                    launchURL(ktCardItem?.website ?? "")
                  },
                ),
                  const VerticalSpace(
                    spaceAmount: 30,
                  ),
                ],
              ),
            ]),
          ),
        ),
      ),
    ));
  }

  @override
  void setViewInfo() {
    viewInfo =
        ViewInfoModel(menuKey: MenuKey.detail, screenName: ScreenName.detay);
  }

  Future<void> launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw "Can not launch url";
    }
  }
}
