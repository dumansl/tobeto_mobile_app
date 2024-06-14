import 'package:flutter/material.dart';
import 'package:tobeto_mobile_app/screens/istanbulkodluyor_screen/widgets/custom_container.dart';
import 'package:tobeto_mobile_app/screens/istanbulkodluyor_screen/widgets/vertical_padding.dart';
import 'package:tobeto_mobile_app/utils/themes/text_style.dart';

class AboutIstanbulKodluyorCard extends StatelessWidget {
  const AboutIstanbulKodluyorCard({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      backgroundColor: const Color.fromARGB(255, 0, 231, 170),
      borderRadius: const BorderRadius.only(
          topRight: Radius.circular(30), topLeft: Radius.circular(30)),
      children: [
        const VerticalPadding(),
        const ProjectAboutHeader(),
        PaddedText(
          text:
              'Yazılım ve teknoloji alanında meslek sahibi olmak isteyen genç yetişkinlere, ücretsiz ve kapsamlı eğitimlerle gerekli bilgi ve becerileri kazandıran, Türkiye’nin önde gelen kurumlarında işe yerleşmelerini  sağlayan bir projedir. Teknoloji alanında nitelikli insan kaynağını geliştirmeyi amaçlayan bu proje, aynı zamanda kadınların sektördeki temsiliyetini artırmayı da hedeflemektedir.',
          style: TobetoTextStyle.poppins(context).bodyWhiteBold16,
          padding: const EdgeInsets.all(30),
        ),
      ],
    );
  }
}

class ProjectAboutHeader extends StatelessWidget {
  const ProjectAboutHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      backgroundColor: const Color(0xFF1E0F41),
      borderRadius: const BorderRadius.only(
          topRight: Radius.circular(30), bottomRight: Radius.circular(30)),
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                'İstanbul Kodluyor Projesi Hakkında',
                style: TobetoTextStyle.poppins(context).captionWhiteBold18,
              ),
            ),
            const SizedBox(width: 20),
            const Padding(
              padding: EdgeInsets.all(2.0),
              child: CircleAvatar(
                backgroundColor: Color.fromARGB(255, 0, 231, 170),
                radius: 17.5,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
