import 'package:flutter/material.dart';

class StateColor {
  final Color error = const Color(0xFFFF0000);
  final Color warning = const Color(0xFFEBD514);
  final Color success = const Color(0xFF24DA69);
}

class BackgroundColor {
  final Color white = Colors.white;
  final Color darkGrey = const Color(0xff212529);
}

class CardColor {
  final Color white = Colors.white;
  final Color black = Colors.black;
  final Color grey = Colors.grey;
  final Color lightGrey = const Color(0xffCCCCCC);
  final Color darkGrey = const Color(0xff1E1E1E);
  final Color lightGreen = const Color(0xff00956E);
  final Color darkGreen = const Color(0xFF076B34);
  final Color darkBlue = const Color(0xff6100FF);
  final Color lightPurple = const Color(0xffF5EBFF);
  final Color darkPurple = const Color(0xff6667AB);
  final Color turquoise = const Color(0xff85A0A9);
  final Color yellow = const Color(0xffEEC272);
  final Color pink = const Color(0xffE288B6);
  final Color lightBrown = const Color(0xFFB38F6A);
  final Color fuchsia = const Color(0xffD75078);
  final Color peach = const Color(0xffD77E6F);
}

class IconColor {
  final Color white = Colors.white;
  final Color black = Colors.black;
  final Color darkGrey = const Color(0xff6A707C);
  final Color red = Colors.red;
}

class TextColor {
  final Color white = Colors.white;
  final Color black = Colors.black;
  final Color darkGrey = const Color(0xFF6A707C);
  final Color lightGrey = const Color(0xFF8391A1);
  final Color lightGreen = const Color(0xff00956E);
  final Color red = Colors.red;
}

class RainbowColor {
  // for Emrah
  final Color linearpurple = const Color(0xff9933FF);
  final Color lineargreen = const Color(0xff17BAAA);
  final Color linaergreenv2 = const Color(0xff16BBA9);
  final Color linearyellow = const Color(0xffEADA4A);
  final Color linearpurplev2 = const Color(0xff9933FF);
}

abstract class TobetoColor {
  TobetoColor._();
  static const Color purple = Color(0xFF9B33FF);
  static StateColor state = StateColor();
  static BackgroundColor background = BackgroundColor();
  static CardColor chart = CardColor();
  static IconColor icon = IconColor();
  static TextColor text = TextColor();
  static RainbowColor rainbow = RainbowColor();
}
