// ignore_for_file: depend_on_referenced_packages
import 'package:baap_communication_app/app/chats/cubit/chats_cubit.dart';
import 'package:baap_communication_app/app/chats/cubit/get_chat_cubit.dart';
import 'package:baap_communication_app/app/message_list/cubit/latest_chat_cubit.dart';
import 'package:baap_communication_app/app/message_list/cubit/message_list_cubit.dart';
import 'package:baap_communication_app/app/verfiy_token/logic/verify_token_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> blocProvider = [
  BlocProvider(create: (context) => SearchMessageListCubit()),
  BlocProvider(create: (context) => ChatsCubit()),
  BlocProvider(create: (context) => ChatsGetCubit()),
  BlocProvider(create: (context) => SearchMessageListCubit()),
  BlocProvider(create: (context) => VerfiyTokenCubit()),
  BlocProvider(create: (context) => GetLatestMessageCubit()),
];
