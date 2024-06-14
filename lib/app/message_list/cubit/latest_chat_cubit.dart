import 'package:baap_communication_app/app/message_list/cubit/latest_chat_state.dart';
import 'package:baap_communication_app/app/message_list/model/latest_chat_model.dart';
import 'package:baap_communication_app/main.dart';
import 'package:baap_communication_app/utils/api/api_base.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetLatestMessageCubit extends Cubit<GetLatestMessageState> {
  final ApiBase _apiBase = ApiBase();

  GetLatestMessageCubit() : super(GetLatestMessageInitial()) {}

  void getLatestMessage({int? senderId, int? receiverId}) async {
    emit(GetLatestMessageLoading());
    try {
      await _apiBase.get("${apiEndPoints.getLastMessageAndMember}",
          (data) {
        var response = GetLatestChats.fromJson(data);
        emit(GetLatestMessageLoaded(getLatestMessage: response));
      }, (error) {
        emit(GetLatestMessageError(error: error.toString()));
      });
    } catch (e) {
      emit(GetLatestMessageError(error: e.toString()));
    }
    ;
  }
}
