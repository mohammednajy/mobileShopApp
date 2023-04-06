import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile_shop_application/data/localData/shared_pref.dart';
import '../../router/router_services.dart';
import '../../router/screen_name.dart';
import '../../utils/constant.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 2),
      () => SharedPrefController().getLogin()
          ? AppRouter.goAndRemove(ScreenName.homeScreen)
          : AppRouter.goAndRemove(ScreenName.onBoardingScreen),
    );
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              AssetPath.logoIcon,
              height: 120,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'mobile app',
              style: TextStyle(
                  fontFamily: 'NovaSlim',
                  fontSize: 34,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
