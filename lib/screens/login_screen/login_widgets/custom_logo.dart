import 'package:flutter/material.dart';
import 'package:tobeto_mobile_app/utils/constant/constants.dart';

class CustomLogo extends StatelessWidget {
  const CustomLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(ImagePath.greyTobeto),
        ),
      ),
    );
  }
}
