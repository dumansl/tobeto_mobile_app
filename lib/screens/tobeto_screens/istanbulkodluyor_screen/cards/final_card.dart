import 'package:flutter/material.dart';
import 'package:tobeto_mobile_app/screens/tobeto_screens/istanbulkodluyor_screen/widgets/custom_container.dart';
import 'package:tobeto_mobile_app/screens/tobeto_screens/istanbulkodluyor_screen/widgets/custom_image.dart';
import 'package:tobeto_mobile_app/screens/tobeto_screens/istanbulkodluyor_screen/widgets/vertical_padding.dart';
import 'package:tobeto_mobile_app/utils/constant/colors.dart';
import 'package:tobeto_mobile_app/utils/constant/image_string.dart';
import 'package:tobeto_mobile_app/utils/constant/sizes.dart';

class FinalCard extends StatelessWidget {
  const FinalCard({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      backgroundColor: TobetoColor.card.navyBlue,
      children: [
        const VerticalPadding(),
        CustomImage(
          imagePath: ImagePath.ikLogoLight,
          width: ScreenUtil.getWidth(context) * 0.55,
          height: ScreenUtil.getHeight(context) * 0.13,
        ),
        const VerticalPadding(),
      ],
    );
  }
}
