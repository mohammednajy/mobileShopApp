import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:mobile_shop_application/data/models/product_model.dart';
import 'package:mobile_shop_application/provider/home_provider.dart';
import 'package:mobile_shop_application/view/app/category/category_screen.dart';
import 'package:mobile_shop_application/view/app/category/product_details_screen.dart';
import 'package:mobile_shop_application/view/app/category/products_screen.dart';
import 'package:mobile_shop_application/view/app/home_app_screen.dart';
import '../data/models/category_model.dart';
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
        result = const SignUpScreen();

        break;
      case ScreenName.loginScreen:
        result = const LoginScreen();

        break;
      case ScreenName.homeScreen:
        result = const HomeAppScreen();
        break;
      case ScreenName.categoryScreen:
        result = const CategoryScreen();
        break;
      case ScreenName.productsScreen:
        result = ProductsScreen(
          category: settings.arguments as CategoryModel,
        );
        break;
      case ScreenName.productDetailsScreen:
        result = ProductDetailsScreen(
          productModel: settings.arguments as ProductModel,
        );
        break;
    }

    return MaterialPageRoute(
      builder: (context) => result,
    );
  }
}
