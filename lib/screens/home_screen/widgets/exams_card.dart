import 'package:flutter/material.dart';
import 'package:tobeto_mobile_app/utils/constant/colors.dart';
import 'package:tobeto_mobile_app/utils/constant/sizes.dart';
import 'package:tobeto_mobile_app/utils/themes/text_style.dart';

class ExamsCard extends StatelessWidget {
  const ExamsCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: ScreenPadding.padding12px,
        ),
        Padding(
          padding: EdgeInsets.only(left: ScreenPadding.padding8px),
          child: Text(
            "Sınavlarım",
            style: TobetoTextStyle.poppins.bodyBlackBold16,
          ),
        ),
        Row(
          children: [
            SizedBox(
              height: ScreenUtil.getHeight(context) * 0.18,
              width: ScreenUtil.getWidth(context) * 0.9,
              child: Card(
                color: TobetoColor.card.cream,
                elevation: 12,
                child: Padding(
                  padding: EdgeInsets.only(left: ScreenPadding.padding8px),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Herkes için Kodlama",
                            style: TobetoTextStyle.poppins.captionBlackBold18,
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text("Herkes için Kodlama",
                              style:
                                  TobetoTextStyle.poppins.captionGrayDarkBold15)
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.watch_later_outlined,
                            color: Colors.grey,
                          ),
                          Padding(
                            padding:
                                EdgeInsets.only(left: ScreenPadding.padding8px),
                            // ignore: prefer_const_constructors
                            child: Text(
                              "45 Dakika",
                              style:
                                  TobetoTextStyle.poppins.bodyGrayLightLight16,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: ScreenPadding.padding12px,
        ),
      ],
    );
  }
}
