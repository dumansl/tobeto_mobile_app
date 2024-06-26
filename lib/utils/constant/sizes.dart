import 'package:flutter/material.dart';

abstract class SizeRadius {
  SizeRadius._();

  static double radius5px = 5;
  static double radius8px = 8;
  static double radius10px = 10;
  static double radius12px = 12;
  static double radius16px = 16;
  static double radius30px = 30;
  static double radius20px = 20;
}

abstract class IconOpacity {
  IconOpacity._();
  static double halfOpacity = 0.5;
}

abstract class ScreenUtil {
  ScreenUtil._();

  static double getWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double getHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }
}

abstract class ScreenPadding {
  ScreenPadding._();
  static double padding2px = 2;
  static double padding3px = 3;
  static double padding4px = 4;
  static double padding5px = 5;
  static double padding6px = 6;
  static double padding8px = 8;
  static double padding10px = 10;
  static double padding12px = 12;
  static double padding15px = 15;
  static double padding16px = 16;
  static double padding18px = 18;
  static double padding20px = 20;
  static double padding24px = 24;
  static double padding30px = 30;
  static double padding32px = 32;
  static double padding52px = 52;
  static double padding58px = 58;
  static double screenpadding = 12;
}

abstract class IconSize {
  IconSize._();
  static double size25px = 25;
  static double size30px = 30;
  static double size35px = 35;
  static double size60px = 60;
  static double size65px = 65;
}
