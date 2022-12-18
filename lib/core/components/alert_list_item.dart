import "package:flutter/material.dart";
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:nft_call/core/constants/dt_text.dart';
import 'package:nft_call/core/constants/extension.dart';
import 'package:nft_call/core/constants/horizontal_space.dart';
import 'package:nft_call/core/constants/vertical_space.dart';

class AlertListItem extends StatefulWidget {
  const AlertListItem({Key? key}) : super(key: key);

  @override
  State<AlertListItem> createState() => _AlertListItemState();
}

class _AlertListItemState extends State<AlertListItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const BehindMotion(),
          extentRatio: 0.4,
          children: <Widget>[
            SlidableAction(
              onPressed: (context) {
                // delete item from the list
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
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color(0xf5365470),
          ),
          height: 150,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.network(
                  "https://nftcalendar.io/storage/uploads/events/2022/12/1v6jVJUOdSJgvV2ExCpXzOkktGOOmseW6WOmhfN5.webp"),
              const HorizontalSpace(
                spaceAmount: 15,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        DTText(
                            label: "NFT Collection Name",
                            style: context.regular20,
                            color: Colors.white),
                        const VerticalSpace(
                          spaceAmount: 24,
                        ),
                        DTText(
                            label: "Mint Date",
                            style: context.regular16,
                            color: Colors.white),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
