import 'package:flutter/material.dart';
import 'package:nft_call/core/constants/asset.dart';
import 'package:nft_call/core/constants/extension.dart';

import '../constants/dt_text.dart';
import '../constants/horizontal_space.dart';
import 'kt_icon.dart';

class ImageNFT extends StatefulWidget {

  bool isSelected = false;
  final void Function(bool) onFavChanged;

  ImageNFT({
    Key? key,
    this.isSelected = false,
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
        Image.network(
          "https://nftcalendar.io/storage/uploads/events/2022/12/1v6jVJUOdSJgvV2ExCpXzOkktGOOmseW6WOmhfN5.webp",
          fit: BoxFit.cover,
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
