import 'package:flutter/material.dart';
import 'package:tobeto_mobile_app/screens/application_screen/application_screen.dart';
import 'package:tobeto_mobile_app/screens/home_screen/widgets/box.dart';
import 'package:tobeto_mobile_app/screens/home_screen/widgets/boxlong.dart';
import 'package:tobeto_mobile_app/screens/home_screen/widgets/exams_card.dart';
import 'package:tobeto_mobile_app/screens/home_screen/widgets/rainbow.dart';
import 'package:tobeto_mobile_app/utils/constant/constants.dart';
import 'package:tobeto_mobile_app/utils/themes/text_style.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: ScreenPadding.padding12px,
      ),
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
          Expanded(
            child: Text(
              TobetoText.mainHeadline2,
              style: TobetoTextStyle.poppins.bodyBlackNormal16,
              textAlign: TextAlign.center,
            ),
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
              Expanded(
                child: Box(
                  text: TobetoText.mainCard1,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ApplicationScreen()),
                    );
                  },
                ),
              ),
              Expanded(
                child: Box(
                  text: TobetoText.mainCard2,
                  onTap: () {},
                ),
              ),
              Expanded(
                child: Box(
                  text: TobetoText.mainCard3,
                  onTap: () {},
                ),
              ),
              Expanded(
                child: Box(
                  text: TobetoText.mainCard4,
                  onTap: () {},
                ),
              ),
            ],
          ),
          SizedBox(
            height: ScreenPadding.padding12px,
          ),
          const ExamsCard(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 45,
                child: Boxlong(
                  text: TobetoText.mainCard2title1,
                  onPressed: () {},
                  buttonText: TobetoText.mainCardbuttontitle,
                ),
              ),
              const Expanded(flex: 10, child: SizedBox()),
              Expanded(
                flex: 45,
                child: Boxlong(
                  text: TobetoText.mainCard3title1,
                  onPressed: () {},
                  buttonText: TobetoText.mainCardbuttontitle,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
