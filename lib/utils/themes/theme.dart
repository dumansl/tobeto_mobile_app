import 'package:flutter/material.dart';
import 'package:tobeto_mobile_app/utils/constant/constants.dart';

ThemeData lightTheme =
    ThemeData(useMaterial3: true, colorScheme: lightColorScheme);

ThemeData darkTheme =
    ThemeData(useMaterial3: true, colorScheme: darkColorScheme);

ColorScheme lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  surface: TobetoColor.background.white, //Arka Plan Rengi
  primary: TobetoColor.button.white, //  Button Rengi
  onPrimary: TobetoColor.formField.white, // Text Form Field Rengi
  secondary: TobetoColor.frame.lightGrey, // Çerceve Rengi
  onSecondary: TobetoColor.icon.darkGrey, // Icon Rengi
  onSurface: TobetoColor.text.lightGrey, // Text Rengi
  error: const Color(0xffba1a1a),
  onError: const Color(0xffffffff),
);

ColorScheme darkColorScheme = ColorScheme(
  surface: TobetoColor.background.darkGrey,
  primary: TobetoColor.button.darkGrey,
  onPrimary: TobetoColor.formField.darkGrey,
  secondary: TobetoColor.frame.grey,
  onSecondary: TobetoColor.icon.white,
  onSurface: TobetoColor.text.white,
  brightness: Brightness.dark,
  error: const Color(0xffffb4ab),
  onError: const Color(0xff690005),
);
