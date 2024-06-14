import 'package:baap_communication_app/app/message_list/cubit/latest_chat_cubit.dart';
import 'package:baap_communication_app/app/message_list/cubit/latest_chat_state.dart';
import 'package:baap_communication_app/app/message_list/cubit/message_list_cubit.dart';
import 'package:baap_communication_app/app/message_list/cubit/message_list_state.dart';
import 'package:baap_communication_app/constants/app_enum.dart';
import 'package:baap_communication_app/widgets/text_formfiled_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:baap_communication_app/widgets/icon_widget.dart';
import 'package:baap_communication_app/widgets/linear_gradient_widget.dart';
import 'package:baap_communication_app/widgets/sized_box_widget.dart';
import 'package:baap_communication_app/widgets/text_widget.dart';
import 'package:baap_communication_app/app/message_list/model/message_list_model.dart';
import 'package:baap_communication_app/app/chats/views/chats_screen.dart';
import 'package:baap_communication_app/constants/app_colors.dart';
import 'package:baap_communication_app/constants/app_images.dart';
import 'package:baap_communication_app/constants/app_strings.dart';
import 'package:baap_communication_app/utils/routes/routes.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/foundation.dart';
import 'package:skeleton_loader/skeleton_loader.dart';

class MessageListScreen extends StatefulWidget {
  const MessageListScreen({
    Key? key,
    this.servicerequestId,
    this.title,
    this.dateTime,
    this.status,
    this.handledById,
    this.groupId,
  }) : super(key: key);

  final int? servicerequestId;
  final int? handledById;
  final String? title;
  final String? dateTime;
  final String? status;
  final int? groupId;

  @override
  State<MessageListScreen> createState() => _MessageListScreenState();
}

class _MessageListScreenState extends State<MessageListScreen> {
  final TextEditingController nameController = TextEditingController();
  final ValueNotifier<bool> isSearchedNotifier = ValueNotifier<bool>(false);
  final ValueNotifier<bool> showSearchResultsNotifier =
      ValueNotifier<bool>(false);

  @override
  void initState() {
    context.read<GetLatestMessageCubit>().getLatestMessage();
    super.initState();
  }

  @override
  void dispose() {
    isSearchedNotifier.dispose();
    showSearchResultsNotifier.dispose(); // Dispose the ValueNotifier
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async {
          nameController.clear();
          isSearchedNotifier.value = false;
          return true;
        },
        child: LinearGradientWidget(
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBoxWidget(height: 20.h),
                _buildSearchField(),
                SizedBoxWidget(height: 15.h),
                ValueListenableBuilder<bool>(
                  valueListenable: showSearchResultsNotifier,
                  builder: (context, showSearchResults, _) {
                    return showSearchResults
                        ? _buildMessageList()
                        : _messageInfo();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSearchField() {
    return TextFormFieldWidget(
      hintText: AppString.hintText,
      hintTextColor: AppColors.textGrey,
      controller: nameController,
      backgroundColor: AppColors.backgroundLinearColor,
      onChanged: (value) {
        isSearchedNotifier.value = value.isNotEmpty;
        showSearchResultsNotifier.value = value.isNotEmpty;
        if (value.isNotEmpty) {
          context
              .read<SearchMessageListCubit>()
              .searchMessageList(value: value);
        } else {
          context.read<SearchMessageListCubit>().resetSearch();
        }
      },
      suffixIcon: IconWidget(
        data: AppIcons.search.name,
        color: AppColors.textGrey,
        height: 30.h,
        width: 30.w,
      ),
    );
  }

  Widget _buildMessageList() {
    return Expanded(
      child: BlocBuilder<SearchMessageListCubit, SearchMessageListState>(
        builder: (context, state) {
          if (state is SearchMessageListLoading) {
            return _buildSkeletonLoader();
          } else if (state is SearchMessageListLoaded) {
            if (state.searchMessageList != null &&
                state.searchMessageList!.isNotEmpty) {
              return ListView.builder(
                itemCount: state.searchMessageList!.length,
                itemBuilder: (context, index) {
                  final message = state.searchMessageList![index];
                  return _buildMessageItem(message);
                },
              );
            } else {
              return const Center(child: Text('No messages found'));
            }
          } else if (state is SearchMessageListError) {
            return Center(child: Text(state.error.toString()));
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }

  Widget _buildMessageItem(Datum message) {
    return InkWell(
      onTap: () {
        nameController.clear();
        context.read<SearchMessageListCubit>().resetSearch();

        context.push(
          Routes.chatsScreen,
          extra: MenuDetailScreen(
            title: message.name,
            receiverId: message.userId,
          ),
        );
      },
      child: Container(
        color: AppColors.backgroundLinearColor,
        padding: EdgeInsets.all(10.w),
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
            SizedBoxWidget(width: 5.w),
            TextWidget(
              text: message.name ?? "",
              fontSize: 15.sp,
              fontWeight: FontWeight.bold,
              textOverflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSkeletonLoader() {
    return SkeletonLoader(
      builder: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(bottom: 10.w),
            child: Container(
              color: AppColors.backgroundLinearColor,
              padding: EdgeInsets.all(10.w),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20.r),
                    child: Container(
                      color: Colors.grey[300],
                      height: 55.h,
                      width: 60.w,
                    ),
                  ),
                  SizedBoxWidget(width: 10.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 150,
                        height: 20,
                        color: Colors.grey[300],
                      ),
                      SizedBoxWidget(height: 5.h),
                      Container(
                        width: 150,
                        height: 20,
                        color: Colors.grey[300],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _messageInfo() {
    return BlocBuilder<GetLatestMessageCubit, GetLatestMessageState>(
      builder: (context, state) {
        if (state is GetLatestMessageLoading) {
          return _buildSkeletonLoader();
        } else if (state is GetLatestMessageLoaded) {
          return Expanded(
            child: ListView.builder(
              itemCount: state.getLatestMessage?.data?.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(bottom: 10.w),
                  child: InkWell(
                    onTap: () {
                      context.push(
                        Routes.chatsScreen,
                        extra: MenuDetailScreen(
                          title: state.getLatestMessage?.data?[index].receiver,
                          receiverId:
                              state.getLatestMessage?.data?[index].receiverId,
                        ),
                      );
                    },
                    child: Container(
                      color: AppColors.backgroundLinearColor,
                      padding: EdgeInsets.all(10.w),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20.r),
                            child: Image.asset(
                              AppImages.profile,
                              height: 55.h,
                              width: 60.w,
                            ),
                          ),
                          SizedBoxWidget(width: 10.w),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 150,
                                child: TextWidget(
                                  text: state.getLatestMessage?.data?[index]
                                          .receiver ??
                                      "",
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.bold,
                                  textOverflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                              ),
                              Container(
                                width: 150,
                                child: TextWidget(
                                  text: state.getLatestMessage?.data?[index]
                                          .message ??
                                      "",
                                  fontSize: 14.sp,
                                  textOverflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                              ),
                              SizedBoxWidget(height: 3.h),
                              TextWidget(
                                text: state.getLatestMessage?.data?[index]
                                        .formattedDateTime ??
                                    "",
                                fontSize: 12.sp,
                                textOverflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        } else if (state is GetLatestMessageError) {
          return Center(child: Text(state.error.toString()));
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
