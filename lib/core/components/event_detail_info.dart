import 'package:flutter/material.dart';
import 'package:nft_call/core/components/costum_switch.dart';
import 'package:nft_call/core/constants/extension.dart';
import '../constants/asset.dart';
import '../constants/dt_text.dart';
import '../constants/horizontal_space.dart';
import '../constants/vertical_space.dart';
import 'kt_icon.dart';

class EventDetailInfo extends StatelessWidget {
  const EventDetailInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DTText(
          label: "NFT Collection Name",
          style: context.semiBold20,
          color: Colors.white,
        ),
        const VerticalSpace(
          spaceAmount: 5,
        ),
        SizedBox(
          width: double.infinity,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              DTText(
                  label: "Remaining time to mint",
                  style: context.semiBold14,
                  color: Colors.white),
              const HorizontalSpace(),
              DTText(
                label: "00.5 ETH",
                style: context.regular20,
                color: Colors.blue,
              ),
            ],
          ),
        ),
        const Opacity(
          opacity: 0.4,
          child: Divider(
            color: Colors.grey,
            thickness: 1.5,
          ),
        ),
        const VerticalSpace(
          spaceAmount: 25,
        ),
        DTText(
          label:
              "Place HolderPlace HolderPlaceHolderPlaceHolHolderPlaceHolderPlaceHolderPlaceHoldelaceHolderlaceHolderlaceHolderlaceHolderlaceHolderlaceHolderlaceHolderrlaceHolderlaceHolderlaceHolderlaceHolderlaceHolderlaceHolderPlaceHolderPlaceHolderPlaceHolderPlaceHolderPlaceHolderPlaceHolderPlacederPlaceHolderPlaceHolderPlace HolderPlace HolderPlace HolderPlace HolderPlace HolderPlace Holder Place Holder",
          style: context.regular16,
          color: Colors.white,
        ),
        const VerticalSpace(
          spaceAmount: 35,
        ),
        SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              DTText(
                  label: "Remaining time to mint",
                  style: context.semiBold20,
                  color: Colors.white),
              DTText(
                label: "18:53:13",
                style: context.regular20,
                color: Colors.blue,
              )
            ],
          ),
        ),
        const VerticalSpace(
          spaceAmount: 40,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    ITIcon(
                      iconName: AssetConstants.icons.discord,
                      height: 30,
                      width: 30,
                    ),
                    const HorizontalSpace(
                      spaceAmount: 5,
                    ),
                    DTText(
                      label: "discord",
                      style: context.regular16,
                      color: Colors.white,
                    ),
                  ],
                ),
                const VerticalSpace(
                  spaceAmount: 15,
                ),
                Row(
                  children: [
                    ITIcon(
                      iconName: AssetConstants.icons.link,
                      height: 30,
                      width: 30,
                      color: Colors.white,
                    ),
                    const HorizontalSpace(
                      spaceAmount: 5,
                    ),
                    DTText(
                      label: "marketplace",
                      style: context.regular16,
                      color: Colors.white,
                    ),
                  ],
                ),
              ],
            ),
            const HorizontalSpace(
              spaceAmount: 50,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    ITIcon(
                      iconName: AssetConstants.icons.twitter,
                      height: 30,
                      width: 30,
                    ),
                    const HorizontalSpace(
                      spaceAmount: 5,
                    ),
                    DTText(
                      label: "twitter",
                      style: context.regular16,
                      color: Colors.white,
                    ),
                  ],
                ),
                const VerticalSpace(
                  spaceAmount: 15,
                ),
                Row(
                  children: [
                    ITIcon(
                      iconName: AssetConstants.icons.website,
                      height: 30,
                      width: 30,
                      color: Colors.white,
                    ),
                    const HorizontalSpace(
                      spaceAmount: 5,
                    ),
                    DTText(
                      label: "website",
                      style: context.regular16,
                      color: Colors.white,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
