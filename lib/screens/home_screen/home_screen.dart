import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tobeto_mobile_app/screens/home_screen/widgets/box.dart';
import 'package:tobeto_mobile_app/screens/home_screen/widgets/boxlong.dart';
import 'package:tobeto_mobile_app/screens/home_screen/widgets/rainbow.dart';
import 'package:tobeto_mobile_app/screens/screens.dart';
import 'package:tobeto_mobile_app/utils/constant/constants.dart';
import 'package:tobeto_mobile_app/utils/constant/text.dart';
import 'package:tobeto_mobile_app/utils/themes/text_style.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: ScreenPadding.padding12px),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            SizedBox(
              height: ScreenPadding.padding12px,
            ),
            Text(
              TobetoText.mainHeadline1,
              style: TobetoTextStyle.poppins.bodyBlackNormal16,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: ScreenPadding.padding12px,
            ),
            const Rainbow(),
            SizedBox(
              height: ScreenPadding.padding12px,
            ),
            Text(
              TobetoText.mainHeadline2,
              style: TobetoTextStyle.poppins.bodyBlackNormal16,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: ScreenPadding.padding12px,
            ),
            Text(
              TobetoText.mainHeadline3,
              style: TobetoTextStyle.poppins.subtitleBlackSemiBold20,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: ScreenPadding.padding12px,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Box(
                  text: TobetoText.mainCard1,
                  onTap: () {},
                ),
                Box(
                  text: TobetoText.mainCard2,
                  onTap: () {},
                ),
                Box(
                  text: TobetoText.mainCard3,
                  onTap: () {},
                ),
                Box(
                  text: TobetoText.mainCard4,
                  onTap: () {},
                ),
              ],
            ),
            SizedBox(
              height: ScreenPadding.padding12px,
            ),
            Column(
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
                      height: 90,
                      width: 360,
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
                                    style: TobetoTextStyle.poppins.captionBlackBold12,
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Text("Herkes için Kodlama", style: TobetoTextStyle.poppins.captionGrayBold12)
                                ],
                              ),
                              Row(
                                children: [
                                  const Icon(Icons.watch_later_outlined),
                                  Padding(
                                    padding: EdgeInsets.only(left: ScreenPadding.padding8px),
                                    child: const Text(
                                      "Herkes için Kodlama",
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Boxlong(
                      text: TobetoText.mainCard2title1,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProfileScreen(),
                            ));
                      },
                      buttonText: TobetoText.mainCardbuttontitle,
                    ),
                    Boxlong(
                      text: TobetoText.mainCard3title1,
                      onPressed: () {},
                      buttonText: TobetoText.mainCardbuttontitle,
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
