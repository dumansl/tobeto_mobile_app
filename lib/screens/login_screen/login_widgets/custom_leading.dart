import 'package:flutter/material.dart';
import 'package:tobeto_mobile_app/utils/constant/constants.dart';

class CustomLeading extends StatelessWidget {
  const CustomLeading({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: ScreenPadding.padding40px,
        left: ScreenPadding.padding8px,
      ),
      child: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.arrow_back_rounded,
          size: IconSize.size35px,
          color: TobetoColor.icon.white,
        ),
      ),
    );
  }
}
