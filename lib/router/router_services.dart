import 'package:flutter/material.dart';

class AppRouter {
  AppRouter._();
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static goAndRemove(String screenName) {
    return navigatorKey.currentState!
        .pushNamedAndRemoveUntil(screenName, (route) => false);
  }

  static goTo(String screenName, {Object? arguments}) {
    return navigatorKey.currentState!.pushNamed(screenName, arguments: arguments);
  }

  static back() {
    return navigatorKey.currentState!.pop();
  }
}
