import 'package:flutter/material.dart';
import 'package:mobile_shop_application/view/app/home_screen.dart';
import '../provider/auth_provider.dart';
import '../provider/onboarding_provider.dart';
import 'screen_name.dart';
import '../view/auth/login_screen.dart';
import '../view/auth/signup_screen.dart';
import '../view/onBoarding/onboarding_screen.dart';
import '../view/splash/splash_screen.dart';
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
      result = ChangeNotifierProvider(
        create: (context) => AuthProvider(),
        child: const LoginScreen());
      break;
       case ScreenName.homeScreen:
      result = const HomeScreen();
      break;
  }

  return MaterialPageRoute(
    builder: (context) => result,
  );
}
