import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:go_router/go_router.dart';
import 'package:zhihu/pages/home/home.dart';

abstract class Route {
  static final rootNavigatorKey = GlobalKey<NavigatorState>();
  static const String home = '/home';
}

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
      initialLocation: Route.home,
      navigatorKey: Route.rootNavigatorKey,
      debugLogDiagnostics: true,
      observers: [
        FlutterSmartDialog.observer
      ],
      routes: [
        GoRoute(
          path: Route.home,
          name: "home",
          pageBuilder: (context, state) => NoTransitionPage(
            key: state.pageKey,
            child: const Home(),
          ),
        ),
      ]);
});
