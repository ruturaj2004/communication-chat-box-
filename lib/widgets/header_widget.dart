import 'package:baap_communication_app/constants/app_colors.dart';
import 'package:baap_communication_app/constants/app_strings.dart';
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
            child: Icon(
              Icons.arrow_back,
              color: AppColors.whiteColor,
              size: 22.sp,
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
