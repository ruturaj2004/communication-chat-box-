
import 'package:baap_communication_app/app/message_list/model/latest_chat_model.dart';
import 'package:equatable/equatable.dart';

sealed class GetLatestMessageState extends Equatable {
  const GetLatestMessageState();
  @override
  List<Object> get props => [];
}

final class GetLatestMessageInitial extends GetLatestMessageState {}

class GetLatestMessageLoading extends GetLatestMessageState {}

class GetLatestMessageLoaded extends GetLatestMessageState {
  final GetLatestChats? getLatestMessage;

  const GetLatestMessageLoaded({this.getLatestMessage});
}

class GetLatestMessageError extends GetLatestMessageState {
  final String? error;
  GetLatestMessageError({required this.error});
}
