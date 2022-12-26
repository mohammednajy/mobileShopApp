import 'package:flutter/material.dart';

class AssetPath {
  AssetPath._();
  static const String baseImageUrl = 'assets/images/';
  static const String baseIconUrl = 'assets/icons/';

  static const String logoIcon = '${baseIconUrl}logo.svg';
  static const String emailIcon = '${baseIconUrl}email_icon.svg';
  static const String mobileIcon = '${baseIconUrl}mobile_icon.svg';
  static const String passwordIcon = '${baseIconUrl}password_icon.svg';
  static const String userIcon = '${baseIconUrl}user_icon.svg';

  
  static const String onboardingImage1 = '${baseImageUrl}onboarding1.png';
  static const String onboardingImage2 = '${baseImageUrl}onboarding2.png';
  static const String onboardingImage3 = '${baseImageUrl}onboarding3.png';
}

class AppColor {
  AppColor._();

  static const Color sWhite = Color(0xFFECE9F1);
  static const Color gray = Color(0xFF828282);
  static const Color blackDegree = Color(0xFF414138);



}
