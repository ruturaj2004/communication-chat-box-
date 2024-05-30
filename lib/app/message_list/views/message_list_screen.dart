import 'package:baap_communication_app/constants/app_enum.dart';
import 'package:baap_communication_app/widgets/icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:baap_communication_app/constants/app_colors.dart';
import 'package:baap_communication_app/constants/app_images.dart';
import 'package:baap_communication_app/constants/app_strings.dart';
import 'package:baap_communication_app/widgets/divider_widget.dart';
import 'package:baap_communication_app/widgets/header_widget.dart';
import 'package:baap_communication_app/widgets/linear_gradient_widget.dart';
import 'package:baap_communication_app/widgets/sized_box_widget.dart';
import 'package:baap_communication_app/widgets/text_formfiled_widget.dart';
import 'package:baap_communication_app/widgets/text_widget.dart';

class MessageListScreen extends StatefulWidget {
  const MessageListScreen({super.key});

  @override
  State<MessageListScreen> createState() => _MessageListScreenState();
}

class _MessageListScreenState extends State<MessageListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LinearGradientWidget(
        child: Container(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.all(20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HeaderWidget(),
                SizedBoxWidget(
                  height: 10.h,
                ),
                DividerWidget(
                  context: context,
                  height: 2.h,
                ),
                SizedBoxWidget(
                  height: 7.h,
                ),
                 TextFormFieldWidget(
                  hintText: AppString.hintText,
                  hintTextColor: AppColors.textGrey,
                  backgroundColor: AppColors.backgroundLinearColor,
                  suffixIcon: IconWidget(
                   data: AppIcons.search.name,
                    color: AppColors.textGrey,
                    height: 30,
                    width: 30,
                  ),
                ),
                SizedBoxWidget(
                  height: 15.h,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: 20,
                    itemBuilder: (context, index) {
                      return _messageListWidget();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _messageListWidget() {
    return Column(
      children: [
        Container(
          color: AppColors.backgroundLinearColor,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20.r),
                  child: Image.asset(
                    AppImages.profile,
                    height: 60.h,
                    width: 65.w,
                  ),
                ),
                SizedBoxWidget(
                  width: 5.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                      text: AppString.userName,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    TextWidget(
                      text: AppString.messageDiscription,
                      fontSize: 15.sp,
                      textOverflow: TextOverflow.ellipsis,
                    ),
                    SizedBoxWidget(
                      height: 5.h,
                    ),
                    Row(
                      children: [
                        TextWidget(
                          text: AppString.date,
                          fontSize: 13.sp,
                        ),
                        SizedBoxWidget(
                          width: 5.w,
                        ),
                        TextWidget(
                          text: AppString.time,
                          fontSize: 13.sp,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBoxWidget(
          height: 10.h,
        ),
      ],
    );
  }
}
