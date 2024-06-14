import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({
    super.key,
    required this.text,
    this.fontSize,
    this.color,
    this.textAlign,
    this.fontWeight,
    this.letterSpacing,
    this.textOverflow,
    this.softWrap=false,
    this.textDecoration,
     this.maxLines,
  });

  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextDecoration? textDecoration;
  final Color? color;
  final TextAlign? textAlign;
  final double? letterSpacing;
  final TextOverflow? textOverflow;
  final bool softWrap;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      overflow: textOverflow ?? TextOverflow.ellipsis,
      style: TextStyle(
        decoration: textDecoration,
        fontSize: fontSize ?? 12.sp,
        fontWeight: fontWeight,
        color: color ?? Colors.white,
        letterSpacing: letterSpacing,
      ),
      softWrap: softWrap,
    );
  }
}
