import 'package:flutter/material.dart';
import 'package:tobeto_mobile_app/screens/istanbulkodluyor_screen/cards/faq_card.dart';
import 'package:tobeto_mobile_app/screens/istanbulkodluyor_screen/widgets/centered_text.dart';
import 'package:tobeto_mobile_app/screens/istanbulkodluyor_screen/widgets/custom_container.dart';
import 'package:tobeto_mobile_app/screens/istanbulkodluyor_screen/widgets/vertical_padding.dart';
import 'package:tobeto_mobile_app/screens/screens.dart';
import 'package:tobeto_mobile_app/utils/constant/colors.dart';
import 'package:tobeto_mobile_app/utils/themes/text_style.dart';

class DescriptionCard extends StatelessWidget {
  const DescriptionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomContainer(
          backgroundColor: const Color.fromARGB(255, 0, 231, 170),
          borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(30),
              bottomLeft: Radius.circular(30)),
          boxShadow: [
            BoxShadow(
              color: TobetoColor.card.grey.withOpacity(0.3),
              spreadRadius: 7,
              blurRadius: 15,
              offset: const Offset(3, 5), // changes position of shadow
            ),
          ],
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: CenteredText(
                text:
                    'Türkiye’nin İlk Sosyal Etki Tahvili: “İstanbul Kodluyor” Projesi',
                style: TobetoTextStyle.poppins(context).subtitleWhiteBold20,
              ),
            ),
            PaddedText(
              text:
                  'Sanayi ve Teknoloji Bakanlığı Kalkınma Ajansları Genel Müdürlüğü koordinasyonunda İstanbul Kalkınma Ajansı (İSTKA) ve İngiltere merkezli Bridges Outcomes Partnerships iş birliğinde başladı!',
              style: TobetoTextStyle.poppins(context).bodyWhiteBold16,
              padding: const EdgeInsets.all(30),
            ),
          ],
        ),
        const VerticalPadding(),
        const ButtonsAndText(),
        const VerticalPadding(),
      ],
    );
  }
}

class ButtonsAndText extends StatelessWidget {
  const ButtonsAndText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        FAQButton(
          text: 'Sıkça Sorulan \n Sorular',
        ),
        TobetoButton(
          text: 'Platforma Git',
        ),
      ],
    );
  }
}

class FAQButton extends StatelessWidget {
  final String text;

  const FAQButton({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: TobetoColor.purple,
            elevation: 6,
            shadowColor: TobetoColor.card.lightGrey),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const FAQCard(),
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
            backgroundColor: TobetoColor.purple,
            elevation: 6,
            shadowColor: TobetoColor.card.lightGrey),
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
