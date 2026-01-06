import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:turbolytics/turbolytics.dart';
import 'turbo_view_arguments.dart';

abstract class TurboBaseNavigation with Loglytics {
  /// The root path for this navigation group
  String get root;

  /// Navigate to a route
  void go({
    required String location,
    List<TurboViewArguments>? extra,
    BuildContext? context,
    GlobalKey<NavigatorState>? navigatorKey,
  }) {
    log.debug('Going to route: $location');
    final extraArgs = extra?.toExtraArguments;
    if (context != null) {
      context.go(location, extra: extraArgs);
    } else if (navigatorKey != null) {
      navigatorKey.currentContext?.go(location, extra: extraArgs);
    } else {
      throw StateError('Either context or navigatorKey must be provided');
    }
  }

  /// Push a route onto the navigation stack
  Future<T?> push<T>({
    required String location,
    List<TurboViewArguments>? extra,
    BuildContext? context,
    GlobalKey<NavigatorState>? navigatorKey,
  }) {
    log.info('Pushing route: $location');
    final extraArgs = extra?.toExtraArguments;
    if (context != null) {
      return context.push<T>(location, extra: extraArgs);
    } else if (navigatorKey != null) {
      return navigatorKey.currentContext?.push<T>(location, extra: extraArgs) ?? Future<T?>.value(null);
    } else {
      throw StateError('Either context or navigatorKey must be provided');
    }
  }

  /// Replace the current route
  void pushReplacement({
    required String location,
    List<TurboViewArguments>? extra,
    BuildContext? context,
    GlobalKey<NavigatorState>? navigatorKey,
  }) {
    log.info('Pushing replacement route: $location');
    final extraArgs = extra?.toExtraArguments;
    if (context != null) {
      context.pushReplacement(location, extra: extraArgs);
    } else if (navigatorKey != null) {
      navigatorKey.currentContext?.pushReplacement(location, extra: extraArgs);
    } else {
      throw StateError('Either context or navigatorKey must be provided');
    }
  }

  /// Check if the current route can be popped
  bool canPop({
    BuildContext? context,
    GlobalKey<NavigatorState>? navigatorKey,
  }) {
    log.debug('Checking if route can pop');
    if (context != null) {
      return context.canPop();
    } else if (navigatorKey != null) {
      return navigatorKey.currentContext?.canPop() ?? false;
    } else {
      throw StateError('Either context or navigatorKey must be provided');
    }
  }

  /// Pop the current route
  void pop<T>({
    BuildContext? context,
    GlobalKey<NavigatorState>? navigatorKey,
    T? result,
  }) {
    log.debug('Popping route');
    if (context != null) {
      context.pop<T>(result);
    } else if (navigatorKey != null) {
      navigatorKey.currentContext?.pop<T>(result);
    } else {
      throw StateError('Either context or navigatorKey must be provided');
    }
  }
}
