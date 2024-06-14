import 'package:flutter/material.dart';

import 'package:tobeto_mobile_app/utils/themes/text_style.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    required this.startDate,
    required this.endDate,
    required this.title,
    required this.content,
    required this.title2,
    required this.content2,
    this.title3,
    this.content3,
    this.title4,
    this.content4,
  });

  final String startDate;
  final String endDate;
  final String title;
  final String content;
  final String title2;
  final String content2;
  final String? title3;
  final String? content3;
  final String? title4;
  final String? content4;

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
                RichText(
                  text: TextSpan(
                      style:
                          TobetoTextStyle.poppins(context).captionPurpleBold15,
                      children: <TextSpan>[
                        TextSpan(text: startDate),
                        TextSpan(text: ' - $endDate'),
                      ]),
                ),
                const Icon(Icons.delete),
                const Icon(Icons.edit),
              ],
            ),
          ),
          RichText(
              text: TextSpan(
                  style: TobetoTextStyle.poppins(context).bodyBlackBold16,
                  children: <TextSpan>[
                TextSpan(text: title),
                TextSpan(
                    text: content,
                    style:
                        TobetoTextStyle.poppins(context).bodyGrayLightNormal16),
                TextSpan(text: title2),
                TextSpan(
                    text: content2,
                    style:
                        TobetoTextStyle.poppins(context).bodyGrayLightNormal16),
                TextSpan(text: title3),
                TextSpan(
                    text: content3,
                    style:
                        TobetoTextStyle.poppins(context).bodyGrayLightNormal16),
                TextSpan(text: title4),
                TextSpan(
                    text: content4,
                    style:
                        TobetoTextStyle.poppins(context).bodyGrayLightNormal16),
              ])),
        ],
      ),
    );
  }
}
