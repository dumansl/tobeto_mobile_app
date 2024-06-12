import 'package:flutter/material.dart';
import 'package:tobeto_mobile_app/screens/istanbulkodluyor_screen/widgets/centered_text.dart';
import 'package:tobeto_mobile_app/screens/istanbulkodluyor_screen/widgets/vertical_padding.dart';
import 'package:tobeto_mobile_app/utils/constant/colors.dart';
import 'package:tobeto_mobile_app/utils/constant/image_string.dart';

class FeaturedEducationCard extends StatelessWidget {
  const FeaturedEducationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        VerticalPadding(),
        CenteredText(
          text: 'ÖNE ÇIKAN EĞİTİMLER',
          style: TextStyle(
            color: Color.fromARGB(255, 0, 231, 170),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        VerticalPadding(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomIconButton(
              imagePath: ImagePath.siber,
              title: 'Siber Güvenlik Eğitimi',
              description: 'Siber güvenlik alanında kapsamlı eğitim.',
            ),
            CustomIconButton(
              imagePath: ImagePath.uiux,
              title: 'UI/UX Tasarım Eğitimi',
              description: 'Kullanıcı arayüzü ve deneyimi tasarım eğitimleri.',
            ),
            CustomIconButton(
              imagePath: ImagePath.oyun,
              title: 'Oyun Geliştirme Eğitimi',
              description: 'Oyun geliştirme konusunda kapsamlı eğitimler.',
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomIconButton(
              imagePath: ImagePath.yazilim,
              title: 'Yazılım Geliştirme Eğitimi',
              description: 'Yazılım geliştirme alanında kapsamlı eğitim.',
            ),
            CustomIconButton(
              imagePath: ImagePath.mobil,
              title: 'Mobil Uygulama Geliştirme Eğitimi',
              description: 'Mobil uygulama geliştirme konusunda eğitimler.',
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomIconButton(
              imagePath: ImagePath.dijital,
              title: 'Dijital Pazarlama Eğitimi',
              description: 'Dijital pazarlama stratejileri eğitimi.',
            ),
            CustomIconButton(
              imagePath: ImagePath.veri,
              title: 'Veri Bilimi Eğitimi',
              description: 'Veri bilimi ve analiz konularında eğitimler.',
            ),
            CustomIconButton(
              imagePath: ImagePath.ag,
              title: 'Ağ Yönetimi Eğitimi',
              description: 'Ağ yönetimi ve güvenliği konusunda eğitimler.',
            ),
          ],
        ),
        VerticalPadding(),
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
      height: 130,
      width: 130,
      child: IconButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(
                  title,
                  style: const TextStyle(color: TobetoColor.purple),
                ),
                content: Text(
                  description,
                  style: TextStyle(color: TobetoColor.text.black),
                ),
                actions: [
                  TextButton(
                    style: ButtonStyle(backgroundColor: WidgetStateProperty.all<Color>(TobetoColor.purple)),
                    onPressed: () {
                      Navigator.of(context).pop(); // Close the dialog
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
        icon: Image.asset(imagePath),
      ),
    );
  }
}
