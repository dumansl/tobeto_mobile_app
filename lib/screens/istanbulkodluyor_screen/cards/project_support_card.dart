import 'package:flutter/material.dart';
import 'package:tobeto_mobile_app/screens/istanbulkodluyor_screen/widgets/custom_container.dart';
import 'package:tobeto_mobile_app/screens/istanbulkodluyor_screen/widgets/custom_image.dart';
import 'package:tobeto_mobile_app/screens/istanbulkodluyor_screen/widgets/vertical_padding.dart';
import 'package:tobeto_mobile_app/utils/constant/colors.dart';
import 'package:tobeto_mobile_app/utils/constant/image_string.dart';
import 'package:tobeto_mobile_app/utils/themes/text_style.dart';

class ProjectSupportCard extends StatelessWidget {
  const ProjectSupportCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const VerticalPadding(),
        const VerticalPadding(),
        CustomContainer(
          backgroundColor: TobetoColor.card.lightGrey,
          borderRadius: const BorderRadius.all(Radius.circular(30)),
          boxShadow: [
            BoxShadow(
              color: TobetoColor.card.grey.withOpacity(0.65),
              spreadRadius: 5,
              blurRadius: 12,
              offset: const Offset(6, 8), // changes position of shadow
            ),
          ],
          children: [
            const VerticalPadding(),
            PaddedText(
              text: 'Bu Proje Nasıl Destekleniyor?',
              style: TobetoTextStyle.poppins.captionBlackBold18,
              padding: EdgeInsets.zero,
            ),
            const VerticalPadding(),
            PaddedText(
              text:
                  'İstanbul Kodluyor, Türkiye’nin ilk sosyal etki tahvili projesidir. Sosyal etki tahvilleri, sosyal sorunlara çözüm bulan, performansa dayalı sözleşmelerdir ve ölçülebilir, pozitif, sosyal ve çevresel etki yaratacak sonuçlara ulaşılmayı amaçlamaktadır.',
              style: TobetoTextStyle.poppins.bodyBlackNormal16,
              padding: const EdgeInsets.only(left: 30, right: 30),
            ),
            const Center(
              child: Column(
                children: [
                  CustomImage(
                    imagePath: ImagePath.stb,
                    width: 350,
                    height: 100,
                  ),
                  VerticalPadding(),
                  CustomImage(
                    imagePath: ImagePath.istka,
                    width: 100,
                    height: 50,
                  ),
                  VerticalPadding(),
                  CustomImage(
                    imagePath: ImagePath.bop,
                    width: 250,
                    height: 100,
                  ),
                  VerticalPadding(),
                  CustomImage(
                    imagePath: ImagePath.etkiYap,
                    width: 100,
                    height: 50,
                  ),
                  VerticalPadding(),
                  CustomImage(
                    imagePath: ImagePath.enocta,
                    width: 150,
                    height: 100,
                  ),
                  VerticalPadding(),
                  CustomImage(
                    imagePath: ImagePath.greyTobeto,
                    width: 250,
                    height: 100,
                  ),
                  VerticalPadding(),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
