import 'package:cached_network_image/cached_network_image.dart';
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
  final int? favCount;
  final bool? isFavorite;
  final String? eventId;

  EventDetailView({
    Key? key,
    this.ktCardItem,
    this.eventId,
    required this.favCount,
    required this.isFavorite,
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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(DimenConstant.LARGE),
          child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
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
                  Obx(
                    () => ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(10),
                      ),
                      child: Stack(
                        children: [
                          CachedNetworkImage(
                            imageUrl: ktCardItem?.imageUrl ?? "",
                            fit: BoxFit.cover,
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
                                            : AssetConstants.icons
                                                .favorite_menu_un_selected,
                                        width: 28,
                                        height: 28,
                                        onPress: () => {
                                          viewModel.onFavoriteChanged(
                                              ktCardItem?.eventId ?? ""),
                                        },
                                      ),
                                      const HorizontalSpace(),
                                      DTText(
                                        label: viewModel.favCount != 0
                                            ? "${viewModel.favCount}"
                                            : "$favCount",
                                        style: context.regular12,
                                        color: Colors.white,
                                      )
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
                  const VerticalSpace(
                    spaceAmount: 5,
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
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ITIcon(
                        iconName: AssetConstants.icons.discord,
                        height: 30,
                        width: 30,
                        onPress: () => {launchURL(ktCardItem?.discord ?? "")},
                      ),
                      ITIcon(
                        iconName: AssetConstants.icons.twitter,
                        height: 30,
                        width: 30,
                        onPress: () => {launchURL(ktCardItem?.twitter ?? "")},
                      ),
                      ITIcon(
                        iconName: AssetConstants.icons.marketplace,
                        height: 30,
                        width: 30,
                        color: Colors.white,
                        onPress: () =>
                            {launchURL(ktCardItem?.marketplace ?? "")},
                      ),
                      ITIcon(
                        iconName: AssetConstants.icons.website,
                        height: 30,
                        width: 30,
                        color: Colors.white,
                        onPress: () => {launchURL(ktCardItem?.website ?? "")},
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
