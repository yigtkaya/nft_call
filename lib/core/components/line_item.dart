import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:nft_call/core/constants/extension.dart';
import '../../../core/constants/dimen.dart';
import '../constants/dt_text.dart';
import '../constants/theme/theme_manager.dart';
import '../constants/vertical_space.dart';

class KTLineItem extends StatelessWidget {
  KTLineItem({
    Key? key,
    this.onCallback,
    required this.name,
    required this.description,
    required this.subDescription,
  }) : super(key: key);
  final VoidCallback? onCallback;
  final String name;
  final String? description;
  final String subDescription;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onCallback,
      child: Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                  width: 1, color: ThemeManager.instance?.getCurrentTheme.colorTheme.menuItemGradientStart ?? Colors.white),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: DimenConstant.MEDIUM, horizontal: DimenConstant.LARGE),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DTText(label: name, style: context.semiBold14),
                const VerticalSpace(spaceAmount: DimenConstant.SMALL),
                DTText(
                  label: description ?? "",
                  style: context.regular12,
                  maxLines: 2,
                ),
                const VerticalSpace(spaceAmount: DimenConstant.SMALL),
                DTText(
                  label: subDescription,
                  style: context.regular12,
                  color: ThemeManager.instance?.getCurrentTheme.colorTheme.menuItemGradientStart ?? Colors.white,
                )
              ],
            ),
          )),
    );
  }
}
