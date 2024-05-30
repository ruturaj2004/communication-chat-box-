import 'package:baap_communication_app/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({
    Key? key,
     this.context,
    this.padding,
    this.color,
    this.height,
  }) : super(key: key);

  final BuildContext? context;
  final EdgeInsetsGeometry? padding;
  final Color? color;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Container(
        width: double.infinity,
        height: height?.h ?? 1,
        color: color ?? AppColors.dividerColor,
      ),
    );
  }
}
