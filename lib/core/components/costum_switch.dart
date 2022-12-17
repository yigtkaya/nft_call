import 'package:flutter/material.dart';
import 'package:nft_call/core/constants/extension.dart';

import '../constants/asset.dart';
import '../constants/horizontal_space.dart';
import 'kt_icon.dart';

class ITCustomSwitch extends StatefulWidget {
  ITCustomSwitch({Key? key, this.onPress, this.width, this.height, this.isRadarViewSelected = true, required this.callback})
      : super(key: key);
  final VoidCallback? onPress;
  final double? width;
  final double? height;
  bool isRadarViewSelected;
  void Function(bool) callback;

  @override
  State<ITCustomSwitch> createState() => _ITCustomSwitchState();
}

class _ITCustomSwitchState extends State<ITCustomSwitch> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {changeState()},
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white60,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(40))),
        height: widget.height,
        width: widget.width,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              ITIcon(
                iconName: AssetConstants.icons.notification_on,
                height: 20,
                width: 20,
                color: widget.isRadarViewSelected ? Colors.amber : Colors.blueGrey,
              ),
              const HorizontalSpace(),
              ITIcon(
                iconName: AssetConstants.icons.notification_selected,
                height: 14,
                width: 14,
                color: widget.isRadarViewSelected ? Colors.blueGrey : Colors.amber,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void changeState() {
    setState(() => {widget.isRadarViewSelected = !widget.isRadarViewSelected, widget.callback(widget.isRadarViewSelected)});
  }
}