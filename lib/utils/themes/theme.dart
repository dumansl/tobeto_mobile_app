import 'package:flutter/material.dart';
import 'package:tobeto_mobile_app/utils/constant/constants.dart';

ThemeData lightTheme =
    ThemeData(useMaterial3: true, colorScheme: lightColorScheme);

ThemeData darkTheme =
    ThemeData(useMaterial3: true, colorScheme: darkColorScheme);

ColorScheme lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: TobetoColor.card.cream, //Arka Plan Rengi
  surface: TobetoColor.card.white, //  card rengi
  secondary: TobetoColor.formField.white, // Text Form Field Rengi
  onPrimary: TobetoColor.text.white, // Çerceve Rengi
  onSecondary: TobetoColor.icon.grey, // Icon Rengi
  onSurface: TobetoColor.text.black, // Text Rengi//dashboardtext rengi
  inversePrimary: const Color(0xffb1d18a),
  error: TobetoColor.state.error,
  onError: const Color(0xffffffff),
  onTertiary: TobetoColor.text.lightGrey,
  onSecondaryContainer: TobetoColor.icon.grey,
);

ColorScheme darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: TobetoColor.background.darkGrey, //arka plan rengi
  surface: TobetoColor.card.carddarkmode, //card rengi
  secondary: TobetoColor.card.carddarkmode, // Text Form Field Rengi
  onPrimary: TobetoColor.card.black,
  onSecondary: TobetoColor.icon.black, // Icon Rengi
  onSurface: TobetoColor.text.white, // Text Rengi//dashboardtext rengi
  error: TobetoColor.state.error,
  onError: const Color(0xff690005),
  inversePrimary: const Color(0xff4c662b),
  onTertiary: TobetoColor.text.lightGrey,
  onSecondaryContainer: TobetoColor.card.carddarkmode,
);
