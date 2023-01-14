import 'dart:core';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:nft_call/core/components/kt_text_button.dart';
import 'package:nft_call/core/constants/extension.dart';
import 'package:nft_call/core/constants/horizontal_space.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nft_call/core/constants/vertical_space.dart';
import 'package:nft_call/view/event_detail/event_detail.dart';
import '../../product/model/nft_info_model.dart';
import '../constants/dt_text.dart';

class CardInfo extends StatefulWidget {
  final KTCardItem? ktCardItem;
  final String currentChip;
  final int index;
  const CardInfo({
    Key? key,
    required this.ktCardItem,
    required this.currentChip,
    required this.index,
  }) : super(key: key);

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
          DTText(
            label: widget.ktCardItem?.collectionName ?? "NFT Collection Name",
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
                label: widget.ktCardItem?.blockchain ?? "#Chain",
                style: context.regular16,
                color: Colors.grey,
              )),
              const HorizontalSpace(
                spaceAmount: 5,
              ),
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
                 widget.ktCardItem?.description ?? "Place Holder Place Holder Place Holder Place nolder Place Holder Place Holder",
              maxLines: 2,
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
          const VerticalSpace(
            spaceAmount: 20,
          ),
          DTText(
            label: "Mint Date: ${widget.ktCardItem?.mintDate}",
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
          const VerticalSpace(
            spaceAmount: 10,
          ),
          DTText(
            label: "Mint Price: ${widget.ktCardItem?.mintPrice}",
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
                      Get.to(() => EventDetailView(ktCardItem: widget.ktCardItem, currentChip: widget.currentChip, index: widget.index));
                    }),
                const HorizontalSpace(
                  spaceAmount: 15,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
