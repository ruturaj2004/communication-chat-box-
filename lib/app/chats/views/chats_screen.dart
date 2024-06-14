import 'package:baap_communication_app/app/chats/cubit/chats_cubit.dart';
import 'package:baap_communication_app/app/chats/cubit/get_chat_cubit.dart';
import 'package:baap_communication_app/app/chats/cubit/get_chat_state.dart';
import 'package:baap_communication_app/app/message_list/cubit/latest_chat_cubit.dart';
import 'package:baap_communication_app/constants/app_colors.dart';
import 'package:baap_communication_app/constants/app_enum.dart';
import 'package:baap_communication_app/constants/app_images.dart';
import 'package:baap_communication_app/constants/app_strings.dart';
import 'package:baap_communication_app/utils/preferences/local_preferences.dart';
import 'package:baap_communication_app/utils/routes/routes.dart';
import 'package:baap_communication_app/widgets/divider_widget.dart';
import 'package:baap_communication_app/widgets/icon_widget.dart';
import 'package:baap_communication_app/widgets/linear_gradient_widget.dart';
import 'package:baap_communication_app/widgets/sized_box_widget.dart';
import 'package:baap_communication_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class MenuDetailScreen extends StatefulWidget {
  const MenuDetailScreen({
    super.key,
    this.servicerequestId,
    this.title,
    this.dateTime,
    this.status,
    this.handledById,
    this.groupId,
    this.receiverId,
  });

  final int? servicerequestId;
  final int? handledById;
  final String? title;
  final String? dateTime;
  final String? status;
  final int? groupId;
  final int? receiverId;

  @override
  State<MenuDetailScreen> createState() => _MenuDetailScreenState();
}

final senderId = LocalStorageUtils.tokenResponseModel.userId;

class _MenuDetailScreenState extends State<MenuDetailScreen> {
  @override
  void initState() {
    context
        .read<ChatsGetCubit>()
        .getChats(receiverId: widget.receiverId, senderId: senderId);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: AppColors.backgroundDark,
        body: LinearGradientWidget(
          child: Padding(
            padding: EdgeInsets.all(20.w),
            child: Column(
              children: [
                _headerWidget(context),
                SizedBoxWidget(height: 10.h),
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
    );
  }

  Widget _communicationWidget() {
    final _responseController = TextEditingController();

    return BlocBuilder<ChatsCubit, ChatsState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.only(top: 8.0.w),
          child: Row(
            children: [
              Expanded(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: 150.h,
                  ),
                  child: Scrollbar(
                    child: TextFormField(
                      controller: _responseController,
                      minLines: 1,
                      maxLines: 5,
                      textInputAction: TextInputAction.newline,
                      keyboardType: TextInputType.multiline,
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: AppColors.whiteColor,
                      ),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 10.h,
                          horizontal: 15.w,
                        ),
                        hintText: AppString.enterPhoneNumber,
                        hintStyle: TextStyle(
                          color: AppColors.textGrey.withOpacity(0.6),
                          fontSize: 13.sp,
                        ),
                        filled: true,
                        fillColor: AppColors.backgroundLinear.withOpacity(1),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.r),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBoxWidget(width: 8.w),
              BlocListener<ChatsCubit, ChatsState>(
                listener: (context, state) {
                  if (state is ChatsLoaded) {
                    context.read<ChatsGetCubit>().getChats(
                        receiverId: widget.receiverId, senderId: senderId);
                  }
                },
                child: IconWidget(
                  data: AppIcons.send.name,
                  height: 35.h,
                  width: 35.w,
                  onClick: () {
                    if (_responseController.text.trim().isNotEmpty) {
                      context.read<ChatsCubit>().sendMessage(
                            receiver: widget.title,
                            message: _responseController.text,
                            groupId: widget.groupId,
                            receiverId: widget.receiverId,
                          );
                      _responseController.clear();
                    }
                  },
                ),
              ),
            ],
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
            context.read<GetLatestMessageCubit>().getLatestMessage();
             context.push(Routes.messageListScreen);
           },
          child: IconWidget(
            data: AppIcons.backArrow.name,
            color: AppColors.whiteColor,
            height: 50.h,
            width: 50.w,
          ),
        ),
        SizedBoxWidget(width: 5),
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
                  width: 8.w,
                ),
                TextWidget(
                  text: (widget.title ?? '').isEmpty
                      ? AppString.userName
                      : widget.title ?? "",
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
    return BlocBuilder<ChatsGetCubit, ChatGetState>(
      builder: (context, state) {
        if (state is ChatsGetLoaded) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            child: Column(
              children: [
                Container(
                  constraints: BoxConstraints(
                    maxHeight: 580.h,
                  ),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.chatGetModel?.data?.length ?? 0,
                    itemBuilder: (context, index) {
                      final message = state.chatGetModel?.data?[index];
                      final isOutgoing = message?.senderId == senderId;

                      return Align(
                        alignment: isOutgoing
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 10.h),
                          child: IntrinsicWidth(
                            child: Container(
                              padding: EdgeInsets.all(10.w),
                              decoration: BoxDecoration(
                                color: isOutgoing
                                    ? AppColors.backgroundLinearColor
                                    : AppColors.backgroundLinear,
                                borderRadius:
                                    BorderRadius.circular(10.r).copyWith(
                                  bottomRight: isOutgoing
                                      ? Radius.zero
                                      : Radius.circular(10.r),
                                  bottomLeft: isOutgoing
                                      ? Radius.circular(10.r)
                                      : Radius.zero,
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextWidget(
                                    text: message?.message ?? "",
                                    color: isOutgoing
                                        ? AppColors.whiteColor
                                        : AppColors.whiteColor,
                                    fontSize: 16.sp,
                                    softWrap: true,
                                    maxLines: null,
                                    textOverflow: TextOverflow.visible,
                                  ),
                                  SizedBoxWidget(height: 5.h),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      TextWidget(
                                        text: message?.formattedDateTime ?? "",
                                        color: AppColors.whiteColor
                                            .withOpacity(0.6),
                                        fontSize: 12.sp,
                                        softWrap: true,
                                        maxLines: null,
                                        textOverflow: TextOverflow.visible,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        }
        return SizedBoxWidget();
      },
    );
  }
}
