import 'package:bloc/bloc.dart';

class MessageState {
  final List<Map<String, dynamic>> messages;
  final bool isPostingResponse;

  MessageState({
    required this.messages,
    required this.isPostingResponse,
  });

  MessageState copyWith({
    List<Map<String, dynamic>>? messages,
    bool? isPostingResponse,
  }) {
    return MessageState(
      messages: messages ?? this.messages,
      isPostingResponse: isPostingResponse ?? this.isPostingResponse,
    );
  }
}