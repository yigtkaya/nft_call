import 'package:cached_network_image/cached_network_image.dart';
import "package:flutter/material.dart";
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:nft_call/core/constants/dt_text.dart';
import 'package:nft_call/core/constants/extension.dart';
import 'package:nft_call/core/constants/horizontal_space.dart';
import 'package:nft_call/core/constants/vertical_space.dart';
import 'package:nft_call/product/model/nft_info_model.dart';

class AlertListItem extends StatefulWidget {
  final KTCardItem ktCardItem;
  final VoidCallback onPress;
  final VoidCallback onDelete;

  const AlertListItem(
      {Key? key,
      required this.ktCardItem,
        required this.onDelete,
      required this.onPress})
      : super(key: key);

  @override
  State<AlertListItem> createState() => _AlertListItemState();
}

class _AlertListItemState extends State<AlertListItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const BehindMotion(),
          extentRatio: 0.4,
          children: <Widget>[
            SlidableAction(
              onPressed: (context) {
                // delete item from the list
                widget.onDelete();
              },
              backgroundColor: Colors.red[900] ?? Colors.red,
              icon: Icons.delete,
              flex: 1,
              padding: const EdgeInsets.all(5),
              borderRadius: BorderRadius.circular(10),
              label: "delete",
            )
          ],
        ),
        child: GestureDetector(
          onTap: () => widget.onPress(),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color(0xf5365470),
            ),
            height: 150,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CachedNetworkImage(
                  imageUrl: widget.ktCardItem.imageUrl ?? "",
                  fit: BoxFit.cover,
                  placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      )),
                  errorWidget: (context, url, error) =>
                  const Icon(Icons.error),
                ),
                const HorizontalSpace(
                  spaceAmount: 15,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DTText(
                            label: widget.ktCardItem.collectionName ?? "NFT Collection Name",
                            style: context.regular16,
                            color: Colors.white),
                        const VerticalSpace(
                          spaceAmount: 24,
                        ),
                        DTText(
                            label: widget.ktCardItem.mintPrice ?? "Mint Price",
                            style: context.regular16,
                            color: Colors.white),
                        const VerticalSpace(
                          spaceAmount: 24,
                        ),
                        DTText(
                            label: widget.ktCardItem.mintDate.toString() ?? "Mint Date",
                            style: context.regular16,
                            color: Colors.white),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
