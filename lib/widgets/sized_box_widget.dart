import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class SizedBoxWidget extends StatelessWidget {
  SizedBoxWidget({
    Key? key,
    this.width,
    this.height,
    this.child,
  }) : super(key: key);

  final double? width;
  final double? height;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width != null ? width!.w : width,
      height: height != null ? height!.h : height,
      child: child,
    );
  }
}
