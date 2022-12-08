import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/components/nft_card.dart';
import '../../core/constants/dimen.dart';

class FavoriteView extends StatefulWidget {
  const FavoriteView({Key? key}) : super(key: key);

  @override
  State<FavoriteView> createState() => _FavoriteViewState();
}

class _FavoriteViewState extends State<FavoriteView> {
  get isFavoriteListEmpty => false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: !isFavoriteListEmpty ? const Center(child: Text("There is no favoirte selected"),) :Center(
          child: Padding(
            padding: const EdgeInsets.all(DimenConstant.MEDIUM),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [getListView(context)],
            ),
          )),

    );
  }

  Widget getListView(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return NftCard(
              show: false,
            );
          }),
    );
  }
}