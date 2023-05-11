import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'constant.dart';

ThemeData lightTheme = ThemeData(
  fontFamily: 'OpenSans',
  // scaffoldBackgroundColor: const Color(0xFFE5E5E5),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
        primary: AppColor.black,
        textStyle: const TextStyle(fontSize: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
        minimumSize: const Size(double.infinity, 44)),
  ),
  appBarTheme: const AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // <-- SEE HERE
      statusBarIconBrightness:
          Brightness.dark, //<-- For Android SEE HERE (dark icons)
      statusBarBrightness: Brightness.light, //<-- For iOS SEE HERE (dark icons)
    ),
  ),
  textTheme: TextTheme(
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
          fontFamily: ''),
      bodySmall: TextStyle(
        color: Colors.green,
        fontWeight: FontWeight.w500,
        fontSize: 14,
      )),
);
