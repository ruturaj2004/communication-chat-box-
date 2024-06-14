part of 'chats_cubit.dart';

sealed class ChatsState extends Equatable {
  const ChatsState();
  @override
  List<Object> get props => [];
}

final class ChatsInitial extends ChatsState {}

class ChatsLoading extends ChatsState {}

class ChatsLoaded extends ChatsState {
  final ChatsModel? chatsModel;

  const ChatsLoaded({this.chatsModel});
}

class ChatsError extends ChatsState {
  final String? error;
  ChatsError({required this.error});
}
