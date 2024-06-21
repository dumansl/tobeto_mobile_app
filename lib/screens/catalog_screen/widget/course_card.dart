import 'package:flutter/material.dart';

import 'package:tobeto_mobile_app/utils/constant/colors.dart';
import 'package:tobeto_mobile_app/utils/constant/image_string.dart';
import 'package:tobeto_mobile_app/utils/constant/sizes.dart';
import 'package:tobeto_mobile_app/utils/themes/text_style.dart';

class CatalogCourseCardsmall extends StatelessWidget {
  final String courseName;
  final String courseTeacher;
  final String rank;
  final double width;
  final double height;
  final String imagePath;
  final VoidCallback onPressed; // Updated parameter name

  const CatalogCourseCardsmall({
    super.key,
    required this.courseName,
    required this.courseTeacher,
    required this.rank,
    required this.width,
    required this.height,
    required this.imagePath,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: ScreenPadding.padding12px),
      child: InkWell(
        onTap: onPressed,
        child: Container(
          width: width,
          height: height, // Use the width parameter
          margin: EdgeInsets.only(right: ScreenPadding.padding8px),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: TobetoColor.card.shadowColor.withOpacity(0.4),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(2, 4), // changes position of shadow
              ),
            ],
            color: TobetoColor.card.cream,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(16)),
                    image: DecorationImage(
                      image: NetworkImage(
                          imagePath), // Use the imagePath parameter
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  Container(
                    width: ScreenUtil.getWidth(context) * 0.47,
                    color: TobetoColor.background.lightGrey,
                    // Set background color to white
                    padding: EdgeInsets.all(ScreenPadding.padding8px),
                    child: Text(
                      courseName,
                      style:
                          TobetoTextStyle.poppins(context).captionBlackBold12,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: TobetoColor.background.lightGrey,
                      borderRadius: const BorderRadius.vertical(
                        bottom: Radius.circular(12),
                      ), // Rounded bottom border
                    ),
                    width: ScreenUtil.getWidth(context) * 0.47,
                    padding: EdgeInsets.symmetric(
                        horizontal: ScreenPadding.padding8px),
                    child: Row(
                      children: [
                        SizedBox(
                          width: ScreenUtil.getWidth(context) * 0.05,
                          child: Image.asset(ImagePath.personalInformation),
                        ),
                        SizedBox(width: ScreenUtil.getWidth(context) * 0.00),
                        Text(
                          courseTeacher,
                          style: TobetoTextStyle.poppins(context)
                              .captionBlackBold12,
                        ),
                        SizedBox(width: ScreenUtil.getWidth(context) * 0.045),
                        const Icon(Icons.star, color: Colors.black, size: 16),
                        Text(rank,
                            style: TobetoTextStyle.poppins(context)
                                .captionBlackBold12),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 2),
            ],
          ),
        ),
      ),
    );
  }
}
