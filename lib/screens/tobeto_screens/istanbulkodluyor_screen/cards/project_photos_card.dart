import 'package:flutter/material.dart';
import 'package:tobeto_mobile_app/screens/tobeto_screens/istanbulkodluyor_screen/widgets/centered_text.dart';
import 'package:tobeto_mobile_app/screens/tobeto_screens/istanbulkodluyor_screen/widgets/vertical_padding.dart';
import 'package:tobeto_mobile_app/utils/constant/colors.dart';
import 'package:tobeto_mobile_app/utils/constant/image_string.dart';
import 'package:tobeto_mobile_app/utils/constant/sizes.dart';
import 'package:tobeto_mobile_app/utils/constant/text.dart';
import 'package:tobeto_mobile_app/utils/themes/text_style.dart';

class ProjectPhotosCard extends StatelessWidget {
  const ProjectPhotosCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CenteredText(
          text: TobetoText.istanbulHeadline8,
          style: TobetoTextStyle.poppins(context).captionBlackBold24,
        ),
        const VerticalPadding(),
        Row(
          children: [
            CustomImageContainer(
              imagePath: ImagePath.ik1,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.all(ScreenPadding.padding2px),
              widthFactor: 0.66,
            ),
          ],
        ),
        const VerticalPadding(),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomImageContainer(
              imagePath: ImagePath.ik2,
              alignment: Alignment.centerRight,
              padding: EdgeInsets.all(ScreenPadding.padding2px),
              widthFactor: 0.66,
            ),
          ],
        ),
        const VerticalPadding(),
        Row(
          children: [
            CustomImageContainer(
              imagePath: ImagePath.ik3,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.all(ScreenPadding.padding2px),
              widthFactor: 0.66,
            ),
          ],
        ),
        const VerticalPadding(),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomImageContainer(
              imagePath: ImagePath.ik4,
              alignment: Alignment.centerRight,
              padding: EdgeInsets.all(ScreenPadding.padding2px),
              widthFactor: 0.66,
            ),
          ],
        ),
        const VerticalPadding(),
      ],
    );
  }
}

class CustomImageContainer extends StatelessWidget {
  final String imagePath;
  final Alignment alignment;
  final EdgeInsets padding;
  final double widthFactor;

  const CustomImageContainer({
    super.key,
    required this.imagePath,
    required this.alignment,
    required this.padding,
    required this.widthFactor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * widthFactor,
      padding: padding,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(30)),
        boxShadow: [
          BoxShadow(
              color: TobetoColor.card.darkGrey.withOpacity(0.2),
              spreadRadius: 3,
              blurRadius: 5,
              offset: const Offset(0, 4)),
        ],
        gradient: LinearGradient(
          colors: [
            TobetoColor.purple,
            TobetoColor.rainbow.lineargreen,
            TobetoColor.rainbow.linaergreenv2,
            TobetoColor.rainbow.linearyellow,
            TobetoColor.purple,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      alignment: alignment,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.2,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(30)),
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
