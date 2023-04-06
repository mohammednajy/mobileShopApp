import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../data/localData/shared_pref.dart';
import '../../router/router_services.dart';
import '../../router/screen_name.dart';
import '../../utils/constant.dart';
import 'package:provider/provider.dart';

import '../../provider/onboarding_provider.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController controller = PageController();
  @override
  void initState() {
    super.initState();
    controller = PageController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<OnboardingProvider>(
        builder: (context, onboarding, child) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 5,
              child: PageView.builder(
                controller: controller,
                onPageChanged: (value) => onboarding.onboardingIndex(value),
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (context, index) => Image.asset(
                  onboarding.onboardingContent[index].image,
                  fit: BoxFit.none,
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      3,
                      (index) => Container(
                        margin: const EdgeInsets.symmetric(horizontal: 3),
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                          color: index == onboarding.selectedIndex
                              ? Colors.green
                              : AppColor.sWhite,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    onboarding
                        .onboardingContent[onboarding.selectedIndex].title,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.only(start: 25, end: 25),
                    child: Text(
                      onboarding.onboardingContent[onboarding.selectedIndex]
                          .descreption,
                      style: Theme.of(context).textTheme.headlineSmall,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  onboarding.selectedIndex != 2
                      ? IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            onboarding.iconButtonClick(controller);
                          },
                          icon: const CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.green,
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                            ),
                          ))
                      : ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.green,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(22),
                            ),
                            minimumSize: Size(
                              140.w,
                              42.h,
                            ),
                          ),
                          onPressed: () {
                            SharedPrefController().setOnboarding();
                            AppRouter.goAndRemove(ScreenName.signUpScreen);
                          },
                          child: const Text(
                            'Get started',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
