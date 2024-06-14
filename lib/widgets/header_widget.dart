import 'package:baap_communication_app/constants/app_enum.dart';
import 'package:baap_communication_app/constants/app_strings.dart';
import 'package:baap_communication_app/widgets/icon_widget.dart';
import 'package:baap_communication_app/widgets/sized_box_widget.dart';
import 'package:baap_communication_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          InkWell(
            onTap: () {
              context.pop();
            },
            child: IconWidget(
            data: AppIcons.backArrow.name,
            height: 40.h,
            width: 40.w,
            ),
          ),
          SizedBoxWidget(
            width: 10,
          ),
          TextWidget(
            text: AppString.communication,
            fontSize: 19.sp,
          ),
        ],
      ),
    );
  }
}
