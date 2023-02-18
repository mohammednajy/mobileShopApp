import 'package:flutter/cupertino.dart';
import '../router/router_services.dart';
import '../router/screen_name.dart';

import '../utils/constant.dart';

class OnboardingProvider with ChangeNotifier {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;
  onboardingIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  void iconButtonClick(PageController controller) {
    selectedIndex == 2
        ? AppRouter.goAndRemove(ScreenName.signUpScreen)
        : controller.nextPage(
            duration: const Duration(seconds: 1), curve: Curves.easeInOut);
    notifyListeners();
  }

  List<OnboardingModel> onboardingContent = [
    OnboardingModel(
        image: AssetPath.onboardingImage1,
        title: 'Get the Best Smartphone ',
        descreption:
            'Lorem Ipsum is simply dummy text of the printing and typesetting..1',
        ),
    OnboardingModel(
        image: AssetPath.onboardingImage2,
        title: 'Great experince with our product',
        descreption:
            'Lorem Ipsum is simply dummy text of the printing and typesetting..2',
       ),
    OnboardingModel(
        image: AssetPath.onboardingImage3,
        title: 'Get product from at home',
        descreption:
            'Lorem Ipsum is simply dummy text of the printing and typesetting..3',
       ),
  ];
}

class OnboardingModel {
  String image;
  String title;
  String descreption;
  
  OnboardingModel(
      {required this.image,
      required this.title,
      required this.descreption,
     });
}
