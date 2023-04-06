import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:mobile_shop_application/provider/home_provider.dart';
import 'package:mobile_shop_application/view/app/home_app_screen.dart';
import '../provider/auth_provider.dart';
import '../provider/onboarding_provider.dart';
import 'screen_name.dart';
import '../view/auth/login_screen.dart';
import '../view/auth/signup_screen.dart';
import '../view/onBoarding/onboarding_screen.dart';
import '../view/splash/splash_screen.dart';
import 'package:provider/provider.dart';

class AppRouterGenerator {
  final AuthProvider authProvider = AuthProvider();
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
        result = ChangeNotifierProvider<AuthProvider>.value(
          value: authProvider,
          child: const SignUpScreen(),
        );
        break;
      case ScreenName.loginScreen:
        result = ChangeNotifierProvider<AuthProvider>.value(
          value: authProvider,
          child: const LoginScreen(),
        );
        break;
      case ScreenName.homeScreen:
        result = MultiProvider(providers: [
          ChangeNotifierProvider(create: (context) => HomeProvider())
        ], child: const HomeAppScreen());
        break;
    }

    return MaterialPageRoute(
      builder: (context) => result,
    );
  }
}
