import 'package:flutter/material.dart';
import 'dimen.dart';

class HorizontalSpace extends StatelessWidget {
  const HorizontalSpace({Key? key, this.spaceAmount = DimenConstant.MEDIUM}) : super(key: key);
  final double spaceAmount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: spaceAmount,
      height: 0,
    );
  }
}
