import 'package:flutter/material.dart';
import 'package:nft_call/core/constants/dt_text.dart';
import '../constants/horizontal_space.dart';
import '../constants/theme/color/gradient_colors.dart';

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
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color(0xff364d64),
        ),
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: widget.isViewSelected ? Colors.blue.withOpacity(0.5) : Colors.transparent), child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                child: DTText(label: "Add Alert", style: TextStyle(color: widget.isViewSelected ? Colors.white : Colors.blueGrey,),),
              )),
              Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: widget.isViewSelected ? Colors.transparent : Colors.blue.withOpacity(0.5)),child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                child: DTText(label:"My Alert", style:TextStyle(color: widget.isViewSelected ? Colors.blueGrey : Colors.white,),),
              )),
            ],
          ),
        ),
      ),
    );
  }

  void changeState() {
    setState(() => {widget.isViewSelected = !widget.isViewSelected, widget.callback(widget.isViewSelected)});
  }
}