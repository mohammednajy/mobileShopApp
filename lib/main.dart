import 'package:flutter/material.dart';
import 'package:mobile_shop_application/router/router.dart';
import 'package:mobile_shop_application/router/router_services.dart';
import 'package:mobile_shop_application/router/screen_name.dart';
import 'package:mobile_shop_application/utils/theme.dart';

void main(List<String> args) {
  runApp(const MobileShopApp());
}

class MobileShopApp extends StatelessWidget {
  const MobileShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerateRoute,
      initialRoute: ScreenName.onBoardingScreen,
      navigatorKey: AppRouter.navigatorKey,
      theme: lightTheme,
    );
  }
}
