import 'package:flutter/material.dart';

class CText extends StatelessWidget {
  final String text;
  final FontWeight? fontWeight;
  final double? fontSize;
  final Color? color;
  final TextAlign? textAlign;
  final String? fontFamily;
  final double? height;

  const CText(
    this.text, {
    super.key,
    this.fontWeight,
    this.fontSize,
    this.color,
    this.textAlign,
    this.fontFamily,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        fontWeight: fontWeight,
        fontSize: fontSize,
        color: color,
        fontFamily: fontFamily,
        height: height,
      ),
    );
  }
}
