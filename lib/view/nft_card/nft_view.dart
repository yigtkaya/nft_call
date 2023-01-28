import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nft_call/core/constants/asset.dart';
import 'package:nft_call/core/constants/extension.dart';
import 'package:nft_call/core/constants/theme/theme_manager.dart';
import 'package:nft_call/product/model/nft_info_model.dart';
import '../../core/constants/dt_text.dart';
import '../../core/constants/horizontal_space.dart';
import '../../core/components/card_info.dart';
import '../../core/components/kt_icon.dart';

class NFTCardView extends StatefulWidget {
  final void Function() onFavChanged;
  final KTCardItem ktCardItem;
  final String currentChip;
  final int index;
  bool isFavorite;

  NFTCardView(
      {Key? key,
      required this.onFavChanged,
      required this.ktCardItem,
      required this.isFavorite,
      required this.currentChip,
      required this.index})
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
              Stack(
                children: [
                  CachedNetworkImage(
                    imageUrl: widget.ktCardItem.imageUrl ?? "",
                    fit: BoxFit.cover,
                    placeholder: (context,url) => const Center(child: CircularProgressIndicator(color: Colors.white,)),
                    errorWidget: (context,url,error) => const Icon(Icons.error),
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
                                label: "1.2 M",
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
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 15, left: 20, right: 5),
                  child: CardInfo(
                    ktCardItem: widget.ktCardItem,
                    currentChip: widget.currentChip,
                    index: widget.index,
                  ),
                ),
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
