import 'package:flutter/material.dart';

class AppRouter {
  AppRouter._();
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static goAndRemove(String screenName) {
    return navigatorKey.currentState!
        .pushNamedAndRemoveUntil(screenName, (route) => false);
  }
}
