import 'dart:core';
import 'package:nft_call/core/constants/horizontal_space.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DTText(
            label: "mint date: ${widget.mintDate}",
            style: const TextStyle(color: Colors.white)),
        DTText(
            label: "mintprice:${widget.mintPrice}",
            style: const TextStyle(color: Colors.white, fontSize: 16)),
      ],
    );
  }
}
