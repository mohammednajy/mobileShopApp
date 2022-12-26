import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_shop_application/router/router.dart';
import 'package:mobile_shop_application/router/router_services.dart';
import 'package:mobile_shop_application/router/screen_name.dart';
import 'package:mobile_shop_application/utils/responsive.dart';
import 'package:mobile_shop_application/utils/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:device_preview/device_preview.dart';

void main(List<String> args) {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MobileShopApp());
}

class MobileShopApp extends StatelessWidget {
  const MobileShopApp({super.key});

  @override
  Widget build(BuildContext context) {
   
    return DevicePreview(
        enabled: false,
        builder: (context) {
          return ScreenUtilInit(
              designSize: const Size(375, 812),
              minTextAdapt: true,
              splitScreenMode: true,
              builder: (context, child) {
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  onGenerateRoute: onGenerateRoute,
                  initialRoute: ScreenName.signUpScreen,
                  navigatorKey: AppRouter.navigatorKey,
                  theme: lightTheme,
                );
              });
        });
  }
}
