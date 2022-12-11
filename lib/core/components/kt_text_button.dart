import 'package:flutter/material.dart';

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
    return Container(
      decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(14),
          border: Border.all(color: Colors.white),
        gradient:  const LinearGradient(colors: [ Color(0xff16161f), Color(0xff364d64)],
          begin: Alignment.bottomLeft,
          end: Alignment.topCenter,
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0xff16164f),
            offset: Offset(0.0, 1),
            blurRadius: 5,
          ),
        ],
      ),
      child: TextButton(
          style: TextButton.styleFrom(
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              minimumSize: Size.zero,
              padding: EdgeInsets.zero,),
          onPressed: onPress,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                child,
              ],
            ),
          )),
    );
  }
}
