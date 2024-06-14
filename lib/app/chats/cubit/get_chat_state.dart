import 'package:baap_communication_app/app/chats/model/get_chat_model.dart';
import 'package:equatable/equatable.dart';

sealed class ChatGetState extends Equatable {
  const ChatGetState();
  @override
  List<Object> get props => [];
}

final class ChatsGetInitial extends ChatGetState {}

class ChatsGetLoading extends ChatGetState {}

class ChatsGetLoaded extends ChatGetState {
  final ChatGetModel? chatGetModel;

  const ChatsGetLoaded({this.chatGetModel});
}

class ChatsGetError extends ChatGetState {
  final String? error;
  ChatsGetError({required this.error});
}
