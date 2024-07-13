import 'package:flutter/material.dart';
import 'package:tobeto_mobile_app/screens/tobeto_screens/istanbulkodluyor_screen/widgets/centered_text.dart';
import 'package:tobeto_mobile_app/screens/tobeto_screens/istanbulkodluyor_screen/widgets/vertical_padding.dart';
import 'package:tobeto_mobile_app/utils/constant/constants.dart';

class FeaturedEducationCard extends StatelessWidget {
  const FeaturedEducationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const VerticalPadding(),
        CenteredText(
          text: TobetoText.istanbulHeadline5,
          style: TextStyle(
            color: TobetoColor.card.shineGreen,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomIconButton(
              imagePath: ImagePath.siber,
              title: TobetoText.istanbulCyberSecurity,
              description: TobetoText.istanbulCyberSecurityDescription,
            ),
            CustomIconButton(
              imagePath: ImagePath.uiux,
              title: TobetoText.istanbulUIUXDesign,
              description: TobetoText.istanbulUIUXDesignDescription,
            ),
            CustomIconButton(
              imagePath: ImagePath.oyun,
              title: TobetoText.istanbulGame,
              description: TobetoText.istanbulGameDescription,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomIconButton(
              imagePath: ImagePath.yazilim,
              title: TobetoText.istanbulSoftware,
              description: TobetoText.istanbulSoftwareDescription,
            ),
            CustomIconButton(
              imagePath: ImagePath.mobil,
              title: TobetoText.istanbulMobil,
              description: TobetoText.istanbulMobilDescription,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomIconButton(
              imagePath: ImagePath.dijital,
              title: TobetoText.istanbulDigitalMarketing,
              description: TobetoText.istanbulDigitalMarketingDescription,
            ),
            CustomIconButton(
              imagePath: ImagePath.veri,
              title: TobetoText.istanbulDataScience,
              description: TobetoText.istanbulDataScienceDescription,
            ),
            CustomIconButton(
              imagePath: ImagePath.ag,
              title: TobetoText.istanbulNetwork,
              description: TobetoText.istanbulNetworkDescription,
            ),
          ],
        ),
      ],
    );
  }
}

class CustomIconButton extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;

  const CustomIconButton({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ScreenUtil.getHeight(context) * 0.14,
      width: ScreenUtil.getWidth(context) * 0.3,
      child: IconButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(
                  title,
                  style: TextStyle(color: TobetoColor.card.shineGreen),
                ),
                content: Text(
                  description,
                  style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
                ),
                actions: [
                  TextButton(
                    style: ButtonStyle(backgroundColor: WidgetStateProperty.all<Color>(TobetoColor.card.shineGreen)),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'Kapat',
                      style: TextStyle(color: TobetoColor.text.white),
                    ),
                  ),
                ],
              );
            },
          );
        },
        icon: Image.asset(
          imagePath,
          color: TobetoColor.card.shineGreen,
        ),
      ),
    );
  }
}
