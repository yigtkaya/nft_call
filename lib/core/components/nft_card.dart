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
      padding: const EdgeInsets.all(15),
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
                child: SizedBox(
                  width: 334,
                  height: 344,
                  child: Center(
                    child: AnimatedSize(
                      alignment: Alignment.topCenter,
                        duration: const Duration(milliseconds: 200),
                        child: SizedBox(
                          height: widget.show? null : 0.0,
                          child: InfoCard(
                            title: "NFT Collection Name",
                            mintDate: '22.07.2022 - 30.07.2022',
                            mintPrice: '0.0003 ETH',
                            twitter: 'twitter.com',
                            discord: 'ss',
                            website: '',
                            totalSupply: '1000',
                          ),
                        )),
                  ),
                )),
            Positioned(
              bottom: 5,
              child: InkWell(
                onTap: () => {isSelected = !isSelected, doNothing()},
                child: Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(70),
                    color: const Color(0xFF000000).withOpacity(0.1),
                  ),
                  child: Opacity(
                    opacity: 0.8,
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
