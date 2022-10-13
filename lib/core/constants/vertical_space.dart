import 'package:flutter/material.dart';

import 'dimen.dart';


class VerticalSpace extends StatelessWidget {
  const VerticalSpace({Key? key, this.spaceAmount = DimenConstant.MEDIUM}) : super(key: key);
  final double spaceAmount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 0,
      height: spaceAmount,
    );
  }

  const VerticalSpace.zero({Key? key, this.spaceAmount = 0}) : super(key: key);
}
