import 'package:flutter/material.dart';
import 'package:tobeto_mobile_app/utils/constant/sizes.dart';
import 'package:tobeto_mobile_app/utils/themes/text_style.dart';

Widget sideTitleAndComment(BuildContext context, String label, String info) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: ScreenPadding.padding4px),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Text(
            label,
            style: TobetoTextStyle.poppins(context).captionBlackBold15,
          ),
        ),
        Expanded(
          flex: 4,
          child: Text(
            info,
            style: TobetoTextStyle.poppins(context).captionGrayLightLight15,
          ),
        ),
      ],
    ),
  );
}
