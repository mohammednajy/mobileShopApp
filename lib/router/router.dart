import 'package:flutter/material.dart';
import 'package:mobile_shop_application/provider/onboarding_provider.dart';
import 'package:mobile_shop_application/router/screen_name.dart';
import 'package:mobile_shop_application/view/auth/login_screen.dart';
import 'package:mobile_shop_application/view/auth/signup_screen.dart';
import 'package:mobile_shop_application/view/onBoarding/onboarding_screen.dart';
import 'package:mobile_shop_application/view/splash/splash_screen.dart';
import 'package:provider/provider.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  dynamic result;
  switch (settings.name) {
    case ScreenName.splashScreen:
      result = const SplashScreen();
      break;
    case ScreenName.onBoardingScreen:
      result = ChangeNotifierProvider(
          create: (context) => OnboardingProvider(),
          child: const OnBoardingScreen());
      break;
    case ScreenName.signUpScreen:
      result = const SignUpScreen();
      break;
    case ScreenName.loginScreen:
      result = const LoginScreen();
      break;
  }

  return MaterialPageRoute(
    builder: (context) => result,
  );
}
