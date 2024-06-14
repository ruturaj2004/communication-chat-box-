import 'package:baap_communication_app/app/chats/model/chats_model.dart';
import 'package:baap_communication_app/main.dart';
import 'package:baap_communication_app/utils/api/api_base.dart';
import 'package:baap_communication_app/utils/preferences/local_preferences.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'chats_state.dart';

class ChatsCubit extends Cubit<ChatsState> {
  final ApiBase _apiBase = ApiBase();

  ChatsCubit() : super(ChatsInitial());

  void sendMessage({
    String? receiver,
    String? message,
    int? groupId,
    int? receiverId,
  }) async {
    final senderId = LocalStorageUtils.tokenResponseModel.userId;
    final handledBy = LocalStorageUtils.tokenResponseModel.name;

    var data = {
      "sender": handledBy,
      "receiver": receiver,
      "message": message,
      "groupId": apiEndPoints.groupId,
      "receiverId": receiverId,
      "senderId": senderId,
    };

    try {
      emit(ChatsLoading());
      _apiBase.post(apiEndPoints.sendMessgeChat, data, (responseData) {
        var response = ChatsModel.fromJson(responseData);
        emit(ChatsLoaded(chatsModel: response));
      }, (error) {
        emit(ChatsError(error: error.toString()));
      });
    } catch (e) {
      emit(ChatsError(error: e.toString()));
    }
  }
}
