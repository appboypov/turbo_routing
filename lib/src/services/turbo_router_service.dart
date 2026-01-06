import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:turbolytics/turbolytics.dart';
import '../enums/turbo_page_transition_type.dart';

/// Abstract base class for router services.
/// Projects should extend this to provide their own route configuration.
abstract class TurboRouterService with Loglytics {
  /// The main GoRouter instance
  GoRouter get router;

  /// Global navigator key for root navigation
  GlobalKey<NavigatorState> get rootNavigatorKey;

  /// Callback for when routes change
  void onRouteChanged({String? location});

  /// Build a page with custom transitions
  Page<T> buildPage<T>({
    required Widget child,
    required GoRouterState state,
    TurboPageTransitionType transitionType = TurboPageTransitionType.platform,
  }) {
    switch (transitionType) {
      case TurboPageTransitionType.platform:
        return MaterialPage<T>(key: state.pageKey, child: child);
      case TurboPageTransitionType.custom:
        return CustomTransitionPage<T>(
          key: state.pageKey,
          child: child,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        );
      case TurboPageTransitionType.modal:
        return MaterialPage<T>(
          key: state.pageKey,
          fullscreenDialog: true,
          child: child,
        );
    }
  }
}

/// Helper class for custom page transitions
class CustomTransitionPage<T> extends Page<T> {
  const CustomTransitionPage({
    required super.key,
    required this.child,
    required this.transitionsBuilder,
  });

  final Widget child;
  final Widget Function(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) transitionsBuilder;

  @override
  Route<T> createRoute(BuildContext context) {
    return PageRouteBuilder<T>(
      settings: this,
      pageBuilder: (context, animation, secondaryAnimation) => child,
      transitionsBuilder: transitionsBuilder,
    );
  }
}
