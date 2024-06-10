import 'package:flutter/material.dart';
import 'package:tobeto_mobile_app/utils/themes/text_style.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    required this.date,
    required this.title,
    required this.content,
    required this.title2,
    required this.content2,
  });

  final String date;
  final String title;
  final String content;
  final String title2;
  final String content2;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Icon(Icons.date_range_outlined),
                ),
                Text(
                  date,
                  style: TobetoTextStyle.poppins.captionPurpleBold15,
                ),
                const Icon(Icons.delete),
                const Icon(Icons.edit),
              ],
            ),
          ),
          RichText(
              text: TextSpan(style: TobetoTextStyle.poppins.bodyBlackBold16, children: <TextSpan>[
            TextSpan(text: title),
            TextSpan(text: content, style: TobetoTextStyle.poppins.bodyGrayLightNormal16),
            TextSpan(text: title2),
            TextSpan(text: content2, style: TobetoTextStyle.poppins.bodyGrayLightNormal16),
          ])),
        ],
      ),
    );
  }
}
