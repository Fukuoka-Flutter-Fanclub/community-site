import 'package:flutter/material.dart';
import 'package:fukuoka_flutter_fanclub/features/event/ui/event_page.dart';
import 'package:fukuoka_flutter_fanclub/features/game/ui/game_page.dart';
import 'package:fukuoka_flutter_fanclub/features/home/ui/home_page.dart';
import 'package:fukuoka_flutter_fanclub/features/nav/ui/nav_page.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final routerProvider = Provider((ref) {
  return GoRouter(
    debugLogDiagnostics: true,
    initialLocation: HomePage.routeName,
    redirect: (context, state) {
      return null;
    },
    // refreshListenable: ValueNotifier(ref.watch(authRepositoryProvider)),
    routes: [
      ShellRoute(
        builder: (_, GoRouterState state, child) {
          return NavPage(
            path: state.fullPath!,
            child: child,
          );
        },
        routes: [
          GoRoute(
            path: HomePage.routeName,
            name: HomePage.routeName,
            pageBuilder: (BuildContext context, GoRouterState state) =>
                NoTransitionPage(
              key: state.pageKey,
              child: const HomePage(),
            ),
          ),
          GoRoute(
            path: EventPage.routeName,
            name: EventPage.routeName,
            pageBuilder: (BuildContext context, GoRouterState state) =>
                NoTransitionPage(
              key: state.pageKey,
              child: const EventPage(),
            ),
          ),
          GoRoute(
            path: GamePage.routeName,
            name: GamePage.routeName,
            pageBuilder: (BuildContext context, GoRouterState state) =>
                NoTransitionPage(
              key: state.pageKey,
              child: const GamePage(),
            ),
          ),
        ],
      ),
    ],
    errorPageBuilder: (context, state) => NoTransitionPage<void>(
      key: state.pageKey,
      child: Container(),
    ),
  );
});
