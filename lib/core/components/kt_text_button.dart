import 'package:flutter/material.dart';

import '../constants/asset.dart';
import '../constants/dimen.dart';
import '../constants/horizontal_space.dart';
import 'kt_icon.dart';


class DTTextButton extends StatelessWidget {
  const DTTextButton({Key? key, required this.child, required this.onPress})
      : iconName = null,
        super(key: key);
  const DTTextButton.withIcon({Key? key, required this.child, required this.onPress, this.iconName = "right_arrow_green_small"})
      : super(key: key);
  final VoidCallback? onPress;
  final Widget child;
  final String? iconName;
  @override
  Widget build(BuildContext context) {
    return TextButton(

        style: TextButton.styleFrom(side: const BorderSide(color: Colors.red, width: 2),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap, minimumSize: Size.zero, padding: EdgeInsets.zero, backgroundColor: Colors.amberAccent),
        onPressed: onPress,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            child,
            const HorizontalSpace(spaceAmount: DimenConstant.SMALL),
            ITIcon(iconName: AssetConstants.icons.drawer_menu),
          ],
        ));
  }
}