import 'package:flutter/material.dart';
import 'package:tobeto_mobile_app/screens/istanbulkodluyor_screen/widgets/custom_container.dart';
import 'package:tobeto_mobile_app/screens/istanbulkodluyor_screen/widgets/custom_image.dart';
import 'package:tobeto_mobile_app/screens/istanbulkodluyor_screen/widgets/vertical_padding.dart';
import 'package:tobeto_mobile_app/utils/constant/image_string.dart';

class FinalCard extends StatelessWidget {
  const FinalCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomContainer(
      backgroundColor: Color(0xFF1E0F41),
      children: [
        VerticalPadding(),
        CustomImage(
          imagePath: ImagePath.ikLogoLight,
          width: 290,
          height: 120,
        ),
        VerticalPadding(),
      ],
    );
  }
}