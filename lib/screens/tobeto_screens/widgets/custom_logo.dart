// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

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
    final isDarkMode = Theme.of(context).brightness == Brightness.light;
    final assetImagePath = isDarkMode
        ? 'assets/images/grey-tobeto.png'
        : 'assets/images/white-tobeto.png';
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
