import 'package:flutter/material.dart';
import 'package:tobeto_mobile_app/utils/constant/colors.dart';
import 'package:tobeto_mobile_app/utils/constant/image_string.dart';
import 'package:tobeto_mobile_app/utils/constant/sizes.dart';
import 'package:tobeto_mobile_app/utils/themes/text_style.dart';

class CatalogCourseCardBig extends StatelessWidget {
  final String courseName;
  final String courseTeacher;
  final String rank;
  final double width;
  final double height;
  final String imagePath; // Updated parameter name

  const CatalogCourseCardBig({
    super.key,
    required this.courseName,
    required this.courseTeacher,
    required this.rank,
    required this.width, // Parameter for width
    required this.imagePath,
    required this.height, // Parameter for image URL
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: ScreenPadding.padding12px),
      child: Container(
        width: width,
        height: height, // Use the width parameter

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
                    image:
                        NetworkImage(imagePath), // Use the imagePath parameter
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Column(
              children: [
                Container(
                  width: ScreenUtil.getWidth(context) * 1,
                  color: TobetoColor.background.lightGrey,
                  // Set background color to white
                  margin: EdgeInsets.only(left: ScreenPadding.padding16px),
                  child: Text(
                    courseName,
                    style: TobetoTextStyle.poppins(context).titleBlackBold24,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: TobetoColor.background.lightGrey,
                    borderRadius: const BorderRadius.vertical(
                      bottom: Radius.circular(12),
                    ), // Rounded bottom border
                  ),
                  padding: EdgeInsets.symmetric(
                      horizontal: ScreenPadding.padding8px),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: ScreenUtil.getWidth(context) * 0.1,
                            child: Image.asset(ImagePath.personalInformation),
                          ),
                          Text(
                            courseTeacher,
                            style: TobetoTextStyle.poppins(context)
                                .bodyBlackNormal16,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: TobetoColor.purple,
                            size: ScreenUtil.getWidth(context) * 0.08,
                          ),
                          SizedBox(
                            width: ScreenUtil.getWidth(context) * 0.01,
                          ),
                          Text(rank,
                              style: TobetoTextStyle.poppins(context)
                                  .bodyBlackNormal16),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 2),
          ],
        ),
      ),
    );
  }
}
