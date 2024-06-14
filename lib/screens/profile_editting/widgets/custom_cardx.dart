import 'package:flutter/material.dart';
import 'package:tobeto_mobile_app/utils/themes/text_style.dart';

class CustomCardx extends StatelessWidget {
  const CustomCardx({
    super.key,
    required this.date,
    required this.title,
    required this.content,
    required this.title2,
    required this.content2,
    required this.title3,
    required this.content3,
    required this.title4,
    required this.content4,
  });

  final String date;
  final String title;
  final String content;
  final String title2;
  final String content2;
  final String title3;
  final String content3;
  final String title4;
  final String content4;

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
                  style: TobetoTextStyle.poppins(context).captionPurpleBold15,
                ),
                const Icon(Icons.delete),
                const Icon(Icons.edit),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TobetoTextStyle.poppins(context).bodyGrayLightNormal16,
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(content,
                  style: TobetoTextStyle.poppins(context).bodyBlackBold16),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(title2,
                style: TobetoTextStyle.poppins(context).bodyGrayLightNormal16),
          ),
          Text(content2,
              style: TobetoTextStyle.poppins(context).bodyBlackBold16),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(title3,
                style: TobetoTextStyle.poppins(context).bodyGrayLightNormal16),
          ),
          Text(content3,
              style: TobetoTextStyle.poppins(context).bodyBlackBold16),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(title4,
                style: TobetoTextStyle.poppins(context).bodyGrayLightNormal16),
          ),
          Text(content4,
              style: TobetoTextStyle.poppins(context).bodyBlackBold16),
        ],
      ),
    );
  }
}
