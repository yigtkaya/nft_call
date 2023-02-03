import 'package:flutter/material.dart';
import 'package:nft_call/core/components/kt_text_button.dart';
import 'package:nft_call/core/constants/dt_text.dart';
import 'package:nft_call/core/constants/extension.dart';
import 'package:nft_call/core/constants/theme/styles.dart';

import '../constants/asset.dart';
import '../constants/horizontal_space.dart';
import 'kt_icon.dart';

class KTCustomViewSwitch extends StatefulWidget {
  KTCustomViewSwitch({Key? key, this.onPress, this.isViewSelected = true, required this.callback})
      : super(key: key);

  final VoidCallback? onPress;
  bool isViewSelected;
  void Function(bool) callback;

  @override
  State<KTCustomViewSwitch> createState() => _KTCustomViewSwitchState();
}

class _KTCustomViewSwitchState extends State<KTCustomViewSwitch> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          TextButton(onPressed: () {changeState();}, child: Text("Add Alert", style:TextStyle(color: widget.isViewSelected ? Colors.amber : Colors.blueGrey,),),),
          const HorizontalSpace(),
          TextButton(onPressed: () {changeState();}, child: Text("My Alert", style:TextStyle(color: widget.isViewSelected ? Colors.blueGrey : Colors.amber,),),)            ],
      ),
    );
  }

  void changeState() {
    setState(() => {widget.isViewSelected = !widget.isViewSelected, widget.callback(widget.isViewSelected)});
  }
}