import 'package:baap_communication_app/app/chats/views/chats_screen.dart';
import 'package:baap_communication_app/app/message_list/views/message_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Routes {
  static const String splashScreen = '/';
  static const String chatsScreen = '/chats-screen';
  static const String messageListScreen = '/message-list-screen';
  GoRouter get router => _goRouter;

  late final GoRouter _goRouter = GoRouter(
    initialLocation: splashScreen,
    routes: [
      GoRoute(
        path: splashScreen,
        builder: (context, state) => const Text('Text'),
      ),
      GoRoute(
        path: chatsScreen,
        builder: (context, state) =>  MenuDetailScreen(),
      ),
      GoRoute(
        path: messageListScreen,
        builder: (context, state) => const MessageListScreen(),
      ),
    ],
  );
}
