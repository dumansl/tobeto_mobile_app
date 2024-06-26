import 'package:flutter/material.dart';
import 'package:tobeto_mobile_app/utils/constant/constants.dart';

ThemeData lightTheme = ThemeData(useMaterial3: true, colorScheme: lightColorScheme);

ThemeData darkTheme = ThemeData(useMaterial3: true, colorScheme: darkColorScheme);

ColorScheme lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: TobetoColor.card.cream, //Arka Plan Rengi
  surface: TobetoColor.card.cream, //  card rengi //sayfa renkleri
  secondary: TobetoColor.formField.white, // Text Form Field Rengi
  onPrimary: TobetoColor.text.white, // Çerceve Rengi
  onSecondary: TobetoColor.icon.grey, // Icon Rengi
  onSurface: TobetoColor.text.black, // Text Rengi
  inversePrimary: const Color(0xffb1d18a),
  error: TobetoColor.state.error,
  onError: const Color(0xffffffff),
  onTertiary: TobetoColor.card.grey, //profileditting'te yazılara verildi
  onSecondaryContainer: TobetoColor.icon.grey, //
  shadow: TobetoColor.card.shadowColor,
  primaryContainer: TobetoColor.card.white,
  onPrimaryFixed: TobetoColor.card.black,
  tertiaryContainer: TobetoColor.card.lightPurple, //sss textfield
  tertiaryFixed: TobetoColor.purple, //sss icon
  tertiaryFixedDim: TobetoColor.card.cream.withOpacity(0.35), //sss popup
  tertiary: TobetoColor.card.white,
);

ColorScheme darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: TobetoColor.card.carddarkmode, //arka plan rengi
  surface: TobetoColor.card.carddarkmode, //card rengi
  secondary: TobetoColor.card.carddarkmode, // Text Form Field Rengi
  onPrimary: TobetoColor.card.black,
  onSecondary: TobetoColor.icon.black, // Icon Rengi
  onSurface: TobetoColor.text.white, // Text Rengi//dashboardtext rengi
  error: TobetoColor.state.error,
  onError: const Color(0xff690005),
  inversePrimary: const Color(0xff4c662b),
  onTertiary: TobetoColor.card.grey,
  onSecondaryContainer: TobetoColor.card.carddarkmode,
  shadow: TobetoColor.card.black,
  primaryContainer: TobetoColor.card.carddarkmode,
  onPrimaryFixed: TobetoColor.card.black,
  tertiaryContainer: TobetoColor.purple, //sss textfield
  tertiaryFixed: TobetoColor.icon.white, //sss icon
  tertiaryFixedDim: TobetoColor.card.black,
  tertiary: TobetoColor.card.black,
);
