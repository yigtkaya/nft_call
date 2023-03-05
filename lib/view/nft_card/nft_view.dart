import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:nft_call/core/constants/asset.dart';
import 'package:nft_call/core/constants/extension.dart';
import 'package:nft_call/core/constants/theme/theme_manager.dart';
import 'package:nft_call/product/model/nft_info_model.dart';
import '../../core/components/kt_text_button.dart';
import '../../core/constants/dt_text.dart';
import '../../core/constants/horizontal_space.dart';
import '../../core/components/kt_icon.dart';
import '../../core/constants/vertical_space.dart';
import '../event_detail/event_detail.dart';

class NFTCardView extends StatefulWidget {
  final void Function() onFavChanged;
  final KTCardItem ktCardItem;
  int favCount;
  bool isFavorite;

  NFTCardView(
      {Key? key,
      required this.onFavChanged,
      required this.ktCardItem,
      required this.isFavorite,
      required this.favCount})
      : super(key: key);

  @override
  NFTCardViewState createState() => NFTCardViewState();
}

class NFTCardViewState extends State<NFTCardView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(14),
        child: Container(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xff16161f), Color(0xff364d64)],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            boxShadow: [
              BoxShadow(
                color: ThemeManager
                        .instance?.getCurrentTheme.colorTheme.colors.abbey ??
                    Colors.black,
                offset: const Offset(0.0, 1.5),
                blurRadius: 5,
              ),
            ],
            border: Border.all(color: Colors.black, width: 1.5),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Stack(
                  children: [
                    CachedNetworkImage(
                      imageUrl: widget.ktCardItem.imageUrl ?? "",
                      fit: BoxFit.fill,
                      width: double.infinity,
                      height: 500,
                      placeholder: (context, url) => const Center(
                          child: CircularProgressIndicator(
                        color: Colors.white,
                      )),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5, right: 15, top: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            decoration:
                                BoxDecoration(color: Colors.black.withOpacity(0)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                ITIcon(
                                  iconName: widget.isFavorite
                                      ? AssetConstants
                                          .icons.favorite_menu_selected
                                      : AssetConstants
                                          .icons.favorite_menu_un_selected,
                                  width: 28,
                                  height: 28,
                                  onPress: () => {
                                    widget.onFavChanged(),
                                  },
                                ),
                                const HorizontalSpace(),
                                DTText(
                                  label: "${widget.favCount}",
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
              Padding(
                padding: const EdgeInsets.only(top: 15, left: 20, right: 5),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DTText(
                        label: widget.ktCardItem.collectionName ?? "NFT Collection Name",
                        style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                        color: Colors.white,
                      ),
                      const VerticalSpace(
                        spaceAmount: 5,
                      ),
                      Row(
                        children: [
                          Center(
                              child: DTText(
                                label: "#NFT Drop",
                                style: context.regular16,
                                color: Colors.grey,
                              ))
                        ],
                      ),
                      const VerticalSpace(
                        spaceAmount: 25,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: DTText(
                          label:
                          widget.ktCardItem.description ?? "Place Holder Place Holder Place Holder Place nolder Place Holder Place Holder",
                          maxLines: 2,
                          style: const TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                      const VerticalSpace(
                        spaceAmount: 20,
                      ),
                      DTText(
                        label: widget.ktCardItem.mintDate == DateTime(2025, 4,4) ? "Mint Date: TBA": "Mint Date: ${widget.ktCardItem.mintDate?.year}/${widget.ktCardItem.mintDate?.month}/${widget.ktCardItem.mintDate?.day}",
                        style: const TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      const VerticalSpace(
                        spaceAmount: 10,
                      ),
                      DTText(
                        label: "Mint Price: ${widget.ktCardItem.mintPrice}",
                        style: const TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      const VerticalSpace(
                        spaceAmount: 20,
                      ),
                      Padding(
                        padding:
                        const EdgeInsets.only(bottom: 10, right: 10, left: 10, top: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            DTTextButton(
                                child: const Text(
                                  "read more",
                                  style: TextStyle(color: Colors.white, fontSize: 14),
                                ),
                                onPress: () {
                                  Get.to(() => EventDetailView(item: widget.ktCardItem,eventId: widget.ktCardItem.eventId ?? ""));
                                }),
                            const HorizontalSpace(
                              spaceAmount: 15,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onFavChange() {
    setState(() {
      widget.isFavorite = !widget.isFavorite;
    });
  }
}
