import 'package:flutter/material.dart';
import 'package:tobeto_mobile_app/screens/istanbulkodluyor_screen/widgets/centered_text.dart';
import 'package:tobeto_mobile_app/screens/istanbulkodluyor_screen/widgets/custom_container.dart';
import 'package:tobeto_mobile_app/screens/istanbulkodluyor_screen/widgets/vertical_padding.dart';
import 'package:tobeto_mobile_app/screens/screens.dart';
import 'package:tobeto_mobile_app/utils/constant/colors.dart';
import 'package:tobeto_mobile_app/utils/constant/text.dart';
import 'package:tobeto_mobile_app/utils/themes/text_style.dart';

class DescriptionCard extends StatelessWidget {
  const DescriptionCard({super.key, required this.faqButton});
  final VoidCallback faqButton;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomContainer(
          backgroundColor: TobetoColor.card.shineGreen,
          borderRadius: const BorderRadius.only(bottomRight: Radius.circular(30), bottomLeft: Radius.circular(30)),
          boxShadow: [
            BoxShadow(
              color: TobetoColor.card.grey.withOpacity(0.3),
              spreadRadius: 7,
              blurRadius: 15,
              offset: const Offset(3, 5),
            ),
          ],
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: CenteredText(
                text: TobetoText.istanbulCard1Title,
                style: TobetoTextStyle.poppins(context).subtitleWhiteBold20,
              ),
            ),
            PaddedText(
              text: TobetoText.istanbulCard1Body,
              style: TobetoTextStyle.poppins(context).bodyWhiteBold16,
              padding: const EdgeInsets.all(30),
            ),
          ],
        ),
        const VerticalPadding(),
        ButtonsAndText(
          faqButton: faqButton,
        ),
        const VerticalPadding(),
      ],
    );
  }
}

class ButtonsAndText extends StatelessWidget {
  const ButtonsAndText({super.key, required this.faqButton});
  final VoidCallback faqButton;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        FAQButton(
          text: TobetoText.istanbulFAQButton,
          faqButton: faqButton,
        ),
        TobetoButton(
          text: TobetoText.istanbulGoPlatformButton,
        ),
      ],
    );
  }
}

class FAQButton extends StatelessWidget {
  final String text;
  final VoidCallback faqButton;

  const FAQButton({
    super.key,
    required this.text,
    required this.faqButton,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: TobetoColor.purple, elevation: 6, shadowColor: TobetoColor.card.lightGrey),
        onPressed: faqButton,
        child: Text(
          text,
          style: TobetoTextStyle.poppins(context).captionWhiteBold12,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class TobetoButton extends StatelessWidget {
  final String text;

  const TobetoButton({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: TobetoColor.purple, elevation: 6, shadowColor: TobetoColor.card.lightGrey),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const DashboardScreen(),
            ),
          );
        },
        child: Text(
          text,
          style: TobetoTextStyle.poppins(context).captionWhiteBold12,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
