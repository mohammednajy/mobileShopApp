import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:mobile_shop_application/data/localData/shared_pref.dart';
import 'package:mobile_shop_application/provider/auth_provider.dart';
import 'package:mobile_shop_application/provider/home_provider.dart';
import 'package:mobile_shop_application/utils/locator.dart';
import 'package:provider/provider.dart';
import 'router/router.dart';
import 'router/router_services.dart';
import 'router/screen_name.dart';
import 'utils/helpar.dart';
import 'utils/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  setUp();
  await SharedPrefController().init();
  await EasyLocalization.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
  runApp(
    EasyLocalization(
        path: 'assets/translations',
        supportedLocales: const [
          Locale('en'),
          Locale('ar'),
        ],
        fallbackLocale: const Locale('ar'),
        child: MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => AuthProvider()),
            ChangeNotifierProvider(create: (context) => HomeProvider()),
          ],
          child: const MobileShopApp(),
        )),
  );
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
              onGenerateRoute: AppRouterGenerator().onGenerateRoute,
              navigatorKey: AppRouter.navigatorKey,
              theme: lightTheme,
              scaffoldMessengerKey: UtilsConfig.scaffoldKey,
              supportedLocales: context.supportedLocales,
              localizationsDelegates: context.localizationDelegates,
              locale: context.locale,
              // initialRoute: ScreenName.signUpScreen,
              initialRoute: SharedPrefController().getLogin()
                  ? ScreenName.homeScreen
                  : SharedPrefController().getOnboarding()
                      ? ScreenName.loginScreen
                      : ScreenName.onBoardingScreen,
            );
          },
        );
      },
    );
  }
}
