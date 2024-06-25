// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:tobeto_mobile_app/utils/constant/constants.dart';

class CustomLogo extends StatelessWidget {
  final double? height;
  final double? width;
  const CustomLogo({
    super.key,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final assetImagePath =
        isDarkMode ? ImagePath.whiteTobeto : ImagePath.greyTobeto;
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(assetImagePath),
        ),
      ),
    );
  }
}
