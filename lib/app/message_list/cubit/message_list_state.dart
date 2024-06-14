import 'package:baap_communication_app/app/message_list/model/message_list_model.dart';

abstract class SearchMessageListState {
    List<Datum>? searchMessageList;
  SearchMessageListState({this.searchMessageList});
}

class SearchMessageListInitial extends SearchMessageListState {
  SearchMessageListInitial({super.searchMessageList});
}

class SearchMessageListLoading extends SearchMessageListState {
  SearchMessageListLoading({super.searchMessageList});
}

class SearchMessageListLoaded extends SearchMessageListState {
  SearchMessageListLoaded({super.searchMessageList});
}

class SearchMessageListError extends SearchMessageListState {
  final String? error;
  SearchMessageListError({this.error, super.searchMessageList});
}
