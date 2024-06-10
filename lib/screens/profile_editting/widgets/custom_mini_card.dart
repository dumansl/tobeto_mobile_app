import 'package:flutter/material.dart';
import 'package:tobeto_mobile_app/utils/themes/text_style.dart';

class CustomMiniCard extends StatelessWidget {
  const CustomMiniCard({
    super.key,
    required this.onpressed,
    required this.title,
    this.imagepath,
    this.content,
  });
  final VoidCallback onpressed;
  final String title;
  final String? content;

  final Widget? imagepath;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            child: imagepath,
          ),
          RichText(
              text: TextSpan(style: TobetoTextStyle.poppins.bodyBlackBold16, children: <TextSpan>[
            TextSpan(text: title),
            TextSpan(
              text: content,
              style: TobetoTextStyle.poppins.bodyGrayLightNormal16,
            ),
          ])),
          IconButton(
              onPressed: onpressed,
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              )),
        ],
      ),
    );
  }
}
