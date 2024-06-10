import 'package:flutter/material.dart';
import 'package:tobeto_mobile_app/utils/constant/colors.dart';
import 'package:tobeto_mobile_app/utils/constant/sizes.dart';
import 'package:tobeto_mobile_app/utils/themes/text_style.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.categoryText});
  final String categoryText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: ScreenPadding.padding12px),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: ScreenUtil.getWidth(context) * 0.23,
            height: ScreenUtil.getHeight(context) * 0.051,
            padding: const EdgeInsets.all(1), // Rainbow border thickness
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  TobetoColor.purple,
                  TobetoColor.rainbow.lineargreen,
                  TobetoColor.rainbow.linaergreenv2,
                  TobetoColor.rainbow.linearyellow,
                  TobetoColor.purple
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: InkWell(
              onTap: () {},
              child: Container(
                height: ScreenUtil.getHeight(context) * 0.056,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                    child: Text(
                  categoryText,
                  style: TobetoTextStyle.poppins.captionBlackBold18,
                )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
