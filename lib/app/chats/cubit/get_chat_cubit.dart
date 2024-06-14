import 'package:baap_communication_app/app/chats/cubit/get_chat_state.dart';
import 'package:baap_communication_app/app/chats/model/get_chat_model.dart';
import 'package:baap_communication_app/main.dart';
import 'package:baap_communication_app/utils/api/api_base.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatsGetCubit extends Cubit<ChatGetState> {
  final ApiBase _apiBase = ApiBase();

  ChatsGetCubit() : super(ChatsGetInitial()) {}

  void getChats({int? senderId, int? receiverId}) async {
    emit(ChatsGetLoading());
    try {
      await _apiBase.get("${apiEndPoints.getmessage}$senderId/$receiverId",
          (data) {
        var response = ChatGetModel.fromJson(data);
        emit(ChatsGetLoaded(chatGetModel: response));
      }, (error) {
        emit(ChatsGetError(error: error.toString()));
      });
    } catch (e) {
      emit(ChatsGetError(error: e.toString()));
    }
    ;
  }
}
