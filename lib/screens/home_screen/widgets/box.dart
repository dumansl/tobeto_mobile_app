import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tobeto_mobile_app/utils/constant/constants.dart';
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
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(0),
            topRight: Radius.circular(20),
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
          gradient: LinearGradient(
              begin: Alignment(0.9195402264595032, 7.601138385382455e-9),
              end: Alignment(-7.685097891396708e-9, 0.04152298718690872),
              colors: [
                Color.fromRGBO(153, 51, 255, 0.5),
                Color.fromRGBO(153, 51, 255, 1)
              ]),
        ),
        child: Center(
          child: Text(
            text,
            style: TobetoTextStyle.poppins.captionBlackBold12,
            // Adjust text color as needed

            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
