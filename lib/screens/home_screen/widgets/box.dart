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
    final screenSize = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.all(ScreenPadding.padding6px),
        child: Container(
          width: screenSize.width * 0.25,
          height: screenSize.height * 0.1,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).colorScheme.shadow,
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
                begin:
                    const Alignment(0.9195402264595032, 7.601138385382455e-9),
                end:
                    const Alignment(-7.685097891396708e-9, 0.04152298718690872),
                colors: [TobetoColor.card.darkBlue, TobetoColor.purple]),
          ),
          child: Center(
            child: FittedBox(
              fit: BoxFit.contain,
              child: Text(
                text,
                style: TobetoTextStyle.poppins(context).captionWhiteBold12,
                // Adjust text color as needed

                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
