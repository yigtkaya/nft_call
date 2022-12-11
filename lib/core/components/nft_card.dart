import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animated_icon_button/animated_icon_button.dart';
import 'package:nft_call/core/components/kt_icon.dart';
import 'package:nft_call/core/constants/asset.dart';
import 'package:nft_call/core/constants/dt_text.dart';
import 'package:nft_call/core/constants/extension.dart';
import 'package:nft_call/core/constants/theme/theme_manager.dart';
import 'package:nft_call/core/constants/vertical_space.dart';

import '../constants/horizontal_space.dart';
import 'card_info.dart';
import 'kt_info_card.dart';

class NftCard extends StatefulWidget {
  bool show = false;

  NftCard({Key? key, this.show = false}) : super(key: key);

  @override
  State<NftCard> createState() => _NftCardState();
}

class _NftCardState extends State<NftCard> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(15),
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              color: Colors.black,
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      "https://nftcalendar.io/storage/uploads/2022/12/05/the-apes-official-1_Hu707baN5HCyNfYx.jpg",
                      fit: BoxFit.fill,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5, right: 5, top: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ITIcon(iconName: AssetConstants.icons.cross),
                        ITIcon(iconName: AssetConstants.icons.website)
                      ],
                    ),
                  )
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20, top: 20),
                child: DTText(
                  label: "NFT Collection Name",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15, left: 20),
                child: Row(
                  children: [
                    Center(
                        child: DTText(
                      label: "#Chain",
                      style: context.regular16,
                      color: Colors.grey,
                    )),
                    const HorizontalSpace(
                      spaceAmount: 10,
                    ),
                    Center(
                        child: DTText(
                      label: "#NFT Drop",
                      style: context.regular16,
                      color: Colors.grey,
                    ))
                  ],
                ),
              ),
              const Padding(padding: EdgeInsets.all(10),child: CardInfo(mintDate: "27/12/2022 - 03/01/2023", mintPrice: "00.2 ETH", website: "website"))
            ],
          ),
        ));
  }

  void doNothing() {
    setState(() {
      widget.show = !widget.show;
    });
  }
}
