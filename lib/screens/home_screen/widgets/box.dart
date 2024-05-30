import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tobeto_mobile_app/utils/constant/colors.dart';

import 'package:tobeto_mobile_app/utils/themes/text_style.dart';

class Box extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const Box({
    required this.text,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 85,
        height: 85,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: TobetoColor.chart.grey.withOpacity(0.8),
              spreadRadius: 1,
              blurRadius: 9,
              offset: const Offset(2, 4), // changes position of shadow
            ),
          ],
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(0),
            topRight: Radius.circular(20),
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
          gradient: LinearGradient(
              begin: Alignment(0.9195402264595032, 7.601138385382455e-9),
              end: Alignment(-7.685097891396708e-9, 0.04152298718690872),
              colors: [TobetoColor.chart.darkBlue, TobetoColor.purple]),
        ),
        child: Center(
          child: Text(
            text,
            style: TobetoTextStyle.poppins.captionWhiteBold12,
            // Adjust text color as needed

            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
