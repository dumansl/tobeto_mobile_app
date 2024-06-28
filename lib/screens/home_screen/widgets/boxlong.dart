import 'package:flutter/material.dart';

import 'package:tobeto_mobile_app/utils/constant/colors.dart';
import 'package:tobeto_mobile_app/utils/constant/constants.dart';
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
    // Sayfa boyutlarını al
    final screenSize = MediaQuery.of(context).size;

    return Container(
      width: screenSize.width * 0.17, // Sayfa genişliğinin %40'ı
      height: screenSize.height * 0.16, // Sayfa yüksekliğinin %20'si
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.shadow,
            spreadRadius: 1,
            blurRadius: 9,
            offset: const Offset(2, 4), // Shadow'ın konumu
          ),
        ],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(0),
          topRight: Radius.circular(20),
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        gradient: LinearGradient(
          begin: const Alignment(0.9195402264595032, 7.601138385382455e-9),
          end: const Alignment(-7.685097891396708e-9, 0.04152298718690872),
          colors: [TobetoColor.card.darkBlue, TobetoColor.purple],
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  text,
                  style: TobetoTextStyle.poppins(context).captionWhiteBold15,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            // Metin ve düğme arasına boşluk ekle
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: TobetoColor.card.darkBlue,
                      shadowColor: TobetoColor.card.fuchsia),
                  onPressed: onPressed,
                  child: Text(
                    buttonText,
                    style: TobetoTextStyle.poppins(context).captionWhiteBold15,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
