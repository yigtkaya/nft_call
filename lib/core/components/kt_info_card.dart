import 'dart:core';

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
          child: Visibility(
            visible: true,
            child: Container(
              color: Colors.black.withOpacity(0.6),
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
                    ),
                    DTText(
                        label: widget.mintDate,
                        style: const TextStyle(color: Colors.white)),
                    DTText(
                        label: widget.mintPrice,
                        style: const TextStyle(color: Colors.white)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        DTText(
                            label: widget.totalSupply,
                            style: const TextStyle(color: Colors.white)),
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
                      ],
                    )
                  ],
                ),
              ),
            ),
          )),
    ]);
  }
}
