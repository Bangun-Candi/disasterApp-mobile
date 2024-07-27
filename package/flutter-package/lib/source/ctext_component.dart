import 'package:flutter/material.dart';
import 'package:flutter_package/utils/ccolor_utils.dart';

class CText extends StatelessWidget {
  const CText({
    super.key,
    required this.text,
    this.fontSize,
    this.fontWeight,
    this.fontStyle,
    this.textColor,
    this.decoration,
    this.textAlign,
  });

  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final Color? textColor;
  final TextDecoration? decoration;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: fontSize ?? 13,
        fontWeight: fontWeight ?? FontWeight.w400,
        fontStyle: fontStyle ?? FontStyle.normal,
        color: textColor ?? CColorUtils.titleTextColor,
        decoration: decoration,
      ),
    );
  }
}
