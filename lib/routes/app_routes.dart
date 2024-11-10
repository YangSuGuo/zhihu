import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:go_router/go_router.dart';
import 'package:page_route_animator/page_route_animator.dart';
import 'package:zhihu/db/database/entity/stars.dart';
import 'package:zhihu/model/commentsinfo_model.dart';
import 'package:zhihu/model/stories_model.dart';
import 'package:zhihu/pages/about/about_section.dart';
import 'package:zhihu/pages/body_content/body_content.dart';
import 'package:zhihu/pages/comments/comments.dart';
import 'package:zhihu/pages/history_favorites/history_favorites.dart';
import 'package:zhihu/pages/home/home.dart';

abstract class RoutePath {
  static final rootNavigatorKey = GlobalKey<NavigatorState>();
  static const String home = '/';
  static const String bodyContent = 'bodyContent';
  static const String comments = 'comments';
  static const String historyFavorites = 'historyFavorites';
  static const String about = 'about';
}

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
      initialLocation: RoutePath.home,
      navigatorKey: RoutePath.rootNavigatorKey,
      debugLogDiagnostics: true,
      observers: [
        FlutterSmartDialog.observer
      ],
      routes: [
        GoRoute(
            path: RoutePath.home,
            name: "home",
            pageBuilder: (context, state) => NoTransitionPage(
                  key: state.pageKey,
                  child: const Home(),
                ),
            routes: [
              GoRoute(
                  path: "${RoutePath.bodyContent}/:id",
                  name: RoutePath.bodyContent,
                  pageBuilder: (context, state) {
                    final id = state.pathParameters["id"].toString();
                    final Stars stars;
                    if (state.extra is StoriesData) {
                      final StoriesData item = state.extra as StoriesData;
                      stars = item.toStars(DateTime.now().toString());
                    } else {
                      stars = state.extra as Stars;
                    }
                    return CustomTransitionPage(
                      key: state.pageKey,
                      barrierDismissible: true,
                      transitionDuration: const Duration(milliseconds: 300),
                      reverseTransitionDuration: const Duration(milliseconds: 300),
                      transitionsBuilder: (context, animation, secondaryAnimation, child) {
                        return PageRouteAnimator(
                          child: child,
                          routeAnimation: RouteAnimation.rightToLeft,
                          curve: Curves.linear,
                          duration: const Duration(milliseconds: 300),
                          reverseDuration: const Duration(milliseconds: 300),
                        ).buildTransitions(context, animation, secondaryAnimation, child);
                      },
                      child: BodyContent(id: id, stars: stars),
                    );
                  }),
              GoRoute(
                  path: "${RoutePath.comments}/:id",
                  name: RoutePath.comments,
                  pageBuilder: (context, state) {
                    final id = state.pathParameters["id"].toString();
                    final CommentInfoData comments = state.extra as CommentInfoData;
                    return CustomTransitionPage(
                      key: state.pageKey,
                      barrierDismissible: true,
                      transitionDuration: const Duration(milliseconds: 200),
                      reverseTransitionDuration: const Duration(milliseconds: 200),
                      transitionsBuilder: (context, animation, secondaryAnimation, child) {
                        return PageRouteAnimator(
                          child: child,
                          routeAnimation: RouteAnimation.bottomToTop,
                          curve: Curves.linear,
                          duration: const Duration(milliseconds: 200),
                          reverseDuration: const Duration(milliseconds: 200),
                        ).buildTransitions(context, animation, secondaryAnimation, child);
                      },
                      child: Comments(id: id, comments: comments),
                    );
                  }),
              GoRoute(
                  path: "${RoutePath.historyFavorites}/:title",
                  name: RoutePath.historyFavorites,
                  pageBuilder: (context, state) {
                    final title = state.pathParameters["title"].toString();
                    return CustomTransitionPage(
                      key: state.pageKey,
                      barrierDismissible: true,
                      transitionDuration: const Duration(milliseconds: 300),
                      reverseTransitionDuration:
                          const Duration(milliseconds: 300),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        return PageRouteAnimator(
                          child: child,
                          routeAnimation: RouteAnimation.rightToLeft,
                          curve: Curves.linear,
                          duration: const Duration(milliseconds: 300),
                          reverseDuration: const Duration(milliseconds: 300),
                        ).buildTransitions(
                            context, animation, secondaryAnimation, child);
                      },
                      child: HistoryFavorites(title: title),
                    );
                  }),
              GoRoute(
                  path: RoutePath.about,
                  name: RoutePath.about,
                  pageBuilder: (context, state) {
                    return CustomTransitionPage(
                      key: state.pageKey,
                      barrierDismissible: true,
                      transitionDuration: const Duration(milliseconds: 300),
                      reverseTransitionDuration:
                          const Duration(milliseconds: 300),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        return PageRouteAnimator(
                          child: child,
                          routeAnimation: RouteAnimation.rightToLeft,
                          curve: Curves.linear,
                          duration: const Duration(milliseconds: 300),
                          reverseDuration: const Duration(milliseconds: 300),
                        ).buildTransitions(
                            context, animation, secondaryAnimation, child);
                      },
                      child: AboutSection(),
                    );
                  }),
            ])
      ]);
});
