import 'package:baap_communication_app/app/message_list/cubit/message_list_state.dart';
import 'package:baap_communication_app/app/message_list/model/message_list_model.dart';
import 'package:baap_communication_app/main.dart';
import 'package:baap_communication_app/utils/api/api_base.dart';
import 'package:bloc/bloc.dart';

class SearchMessageListCubit extends Cubit<SearchMessageListState> {
  final ApiBase _apiBase = ApiBase();

  SearchMessageListCubit() : super(SearchMessageListInitial());

  void searchMessageList({String? value, int? groupId}) async {
    try {
      emit(SearchMessageListLoading());
      (
        _apiBase.get(
            "${apiEndPoints.searchMessageList}${apiEndPoints.groupId}?search=$value",
            (data) {
          var jsonData = MessageListResponseModel.fromJson(data);
          emit(
              SearchMessageListLoaded(searchMessageList: jsonData.data));
        }, (error) {
          emit(SearchMessageListError(error: error.toString()));
        }),
      );
    } catch (e) {
      emit(
        SearchMessageListError(
          error: e.toString(),
        ),
      );
    }
  }
 void resetSearch() {
    emit(SearchMessageListInitial());
  }

  clearSearchResults() {
    emit(SearchMessageListInitial());
  }
}
