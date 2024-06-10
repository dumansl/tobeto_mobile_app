import 'package:flutter/material.dart';
import 'package:tobeto_mobile_app/utils/constant/colors.dart';
import 'package:tobeto_mobile_app/utils/constant/image_string.dart';
import 'package:tobeto_mobile_app/utils/constant/sizes.dart';
import 'package:tobeto_mobile_app/utils/constant/text.dart';
import 'package:tobeto_mobile_app/utils/themes/text_style.dart';

class CategorySearchBar extends StatelessWidget {
  const CategorySearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
            child: IconButton(
                onPressed: () {}, icon: Image.asset(ImagePath.purpleFilter))),
        Container(
          width: ScreenUtil.getWidth(context) * 0.8,
          height: ScreenUtil.getHeight(context) * 0.06,
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
            borderRadius: BorderRadius.circular(100),
          ),
          child: Container(
            height: ScreenUtil.getHeight(context) * 0.056,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(100),
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: TobetoText.mainSearch,
                hintStyle: TobetoTextStyle.poppins.captionLightGrayThin18,
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: TobetoColor.card.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
