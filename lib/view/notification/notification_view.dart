import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nft_call/core/constants/dimen.dart';
import 'package:nft_call/core/constants/dt_text.dart';
import 'package:nft_call/core/constants/extension.dart';

class NotificationView extends StatefulWidget {
  const NotificationView({Key? key}) : super(key: key);

  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DTText(
                  label:
                      "Alert me when selected NFT collection is going to be online",
                  style: context.semiBold14, color: Colors.white,)
            ],
          ),
        ),
      ),
    );
  }
}
