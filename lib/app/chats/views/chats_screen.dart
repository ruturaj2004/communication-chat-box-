import 'dart:developer';
import 'package:baap_communication_app/app/chats/cubit/chats_cubit_cubit.dart';
import 'package:baap_communication_app/app/chats/cubit/chats_cubit_state.dart';
import 'package:baap_communication_app/constants/app_colors.dart';
import 'package:baap_communication_app/constants/app_enum.dart';
import 'package:baap_communication_app/constants/app_images.dart';
import 'package:baap_communication_app/constants/app_strings.dart';
import 'package:baap_communication_app/widgets/divider_widget.dart';
import 'package:baap_communication_app/widgets/icon_widget.dart';
import 'package:baap_communication_app/widgets/linear_gradient_widget.dart';
import 'package:baap_communication_app/widgets/sized_box_widget.dart';
import 'package:baap_communication_app/widgets/text_formfiled_widget.dart';
import 'package:baap_communication_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class MenuDetailScreen extends StatelessWidget {
  const MenuDetailScreen({
    super.key,
    this.servicerequestId,
    this.title,
    this.dateTime,
    this.status,
    this.handledById,
  });

  final int? servicerequestId;
  final int? handledById;
  final String? title;
  final String? dateTime;
  final String? status;

  @override
  Widget build(BuildContext context) {
    log(servicerequestId.toString());

    return BlocProvider(
      create: (_) => MessageCubit(),
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: AppColors.backgroundDark,
          body: LinearGradientWidget(
            child: Padding(
              padding: EdgeInsets.all(20.w),
              child: Column(
                children: [
                  _headerWidget(context),
                  SizedBox(height: 10.h),
                  const DividerWidget(
                    height: 0.1,
                    color: AppColors.dividerColor,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: _contentWidget(),
                    ),
                  ),
                  _communicationWidget(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _communicationWidget() {
    final _responseController = TextEditingController();

    return BlocBuilder<MessageCubit, MessageState>(
      builder: (context, state) {
        return TextFormFieldWidget(
          controller: _responseController,
          textColor: Colors.white,
          backgroundColor: AppColors.backgroundLinear.withOpacity(1),
          hintText: AppString.enterPhoneNumber,
          hintTextColor: AppColors.textGrey.withOpacity(0.6),
          fontSize: 13.sp,
          suffixIcon: IconWidget(
            data: AppIcons.send.name,
            height: 50,
            width: 50,
            onClick: state.isPostingResponse
                ? null
                : () {
                    if (_responseController.text.trim().isNotEmpty) {
                      context
                          .read<MessageCubit>()
                          .addMessage(_responseController.text.trim());
                      _responseController.clear();
                    }
                  },
          ),
        );
      },
    );
  }

  Widget _headerWidget(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            context.pop();
          },
          child: IconWidget(
            data: AppIcons.backArrow.name,
            color: AppColors.whiteColor,
            height: 50.h,
            width: 50.w,
          ),
        ),
        SizedBox(width: 10.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.r),
                  child: Image.asset(
                    AppImages.profile,
                    height: 40.h,
                    width: 40.w,
                  ),
                ),
                SizedBoxWidget(
                  width: 3.w,
                ),
                TextWidget(
                  text: (title ?? '').isEmpty ? AppString.userName : title!,
                  fontSize: 19.sp,
                  color: AppColors.whiteColor,
                  textOverflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _contentWidget() {
    return BlocBuilder<MessageCubit, MessageState>(
      builder: (context, state) {
        return state.messages.isNotEmpty
            ? Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                child: Column(
                  children: [
                    SizedBox(
                      height: 580.h,
                      child: ListView.builder(
                        itemCount: state.messages.length,
                        itemBuilder: (context, index) {
                          final message = state.messages[index];
                          final isOutgoing = message['isOutgoing'];

                          return Align(
                            alignment: isOutgoing
                                ? Alignment.centerRight
                                : Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.only(bottom: 10.h),
                              child: Container(
                                padding: EdgeInsets.all(10.r),
                                decoration: BoxDecoration(
                                  color: isOutgoing
                                      ? AppColors.backgroundLinearColor
                                      : AppColors.whiteColor,
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                                child: TextWidget(
                                  text: message['text'],
                                  color: isOutgoing
                                      ? AppColors.whiteColor
                                      : AppColors.backgroundDark,
                                  fontSize: 16.sp,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              )
            : Padding(
                padding: const EdgeInsets.symmetric(vertical: 350),
                child: Column(
                  children: [
                    IconWidget(
                      data: AppIcons.message.name,
                      color: AppColors.textGrey,
                      height: 80,
                      width: 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(),
                      child: TextWidget(
                        text: AppString.noCommunication,
                        color: AppColors.textGrey,
                        fontSize: 16.sp,
                      ),
                    ),
                  ],
                ),
              );
      },
    );
  }
}
