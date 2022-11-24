import 'package:flutter/material.dart';
import 'package:mobile_shop_application/router/screen_name.dart';
import 'package:mobile_shop_application/view/onBoarding/onboarding_screen.dart';
import 'package:mobile_shop_application/view/splash/splash_screen.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  var result;
  switch (settings.name) {
    case ScreenName.splashScreen:
      result = SplashScreen();
      break;
    case ScreenName.onBoardingScreen:
      result = OnBoardingScreen();
      break;
  }

  return MaterialPageRoute(
    builder: (context) => result,
  );
}
