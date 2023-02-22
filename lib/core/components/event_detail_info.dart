import 'package:flutter/material.dart';
import 'package:nft_call/core/constants/extension.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../product/model/nft_info_model.dart';
import '../constants/asset.dart';
import '../constants/dt_text.dart';
import '../constants/horizontal_space.dart';
import '../constants/vertical_space.dart';
import 'kt_icon.dart';

class EventDetailInfo extends StatefulWidget {
  bool isAlertIconOn;
  final String currentChip;
  final int index;
  final KTCardItem? ktCardItem;
  final void Function() onAlertChanged;

  EventDetailInfo(
      {this.isAlertIconOn = false,
      required this.ktCardItem,
      required this.onAlertChanged,
      Key? key,
      required this.currentChip,
      required this.index})
      : super(key: key);

  @override
  State<EventDetailInfo> createState() => _EventDetailInfoState();
}

class _EventDetailInfoState extends State<EventDetailInfo> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DTText(
          label: widget.ktCardItem?.collectionName ?? "NFT Collection Name",
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
                  label: "Mint Price :",
                  style: context.semiBold14,
                  color: Colors.white),
              const HorizontalSpace(),
              DTText(
                label: widget.ktCardItem?.mintPrice ?? "00.5 ETH",
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
          spaceAmount: 5,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: DTText(
                label:
                    'If you want to receive notifications from this collection tap the bell!',
                style: context.semiBold14,
                color: Colors.white,
              ),
            ),
            const HorizontalSpace(
              spaceAmount: 10,
            ),
            // bildirim add kısmı ekelencek
            ITIcon(
              iconName: widget.isAlertIconOn
                  ? AssetConstants.icons.added_alarm
                  : AssetConstants.icons.add_alarm,
              width: 50,
              height: 50,
              onPress: () => {
                setState(() {
                  widget.onAlertChanged();
                  widget.isAlertIconOn = !widget.isAlertIconOn;
                })
              },
            ),
            const HorizontalSpace(
              spaceAmount: 10,
            ),
          ],
        ),
        const VerticalSpace(
          spaceAmount: 10,
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
          label: widget.ktCardItem?.description ??
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
                  label: "Mint Date",
                  style: context.semiBold20,
                  color: Colors.white),
              DTText(
                label: widget.ktCardItem?.mintDate.toString() ?? "18:53:13",
                style: context.regular20,
                color: Colors.blue,
              )
            ],
          ),
        ),
        const VerticalSpace(
          spaceAmount: 20,
        ),
        const Opacity(
          opacity: 0.4,
          child: Divider(
            color: Colors.grey,
            thickness: 1.5,
          ),
        ),
        const VerticalSpace(
          spaceAmount: 20,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ITIcon(
              iconName: AssetConstants.icons.discord,
              height: 30,
              width: 30,
              onPress: () => {},
            ),
            ITIcon(
              iconName: AssetConstants.icons.twitter,
              height: 30,
              width: 30,
              onPress: () => {},
            ),
            ITIcon(
              iconName: AssetConstants.icons.marketplace,
              height: 30,
              width: 30,
              color: Colors.white,
              onPress: () => {},
            ),
            ITIcon(
              iconName: AssetConstants.icons.website,
              height: 30,
              width: 30,
              color: Colors.white,
              onPress: () => {},
            ),
          ],
        ),
      ],
    );
  }


  String get getAlertIcon => widget.isAlertIconOn
      ? AssetConstants.icons.added_alarm
      : AssetConstants.icons.add_alarm;
}
