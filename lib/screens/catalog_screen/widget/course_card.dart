import 'package:flutter/material.dart';
import 'package:tobeto_mobile_app/utils/constant/constants.dart';
import 'package:tobeto_mobile_app/utils/constant/sizes.dart';
import 'package:tobeto_mobile_app/utils/themes/text_style.dart';

class CatalogCourseCardsmall extends StatelessWidget {
  final String courseName;
  final String courseTeacher;
  final String rank;
  final String imagePath;
  final VoidCallback onPressed;
  const CatalogCourseCardsmall(
      {super.key,
      required this.courseName,
      required this.courseTeacher,
      required this.rank,
      required this.imagePath,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Padding(
        padding: EdgeInsets.only(bottom: ScreenPadding.padding8px),
        child: Container(
          width: ScreenUtil.getWidth(context) * 0.50,
          margin: EdgeInsets.only(right: ScreenPadding.padding8px),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).colorScheme.shadow,
                spreadRadius: 0.5,
                blurRadius: 5,
                offset: const Offset(2, 4), // changes position of shadow
              ),
            ],
            borderRadius: BorderRadius.all(
              Radius.circular(SizeRadius.radius8px),
            ),
          ),
          child: Column(
            children: [
              Expanded(
                flex: 60,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
                    image: DecorationImage(
                      image: NetworkImage(imagePath),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 40,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: ScreenPadding.padding4px,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        courseName,
                        style: TobetoTextStyle.poppins(context).captionMediumBlack12,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Row(
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.person,
                                  size: IconSize.size16px,
                                ),
                                Text(
                                  courseTeacher,
                                  style: TobetoTextStyle.poppins(context).captionMediumBlack12,
                                ),
                              ],
                            ),
                            const Spacer(),
                            Row(
                              children: [
                                Icon(
                                  Icons.star_rate_rounded,
                                  size: IconSize.size16px,
                                ),
                                Text(
                                  rank,
                                  style: TobetoTextStyle.poppins(context).captionMediumBlack12,
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
