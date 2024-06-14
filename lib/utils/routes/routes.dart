import 'package:baap_communication_app/app/chats/views/chats_screen.dart';
import 'package:baap_communication_app/app/message_list/views/message_list_screen.dart';
import 'package:baap_communication_app/app/unknown.dart';
import 'package:baap_communication_app/app/verfiy_token/view/single_sign_on.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Routes {
  static const String splashScreen = '/';
  static const String chatsScreen = '/chats-screen';
  static const String messageListScreen = '/message-list-screen';
  static const String singleSignOn = '/auth/single-sign-on';
  static const String pageNotFound = '/not-found';

  GoRouter get router => _goRouter;

  late final GoRouter _goRouter = GoRouter (
    initialLocation: singleSignOn,
    routes: [
      GoRoute(
        path: chatsScreen,
        builder: (context, state) => state.extra as MenuDetailScreen,
      ),
      GoRoute(
        path: messageListScreen,
        builder: (context, state) => const MessageListScreen(),
      ),
      GoRoute(
        path: singleSignOn,
        builder: (BuildContext context, GoRouterState state) {
          final uri = state.uri;
          final groupIdStr = uri.queryParameters["groupId"];
          final token = uri.queryParameters["token"];
          final groupId = int.tryParse(groupIdStr ?? '') ?? 0;
          return SingleSignOnScreen(
            groupId: groupId,
            token: token,
          );
        },
      ),
      GoRoute(
        path: pageNotFound,
        builder: (context, state) => const UnknownScreen(),
      )
    ],
    errorPageBuilder: (context, state) => MaterialPage(
      key: state.pageKey,
      child: const UnknownScreen(),
    ),
  );
}
