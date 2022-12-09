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
  get isSubscribe => false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(padding: const EdgeInsets.all(20),
          child: !isSubscribe ?
              Opacity(
                opacity: 0.3,
                child: DTText(
                  label:
                  "There is subscription yet.",
                  style: context.semiBold14, color: Colors.white,),
              ) :
          Opacity(
            opacity: 0.3,
            child: DTText(
              label:
              "There is subscription.",
              style: context.semiBold14, color: Colors.white,),
          ),
        ),
      ),
    );
  }

  // subscribe listesi çekilecek çekilebilirse visibilty false olarak atancak
}
