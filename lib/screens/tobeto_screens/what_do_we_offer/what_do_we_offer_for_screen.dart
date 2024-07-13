import 'package:flutter/material.dart';
import 'package:tobeto_mobile_app/screens/dashboard_screen/widgets/fixed_appbar.dart';
import 'package:tobeto_mobile_app/screens/tobeto_screens/communication_screen/communication_screen.dart';
import 'package:tobeto_mobile_app/utils/constant/constants.dart';
import 'package:tobeto_mobile_app/utils/themes/text_style.dart';

class WhatDoWeOfferForScreen extends StatelessWidget {
  const WhatDoWeOfferForScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: FixedAppbar(
        isTobetoScreen: true,
      ),
      body: WhatDoWeOfferFor(),
    );
  }
}

class WhatDoWeOfferFor extends StatelessWidget {
  const WhatDoWeOfferFor({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(ScreenPadding.padding8px),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surfaceDim,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.all(ScreenPadding.padding16px),
                child: Row(
                  children: [
                    Expanded(
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                          children: [
                            TextSpan(text: TobetoText.tcompaniesCard1BodyRich1),
                            TextSpan(
                              text: TobetoText.tcompaniesCard1BodyRich2,
                              style: const TextStyle(color: TobetoColor.purple),
                            ),
                            TextSpan(text: TobetoText.tcompaniesCard1BodyRich3),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: ScreenUtil.getWidth(context) * 0.04,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        ImagePath.ekip3,
                        width: ScreenUtil.getWidth(context) * 0.45,
                        height: ScreenUtil.getHeight(context) * 0.14,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: TobetoColor.purple,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.all(ScreenPadding.padding16px),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        TobetoText.tcompaniesCard2Title,
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      TobetoText.tcompaniesCard2Body,
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: ScreenPadding.padding16px),
                      child: buildOptionCard(
                        TobetoText.tcompaniesCard3Title,
                        TobetoText.tcompaniesCard3Body,
                        context,
                      ),
                    ),
                    buildOptionCard(
                      TobetoText.tcompaniesCard4Title,
                      TobetoText.tcompaniesCard4Body,
                      context,
                    ),
                    buildOptionCard(
                      TobetoText.tcompaniesCard5Title,
                      TobetoText.tcompaniesCard5Body,
                      context,
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF1D4499),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.all(ScreenPadding.padding16px),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        TobetoText.tcompaniesCard6Title,
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: ScreenPadding.padding8px),
                      child: Text(
                        TobetoText.tcompaniesCard6Body,
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 14,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: ScreenPadding.padding16px),
                      child: buildOptionCard(
                        TobetoText.tcompaniesCard7Title,
                        TobetoText.tcompaniesCard7Body,
                        context,
                      ),
                    ),
                    buildOptionCard(
                      TobetoText.tcompaniesCard8Title,
                      TobetoText.tcompaniesCard8Body,
                      context,
                    ),
                    buildOptionCard(
                      TobetoText.tcompaniesCard9Title,
                      TobetoText.tcompaniesCard9Body,
                      context,
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surfaceDim,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.all(ScreenPadding.padding16px),
                child: Column(
                  children: [
                    Text(
                      TobetoText.tcompaniesCard10Body,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: ScreenPadding.padding16px),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CommunicationScreen(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: TobetoColor.purple,
                          foregroundColor: TobetoColor.text.white,
                          textStyle: TobetoTextStyle.poppins(context).captionMediumWhite14,
                          padding: EdgeInsets.symmetric(
                            horizontal: ScreenPadding.padding32px,
                            vertical: ScreenPadding.padding16px,
                          ),
                        ),
                        child: Text(
                          TobetoText.tcompaniesCard10ContactButton,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildOptionCard(String title, String description, BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: ScreenPadding.padding4px),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.tertiary,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.all(ScreenPadding.padding16px),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                title,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: ScreenUtil.getHeight(context) * 0.01),
            Text(
              description,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 12,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
