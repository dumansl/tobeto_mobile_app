import 'package:flutter/material.dart';
import 'package:tobeto_mobile_app/utils/constant/constants.dart';
import 'package:tobeto_mobile_app/utils/themes/text_style.dart';

class LoginTitleDivider extends StatelessWidget {
  final String text;
  const LoginTitleDivider({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Divider(
            color: TobetoColor.frame.lightGrey,
            thickness: 2,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: ScreenPadding.padding8px),
          child: Text(
            text,
            style: TobetoTextStyle.inter.captionGrayDarkSemiBold15,
          ),
        ),
        Expanded(
          child: Divider(
            color: TobetoColor.frame.lightGrey,
            thickness: 2,
          ),
        ),
      ],
    );
  }
}
