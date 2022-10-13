import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    Key? key,
    required this.label,
    this.style,
    this.color,
    this.overflow,
    this.maxLines,
  }) : super(key: key);
  final String label;
  final TextStyle? style;
  final Color? color;
  final TextOverflow? overflow;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Text(label, style: style?.copyWith(color: color), overflow: overflow, maxLines: maxLines);
  }
}