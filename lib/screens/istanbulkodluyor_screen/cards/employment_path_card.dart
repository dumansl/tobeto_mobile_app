import 'package:flutter/material.dart';
import 'package:tobeto_mobile_app/screens/istanbulkodluyor_screen/widgets/centered_text.dart';
import 'package:tobeto_mobile_app/screens/istanbulkodluyor_screen/widgets/custom_container.dart';
import 'package:tobeto_mobile_app/screens/istanbulkodluyor_screen/widgets/vertical_padding.dart';
import 'package:tobeto_mobile_app/utils/constant/colors.dart';
import 'package:tobeto_mobile_app/utils/themes/text_style.dart';

class EmploymentPathCard extends StatelessWidget {
  const EmploymentPathCard({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      backgroundColor: const Color.fromARGB(255, 0, 231, 170),
      borderRadius: const BorderRadius.only(
          bottomRight: Radius.circular(30), bottomLeft: Radius.circular(30)),
      boxShadow: [
        BoxShadow(
          color: TobetoColor.card.grey.withOpacity(0.45),
          spreadRadius: 7,
          blurRadius: 25,
          offset: const Offset(2, 4), // changes position of shadow
        ),
      ],
      children: [
        const VerticalPadding(),
        CustomContainer(
          backgroundColor: const Color(0xFF1E0F41),
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30), bottomLeft: Radius.circular(30)),
          children: [
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.all(3),
                  child: CircleAvatar(
                    radius: 17.5,
                    backgroundColor: Color.fromARGB(255, 0, 231, 170),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 60),
                  child: CenteredText(
                    text: 'İstihtama Giden Yol',
                    style: TobetoTextStyle.poppins(context).subtitleWhiteBold20,
                  ),
                ),
              ],
            ),
          ],
        ),
        Column(
          children: [
            PaddedText(
              text:
                  'Yazılım ve Teknoloji Alanında Meslek \n        Edinmeye Yönelik Eğitimler',
              style: TobetoTextStyle.poppins(context).captionWhiteBold18,
              padding: const EdgeInsets.only(top: 30, bottom: 20, left: 10),
            ),
            PaddedText(
              text: 'Mesleki Eğitimler',
              style: TobetoTextStyle.poppins(context).captionWhiteBold18,
              padding: const EdgeInsets.only(bottom: 10),
            ),
            PaddedText(
              text: '•  Online Canlı Dersler\n'
                  '•  Video İçerikler\n'
                  '•  İstanbul’da Kampüs Buluşmaları\n'
                  '•  Proje Uygulamaları',
              style: TobetoTextStyle.poppins(context).bodyWhiteNormal16,
              padding: const EdgeInsets.only(bottom: 10),
            ),
            Icon(
              Icons.add,
              color: TobetoColor.card.white,
              size: 60,
            ),
            PaddedText(
              text: 'Profesyonel Gelişim Eğitimleri',
              style: TobetoTextStyle.poppins(context).captionWhiteBold18,
              padding: const EdgeInsets.only(bottom: 10, top: 20),
            ),
            PaddedText(
              text: '•  İşte Başarı Eğitimleri\n'
                  '•  Sektör Buluşmaları ve Webinarlar\n'
                  '•  Kariyer Gelişim Desteği\n'
                  '•  Mentörlük',
              style: TobetoTextStyle.poppins(context).bodyWhiteNormal16,
              padding: const EdgeInsets.only(bottom: 20),
            ),
          ],
        ),
        const VerticalPadding(),
      ],
    );
  }
}
