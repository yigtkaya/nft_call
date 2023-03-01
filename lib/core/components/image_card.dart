import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nft_call/core/constants/asset.dart';
import 'package:nft_call/core/constants/extension.dart';
import '../constants/dt_text.dart';
import '../constants/horizontal_space.dart';
import 'kt_icon.dart';

class ImageNFT extends StatefulWidget {

  bool isSelected;
  final void Function(bool) onFavChanged;
  final String url;
  final int? favCount;
  ImageNFT({
    Key? key,
    required this.url,
    required this.favCount,
    required this.isSelected,
    required this.onFavChanged,
  }) : super(key: key);

  @override
  State<ImageNFT> createState() => _ImageNFTState();
}

class _ImageNFTState extends State<ImageNFT> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CachedNetworkImage(
          imageUrl: widget.url,
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
                      iconName: getFavoriteIcon,
                      width: 28,
                      height: 28,
                      onPress: () =>
                      {
                        changeFavoriteIcon(widget.isSelected),
                        widget.onFavChanged(widget.isSelected)},
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
    );
  }

  void changeFavoriteIcon(bool isSelected) {
    setState(() {
      widget.isSelected = !widget.isSelected;
    });
  }

  String get getFavoriteIcon => widget.isSelected == true
      ? AssetConstants.icons.favorite_menu_selected
      : AssetConstants.icons.favorite_menu_un_selected;
}
