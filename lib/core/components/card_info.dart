import 'dart:core';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:nft_call/core/components/kt_text_button.dart';
import 'package:nft_call/core/constants/horizontal_space.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nft_call/core/constants/vertical_space.dart';
import 'package:nft_call/view/event_detail/event_detail.dart';
import '../constants/dt_text.dart';

class CardInfo extends StatefulWidget {
  const CardInfo(
      {Key? key,
      required this.mintDate,
      required this.mintPrice,
      required this.website})
      : super(key: key);
  final String mintDate;
  final String mintPrice;
  final String website;

  @override
  State<CardInfo> createState() => _CardInfoState();
}

class _CardInfoState extends State<CardInfo> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const DTText(
            label:
                "Place Holder Place Holder Place Holder Place Holder Place Holder Place Holder",
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          const VerticalSpace(
            spaceAmount: 20,
          ),
          DTText(
            label: "Mint Date: ${widget.mintDate}",
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
          DTText(
            label: "Mint Price: ${widget.mintPrice}",
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              DTTextButton(
                  child: const Text("read more", style: TextStyle(color: Colors.white, fontSize: 14),),
                  onPress: () {
                    Get.to(EventDetailView());
                  }),
              const HorizontalSpace(spaceAmount: 15,)
            ],
          )
        ],
      ),
    );
  }
}
