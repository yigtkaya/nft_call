import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nft_call/core/components/kt_icon.dart';
import 'package:nft_call/core/constants/asset.dart';
import 'package:nft_call/core/constants/dt_text.dart';
import 'package:nft_call/core/constants/extension.dart';
import 'package:nft_call/core/constants/theme/theme_manager.dart';

import '../constants/horizontal_space.dart';
import 'card_info.dart';

class NftCard extends StatefulWidget {
  bool isSelected = false;
  final void Function(bool) onFavChanged;

  NftCard({
    Key? key,
    this.isSelected = false,
    required this.onFavChanged,
  }) : super(key: key);

  @override
  State<NftCard> createState() => _NftCardState();
}

class _NftCardState extends State<NftCard> {
  bool isSelected = false;

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
                color: ThemeManager.instance?.getCurrentTheme.colorTheme.colors.abbey ?? Colors.black,
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
                                    {changeFavoriteIcon(widget.isSelected)},
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
               const Expanded(
                 child:  Padding(
                 padding: EdgeInsets.only(top: 15, left: 20, right: 5),
                 child: CardInfo(
                     mintDate: "27/12/2022 - 03/01/2023",
                     mintPrice: "00.2 ETH",
                     website: "website"),
                    ),
               ),
            ],
          ),
        ),
      ),
    );
  }

  void doNothing() {
    setState(() {
      widget.isSelected = !widget.isSelected;
      widget.onFavChanged(widget.isSelected);
    });
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
