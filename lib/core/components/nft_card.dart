import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animated_icon_button/animated_icon_button.dart';
import 'package:nft_call/core/constants/theme/theme_manager.dart';

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
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
      child: Card(
        shadowColor: Colors.purpleAccent,
        elevation: 50,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
            side: const BorderSide(
                color: Colors.black26)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: Stack(
            children: [
              Image.network(
                "https://nftcalendar.io/storage/uploads/events/2022/11/sDcQjGT8XenfEYu1wlbPbm8tvcWlAcpG555GTDGb.webp",
                fit: BoxFit.cover,
              ),
              Visibility(
                visible: widget.show,
                child: Positioned.fill(
                  child: InfoCard(
                    title: "NFT Collection Name",
                    mintDate: '22.07.2022 - 30.07.2022',
                    mintPrice: '0.0003 ETH',
                    twitter: 'twitter.com',
                    discord: 'ss',
                    website: '',
                    totalSupply: '1000',
                  ),
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Opacity(
                  opacity: 0.5,
                  child: AnimatedIconButton(
                    onPressed: () => {isSelected = !isSelected, doNothing()},
                    icons: const [
                      AnimatedIconItem(
                        icon: Icon(
                          Icons.arrow_upward,
                          size: 30,
                        ),
                      ),
                      AnimatedIconItem(
                        icon: Icon(
                          Icons.arrow_downward,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
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
      widget.show = !widget.show;
    });
  }
}
