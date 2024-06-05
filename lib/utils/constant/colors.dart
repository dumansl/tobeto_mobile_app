import 'package:flutter/material.dart';

abstract class TobetoColor {
  TobetoColor._();
  static const Color purple = Color(0xFF9B33FF);
  static StateColor state = StateColor();
  static BackgroundColor background = BackgroundColor();
  static CardColor card = CardColor();
  static IconColor icon = IconColor();
  static TextColor text = TextColor();
  static FrameColor frame = FrameColor();
  static ButtonColor button = ButtonColor();
  static FormFieldColor formField = FormFieldColor();
  static RainbowColor rainbow = RainbowColor();
}

class StateColor {
  final Color error = const Color(0xFFFF0000);
  final Color warning = const Color(0xFFEBD514);
  final Color success = const Color(0xFF24DA69);
}

class BackgroundColor {
  final Color white = Colors.white;
  final Color darkGrey = const Color(0xff212529);
  final Color lightGrey = const Color(0xffF5F5F5);
  final Color transparent = Colors.transparent;
}

class CardColor {
  final Color white = Colors.white;
  final Color black = Colors.black;
  final Color grey = Colors.grey;
  final Color cream = const Color(0xffF5F5F5);
  final Color lightGrey = const Color(0xffCCCCCC);
  final Color darkGrey = const Color(0xff1E1E1E);
  final Color lightGreen = const Color(0xff00956E);
  final Color darkGreen = const Color(0xFF076B34);
  final Color darkBlue = const Color(0xff6100FF);
  final Color lightPurple = const Color(0xffF5EBFF);
  final Color darkPurple = const Color(0xff6667AB);
  final Color linearpurple = const Color(0xff953DAC);
  final Color turquoise = const Color(0xff85A0A9);
  final Color yellow = const Color(0xffEEC272);
  final Color pink = const Color(0xffE288B6);
  final Color lightBrown = const Color(0xFFB38F6A);
  final Color fuchsia = const Color(0xffD75078);
  final Color peach = const Color(0xffD77E6F);
  final Color shadowColor = const Color.fromARGB(255, 117, 117, 117);
}

class ButtonColor {
  final Color white = Colors.white;
  final Color black = Colors.black;
  final Color darkGrey = const Color(0xff2A2E32);
}

class FormFieldColor {
  final Color white = Colors.white;
  final Color black = Colors.black;
  final Color darkGrey = const Color(0xff2A2E32);
}

class IconColor {
  final Color white = Colors.white;
  final Color black = Colors.black;
  final Color darkGrey = const Color(0xff6A707C);
  final Color red = Colors.red;
  final Color grey = const Color(0xffE9E6E6);
}

class FrameColor {
  final Color white = Colors.white;
  final Color black = Colors.black;
  final Color lightGrey = const Color(0xffE8ECF4);
  final Color grey = const Color(0xff6A707C);
}

class TextColor {
  final Color white = Colors.white;
  final Color black = Colors.black;
  final Color darkGrey = const Color(0xFF6A707C);
  final Color lightGrey = const Color(0xFF8391A1);
  final Color lightGreen = const Color(0xff00956E);
  final Color red = Colors.red;
  final Color blackOpacity = const Color.fromRGBO(0, 0, 0, 200);
}

class RainbowColor {
  // for Emrah
  final Color linearpurple = const Color(0xff9933FF);
  final Color lineargreen = const Color(0xff17BAAA);
  final Color linaergreenv2 = const Color(0xff16BBA9);
  final Color linearyellow = const Color(0xffEADA4A);
  final Color linearpurplev2 = const Color(0xff9933FF);
}
