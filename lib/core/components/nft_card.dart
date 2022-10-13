import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nft_call/core/components/kt_icon.dart';
import 'package:nft_call/core/constants/asset.dart';
import 'package:nft_call/core/constants/dimen.dart';
import 'package:nft_call/core/constants/dt_text.dart';
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
      padding: const EdgeInsets.all(12),
      child: Card(
        shadowColor: Colors.purpleAccent,
        elevation: 20,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(
                color: ThemeManager.instance?.getCurrentTheme.colorTheme
                        .secondaryScaffoldBackground ??
                    Colors.deepPurple)),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            const Image(
              image: AssetImage("assets/images/nft_2.png"),
              fit: BoxFit.fill,
            ),
            Positioned(
                bottom: 0,
                child: Visibility(
                  visible: widget.show,
                  child: Container(
                    color: Colors.black.withOpacity(0.8),
                    width: 334,
                    height: 344,
                    child: Center(
                      child: InfoCard(title: "NFT Collection Name", mintDate: '22.07.2022 - 30.07.2022', mintPrice: '0.0003 ETH', twitter: 'twitter.com', discord: 'ss', website: '', totalSupply: '1000', ),
                    ),
                  ),
                )),
            Positioned(
              bottom: 5,
              child: InkWell(
                onTap: () => {isSelected = !isSelected, doNothing()},
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color(0xFF000000).withOpacity(0.2),
                    ),
                    child: isSelected
                        ? ITIcon(
                            color: Colors.white,
                            iconName: AssetConstants.icons.down_arrow,
                            width: 40,
                            height: 40,
                          )
                        : ITIcon(
                            color: Colors.white,
                            iconName: AssetConstants.icons.up_arrow,
                            width: 40,
                            height: 40,
                          )),
              ),
            ),
          ],
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
