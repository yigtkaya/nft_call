import 'package:cached_network_image/cached_network_image.dart';
import 'package:date_count_down/date_count_down.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
  final String eventId;
  final KTCardItem item;

  EventDetailView({
    Key? key,
    required this.item,
    required this.eventId,
  }) : super(key: key) {
    initViewModel(EventDetailViewModel(eventId));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xf5263848),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ITIcon(
              iconName: AssetConstants.icons.discord,
              height: 32,
              width: 32,
              onPress: () => {launchURL(item.discord ?? "")},
            ),
            ITIcon(
              iconName: AssetConstants.icons.twitter,
              height: 32,
              width: 32,
              onPress: () => {launchURL(item.twitter ?? "")},
            ),
            ITIcon(
              iconName: AssetConstants.icons.marketplace,
              height: 32,
              width: 32,
              color: Colors.white,
              onPress: () => {launchURL(item.marketplace ?? "")},
            ),
            ITIcon(
              iconName: AssetConstants.icons.website,
              height: 32,
              width: 32,
              color: Colors.white,
              onPress: () => {launchURL(item.website ?? "")},
            ),
          ],
        ),
      ),
      body: RefreshIndicator(
        onRefresh: viewModel.getEvent,
        color: Colors.blueGrey,
        child: Padding(
          padding: const EdgeInsets.all(DimenConstant.LARGE),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      ITIcon(
                        iconName: AssetConstants.icons.cross,
                        width: 20,
                        height: 20,
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
                  Obx(
                    () => ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(10),
                      ),
                      child: Stack(
                        children: [
                          CachedNetworkImage(
                            imageUrl: item.imageUrl ?? "",
                            fit: BoxFit.fill,
                            height: 400,
                            width: double.infinity,
                            placeholder: (context, url) => const Center(
                                child: CircularProgressIndicator(
                              color: Colors.white,
                            )),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 5, right: 15, top: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      ITIcon(
                                        iconName: viewModel.isSelected
                                            ? AssetConstants
                                                .icons.favorite_menu_selected
                                            : AssetConstants.icons.favorite,
                                        width: 28,
                                        height: 28,
                                        color: Colors.white,
                                        onPress: () => {
                                          viewModel
                                              .onFavoriteChanged(eventId ?? ""),
                                        },
                                      ),
                                      const HorizontalSpace(),
                                      Obx(
                                        () => DTText(
                                          label: viewModel.favCount == 0
                                              ? "${item.favUidList!.length}"
                                              : "${viewModel.favCount}",
                                          style: context.regular12,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const VerticalSpace(
                    spaceAmount: 20,
                  ),
                  DTText(
                    label: item.collectionName ?? "NFT Collection Name",
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
                            style: context.semiBold16,
                            color: Colors.white),
                        const HorizontalSpace(),
                        DTText(
                          label: item.mintPrice ?? "00.5 ETH",
                          style: context.regular20,
                          color: Colors.blue,
                        ),
                      ],
                    ),
                  ),
                  const VerticalSpace(
                    spaceAmount: 7,
                  ),
                  const Opacity(
                    opacity: 0.4,
                    child: Divider(
                      color: Colors.grey,
                      thickness: 1.5,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 32.0),
                    child: DTText(
                      label: item.description ?? "empty desc",
                      style: context.regular16,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        DTText(
                            label: "Remaining Time to Mint Date",
                            style: context.semiBold16,
                            color: Colors.white),
                        item.mintDate == DateTime(2025, 4, 4, 3)
                            ? DTText(
                                label: "TBA",
                                style: context.regular16,
                                color: Colors.blue,
                              )
                            : CountDownText(
                                due: item.mintDate,
                                finishedText: "Minting",
                                showLabel: true,
                                longDateName: true,
                                daysTextLong: "D: ",
                                hoursTextLong: "H: ",
                                minutesTextLong: "M: ",
                                secondsTextLong: "S",
                                style: const TextStyle(color: Colors.blue),
                              ),
                      ],
                    ),
                  ),
                  const VerticalSpace(
                    spaceAmount: 27,
                  ),
                  const Opacity(
                    opacity: 0.4,
                    child: Divider(
                      color: Colors.grey,
                      thickness: 1.5,
                    ),
                  ),
                  const VerticalSpace(
                    spaceAmount: 22,
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
    try {
      final Uri uri = Uri.parse(url);
      if (!await launchUrl(uri)) {
        viewModel.showToastMessage("There is no URL");
      }
    } catch (e) {
      viewModel.showToastMessage("There is no link");
    }
  }
}
