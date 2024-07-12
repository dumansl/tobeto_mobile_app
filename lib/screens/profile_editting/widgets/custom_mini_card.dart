import 'package:flutter/material.dart';
import 'package:tobeto_mobile_app/utils/constant/sizes.dart';
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
      padding: EdgeInsets.symmetric(horizontal: ScreenPadding.padding10px),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            child: SizedBox(
                width: ScreenUtil.getWidth(context) * 0.07,
                height: ScreenUtil.getHeight(context) * 0.07,
                child: imagepath),
          ),
          Expanded(
            child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(style: TobetoTextStyle.poppins(context).captionBlackBold15, children: <TextSpan>[
                  TextSpan(text: title),
                  if (content != null)
                    TextSpan(
                      text: '\n$content',
                      style: TobetoTextStyle.poppins(context).bodyGrayLightNormal16,
                    ),
                ])),
          ),
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
