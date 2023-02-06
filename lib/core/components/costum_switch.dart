import 'package:flutter/material.dart';
import 'package:nft_call/core/constants/dt_text.dart';
import '../constants/horizontal_space.dart';

class KTCustomViewSwitch extends StatefulWidget {
  KTCustomViewSwitch({Key? key, this.onPress, required this.isViewSelected, required this.callback})
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
    return GestureDetector(
      onTap: () => {changeState()},
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            DTText(label: "Add Alert", style: TextStyle(color: widget.isViewSelected ? Colors.amber : Colors.blueGrey,),),
            const HorizontalSpace(),
            DTText(label:"My Alert", style:TextStyle(color: widget.isViewSelected ? Colors.blueGrey : Colors.amber,),),
          ],
        ),
      ),
    );
  }

  void changeState() {
    setState(() => {widget.isViewSelected = !widget.isViewSelected, widget.callback(widget.isViewSelected)});
  }
}