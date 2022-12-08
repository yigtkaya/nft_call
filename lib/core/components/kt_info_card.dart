import 'dart:core';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:nft_call/view/event_detail/event_detail.dart';

import '../../product/menu/menu_key.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nft_call/core/components/kt_icon.dart';
import 'package:nft_call/core/constants/asset.dart';

import '../constants/dt_text.dart';

class InfoCard extends StatefulWidget {
  InfoCard(
      {Key? key,
      required this.title,
      required this.mintDate,
      required this.mintPrice,
      required this.twitter,
      required this.totalSupply,
      required this.discord,
      required this.website})
      : super(key: key);
  final String title;
  final String mintDate;
  final String mintPrice;
  final String twitter;
  final String totalSupply;
  final String discord;
  final String website;

  @override
  State<InfoCard> createState() => _InfoCardState();
}

class _InfoCardState extends State<InfoCard> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Positioned(
          bottom: -5,
          child: InkWell(
            onTap: () => {
            Get.to(EventDetailView())
            },
            child: Container(
              color: Colors.black.withOpacity(0.65),
              width: 340,
              height: 342,
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    DTText.title(
                      context: context,
                      label: widget.title,
                      color: Colors.white,
                      maxLines: 2,
                    ),
                    const SizedBox(height: 50,),
                    DTText(
                        label: "mint price: ${widget.mintPrice}",
                        style: const TextStyle(color: Colors.white)),
                    const SizedBox(height: 50,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        DTText(
                            label: "mint date: ${widget.mintDate}",
                            style: const TextStyle(color: Colors.white)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ITIcon(
                          iconName: AssetConstants.icons.twitter,
                          height: 26,
                          width: 26,
                        ),
                        ITIcon(
                          iconName: AssetConstants.icons.discord,
                          height: 26,
                          width: 26,
                        ),
                        // web page iconu gelecek
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )),
    ]);
  }
}
