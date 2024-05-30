import 'package:baap_communication_app/app/chats/cubit/chats_cubit_state.dart';
import 'package:bloc/bloc.dart';
class MessageCubit extends Cubit<MessageState> {
  MessageCubit() : super(MessageState(messages: [], isPostingResponse: false));

  void addMessage(String text) {
    emit(state.copyWith(isPostingResponse: true));

    Future.delayed(const Duration(seconds: 1), () {
      final updatedMessages = List<Map<String, dynamic>>.from(state.messages)
        ..add({
          'text': text,
          'isOutgoing': true,
        });

      emit(state.copyWith(messages: updatedMessages, isPostingResponse: false));
    });
  }
}