import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ITIcon extends StatelessWidget {
  const ITIcon({Key? key, this.onPress, required this.iconName, this.width, this.height, this.color}) : super(key: key);
  final VoidCallback? onPress;
  final String iconName;
  final double? width;
  final double? height;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: SizedBox(
        height: height,
        width: width,
        child: SvgPicture.asset(
          iconName,
          color: color,
        ),
      ),
    );
  }
}
