import 'package:flutter/material.dart';
import 'package:tobeto_mobile_app/utils/constant/image_string.dart';

class CustomColumn extends StatelessWidget {
  const CustomColumn({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(ImagePath.profileEditNote),
        Text(
          title,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
