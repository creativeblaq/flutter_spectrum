import 'package:flutter/material.dart';
import 'package:flutter_spectrum/enums/enums.dart';
import 'package:flutter_spectrum/extensions/order_details_page.dart';
import 'package:flutter_spectrum/main.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _rootBNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'B');

final routingProvider = Provider((ref) {
  return GoRouter(
    initialLocation: OrderDetailsPage.routeLocation,
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: true,
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          // the UI shell
          return HomeScreen(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              // top route inside branch
              GoRoute(
                path: Enums.routeLocation,
                name: Enums.routeName,
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: Enums(),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _rootBNavigatorKey,
            routes: [
              // top route inside branch
              GoRoute(
                path: OrderDetailsPage.routeLocation,
                name: OrderDetailsPage.routeName,
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: OrderDetailsPage(),
                ),
              ),
            ],
          ),
        ],
      ),
    ],
  );
});
