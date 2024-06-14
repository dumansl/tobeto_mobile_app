import 'package:flutter/material.dart';
import 'package:tobeto_mobile_app/screens/istanbulkodluyor_screen/widgets/centered_text.dart';
import 'package:tobeto_mobile_app/screens/istanbulkodluyor_screen/widgets/vertical_padding.dart';
import 'package:tobeto_mobile_app/utils/constant/colors.dart';
import 'package:tobeto_mobile_app/utils/constant/image_string.dart';
import 'package:tobeto_mobile_app/utils/themes/text_style.dart';

class ProjectPhotosCard extends StatelessWidget {
  const ProjectPhotosCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CenteredText(
          text: 'Projeden Kareler',
          style: TobetoTextStyle.poppins(context).captionBlackBold24,
        ),
        const VerticalPadding(),
        const Row(
          children: [
            CustomImageContainer(
              imagePath: ImagePath.ik1,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.all(1.5),
              widthFactor: 0.65,
            ),
          ],
        ),
        const VerticalPadding(),
        const Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomImageContainer(
              imagePath: ImagePath.ik2,
              alignment: Alignment.centerRight,
              padding: EdgeInsets.all(1.5),
              widthFactor: 0.65,
            ),
          ],
        ),
        const VerticalPadding(),
        const Row(
          children: [
            CustomImageContainer(
              imagePath: ImagePath.ik3,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.all(1.5),
              widthFactor: 0.65,
            ),
          ],
        ),
        const VerticalPadding(),
        const Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomImageContainer(
              imagePath: ImagePath.ik4,
              alignment: Alignment.centerRight,
              padding: EdgeInsets.all(1.5),
              widthFactor: 0.65,
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
            color: TobetoColor.card.grey.withOpacity(0.8),
            spreadRadius: 3,
            blurRadius: 5,
            offset: const Offset(0, 4), // changes position of shadow
          ),
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
