import 'package:flutter/material.dart';
import 'package:nft_call/core/components/kt_icon.dart';
import 'package:nft_call/core/constants/asset.dart';
import 'package:nft_call/core/constants/extension.dart';
import '../../../core/constants/dimen.dart';
import '../constants/dt_text.dart';
import '../constants/theme/theme_manager.dart';
import '../constants/vertical_space.dart';

class KTLineItem extends StatelessWidget {
  KTLineItem({
    Key? key,
    this.onCallback,
    required this.selectedIcon,
    required this.description,
  }) : super(key: key);
  final VoidCallback? onCallback;
  final String? description;
  final bool selectedIcon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onCallback,
      child: Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                  width: 1,
                  color: ThemeManager.instance?.getCurrentTheme.colorTheme
                          .menuItemGradientStart ??
                      Colors.white),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
                vertical: DimenConstant.MEDIUM,
                horizontal: DimenConstant.LARGE),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const VerticalSpace(spaceAmount: DimenConstant.SMALL),
                Row(
                  children: [
                    DTText(
                      label: description ?? "",
                      style: context.regular16,
                      maxLines: 2,
                      color: Colors.white,
                    ),
                    const Spacer(),
                    selectedIcon ?
                    ITIcon(iconName: AssetConstants.icons.check_icon, color: Colors.white.withOpacity(0.7), width: 20, height: 20,)
                    : const SizedBox(),
                  ],
                ),
                const VerticalSpace(spaceAmount: DimenConstant.SMALL),
              ],
            ),
          )),
    );
  }
}
