import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'message_list_cubit_state.dart';

class MessageListCubitCubit extends Cubit<MessageListCubitState> {
  MessageListCubitCubit() : super(MessageListCubitInitial());
}
