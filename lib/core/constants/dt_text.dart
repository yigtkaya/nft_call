import 'package:flutter/material.dart';

import 'custom_text.dart';

class DTText extends CustomText {
  const DTText({Key? key, required this.label, required this.style, this.color, this.overflow, this.maxLines})
      : super(key: key, label: label, style: style, color: color, overflow: overflow, maxLines: maxLines);
  @override
  final String label;
  @override
  final TextStyle? style;
  @override
  final Color? color;
  @override
  final TextOverflow? overflow;
  @override
  final int? maxLines;

  ///Customized text widget by constructor method
  ///You can add [color] on your text
  /// Title is medium-16
  DTText.title({Key? key, this.color, required BuildContext context, required this.label, this.overflow, this.maxLines})
      : style = Theme.of(context).textTheme.titleMedium,
        super(key: key, label: label, color: color);

  /// headerLarge is bold-20
  DTText.headerLarge(this.label, {Key? key, required BuildContext context, this.color, this.overflow, this.maxLines})
      : style = Theme.of(context).textTheme.headlineLarge,
        super(key: key, label: label, color: color);

  /// headerMedium is bold-16
  DTText.headerMedium(this.label, {Key? key, required BuildContext context, this.color, this.overflow, this.maxLines})
      : style = Theme.of(context).textTheme.headlineMedium,
        super(key: key, label: label, color: color);

  /// bodyMedium is regular-16
  DTText.bodyMedium(this.label, {Key? key, required BuildContext context, this.color, this.overflow, this.maxLines})
      : style = Theme.of(context).textTheme.bodyMedium,
        super(key: key, label: label, color: color);

  /// bodySmall is regular-14
  DTText.bodySmall(this.label, {Key? key, required BuildContext context, this.color, this.overflow, this.maxLines})
      : style = Theme.of(context).textTheme.bodySmall,
        super(key: key, label: label, color: color);

  /// LabelMedium is medium-16
  DTText.input(this.label, {Key? key, required BuildContext context, this.color, this.overflow, this.maxLines})
      : style = Theme.of(context).textTheme.titleMedium,
        super(key: key, label: label, color: color);

  /// LabelMedium is semiBold-16
  DTText.labelMedium(this.label, {Key? key, required BuildContext context, this.color, this.overflow, this.maxLines})
      : style = Theme.of(context).textTheme.labelMedium,
        super(key: key, label: label, color: color);

  /// labelSmall is semiBold-14
  DTText.labelSmall(this.label, {Key? key, required BuildContext context, this.color, this.overflow, this.maxLines})
      : style = Theme.of(context).textTheme.labelSmall,
        super(key: key, label: label, color: color);
}