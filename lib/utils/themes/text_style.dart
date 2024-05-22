import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constant/constants.dart';

// TO DO : Emrah Işık
class Typography {
  final TextStyle baseStyle;
  final TextStyle headline;
  final TextStyle headline2;
  Typography({required this.baseStyle})
      : headline = baseStyle.copyWith(
          fontSize: 32,
          fontWeight: FontWeight.w600,
          color: TobetoColor.text.black,
        ),
        headline2 = baseStyle.copyWith(
          fontSize: 32,
          fontWeight: FontWeight.w600,
          color: TobetoColor.text.white,
        );
}

abstract class TobetoTextStyle {
  static Typography poppins = Typography(baseStyle: GoogleFonts.poppins());
  static Typography inter = Typography(baseStyle: GoogleFonts.inter());
}
