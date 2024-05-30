import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:tobeto_mobile_app/utils/constant/colors.dart';
import 'package:tobeto_mobile_app/utils/themes/text_style.dart';

class Boxlong extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final String buttonText;

  const Boxlong({
    super.key,
    required this.text,
    required this.onPressed,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 190,
      height: 150,
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
          colors: [TobetoColor.chart.darkBlue, TobetoColor.purple],
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: TobetoTextStyle.poppins.captionWhiteBold15,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
                height: 10), // Add some spacing between the text and button
            ElevatedButton(
              onPressed: onPressed,
              child: Text(buttonText),
            ),
          ],
        ),
      ),
    );
  }
}
