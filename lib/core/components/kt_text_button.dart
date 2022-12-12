import 'package:flutter/material.dart';
import 'package:nft_call/core/constants/extension.dart';

class DTTextButton extends StatelessWidget {
  const DTTextButton({Key? key, required this.child, required this.onPress})
      : iconName = null,
        super(key: key);
  const DTTextButton.withIcon(
      {Key? key,
      required this.child,
      required this.onPress,
      this.iconName = "right_arrow_green_small"})
      : super(key: key);
  final VoidCallback? onPress;
  final Widget child;
  final String? iconName;
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 20,
      child: Container(
        decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
            border: Border.all(color: Colors.white),
        ),
        child: TextButton(
            style: TextButton.styleFrom(
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                minimumSize: Size.zero,
                padding: EdgeInsets.zero,
              textStyle: context.regular10
            ),
            onPressed: onPress,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  child,
                ],
              ),
            )),
      ),
    );
  }
}
