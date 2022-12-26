import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_shop_application/utils/constant.dart';

ThemeData lightTheme = ThemeData(
  fontFamily: 'OpenSans',
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      primary: AppColor.blackDegree,
      textStyle: const TextStyle(fontSize: 20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
      ),
      minimumSize: const Size(double.infinity,44)
    ),
  ),
  appBarTheme: const AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // <-- SEE HERE
      statusBarIconBrightness:
          Brightness.dark, //<-- For Android SEE HERE (dark icons)
      statusBarBrightness: Brightness.light, //<-- For iOS SEE HERE (dark icons)
    ),
  ),
  textTheme: const TextTheme(
      headlineMedium: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 22,
        color: Colors.black,
      ),
      headlineSmall: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 16,
        color: AppColor.gray,
      ),
      headlineLarge: TextStyle(
          fontWeight: FontWeight.w500,
          color: Colors.black,
          fontSize: 40,
          fontFamily: '')),
);
