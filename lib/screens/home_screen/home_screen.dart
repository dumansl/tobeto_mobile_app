// TO DO : Emrah Yasin Işık
import 'package:flutter/material.dart';
import 'package:tobeto_mobile_app/screens/home_screen/widgets/box.dart';
import 'package:tobeto_mobile_app/screens/home_screen/widgets/rainbow.dart';
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
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            Text(
              TobetoText.mainHeadline1,
              style: TobetoTextStyle.poppins.bodyBlackNormal16,
            ),
            const Rainbow(),
            Text(
              TobetoText.mainHeadline2,
              style: TobetoTextStyle.poppins.bodyBlackNormal16,
            ),
            Text(
              TobetoText.mainHeadline3,
              style: TobetoTextStyle.poppins.subtitleBlackSemiBold20,
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
            Row(
              children: [
                Text(
                  "Sınavlarım",
                  style: TextStyle(),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
