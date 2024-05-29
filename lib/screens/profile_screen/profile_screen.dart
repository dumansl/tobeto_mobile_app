import 'package:flutter/material.dart';
import 'package:tobeto_mobile_app/utils/constant/constants.dart';
import 'package:tobeto_mobile_app/utils/themes/text_style.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TobetoColor.chart.cream,
        title: Text(TobetoText.profileAppBar, style: TobetoTextStyle.poppins.headlinePurpleBold32),
        centerTitle: true,
        leading: IconButton(
          icon: Image.asset(ImagePath.purpleBack),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const CircleAvatar(
              radius: 25,
              backgroundColor: Colors.transparent,
              backgroundImage: AssetImage(ImagePath.profilePhoto),
            ),
          ),
        ],
      ),
      backgroundColor: TobetoColor.chart.cream,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(ScreenPadding.padding16px),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 5.0),
              child: Center(
                child: CircleAvatar(
                  radius: 75,
                  backgroundColor: Colors.transparent,
                  backgroundImage: AssetImage(ImagePath.profilePhoto),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () {},
                icon: Image.asset(ImagePath.organizer),
              ),
            ),
            LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return ConstrainedBox(
                  constraints: const BoxConstraints(
                    minHeight: 0,
                    maxHeight: double.infinity,
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: Card(
                          color: TobetoColor.chart.white,
                          margin: const EdgeInsets.only(bottom: 5),
                          child: Padding(
                            padding: EdgeInsets.all(ScreenPadding.padding16px),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                iconAndText(ImagePath.user, TobetoText.profileName),
                                iconAndText(ImagePath.birthdate, TobetoText.profileBirthday),
                                iconAndText(ImagePath.mail, TobetoText.profileEmail),
                                iconAndText(ImagePath.phone, TobetoText.profilePhoneNumber),
                                iconAndText(ImagePath.gender, TobetoText.profileGender),
                                iconAndText(ImagePath.soldier, TobetoText.profileMilitaryStuation),
                                iconAndText(ImagePath.disabled, TobetoText.profileDisableStuation),
                              ],
                            ),
                          ),
                        ),
                      ),
                      titleCards(TobetoText.profileAboutMe),
                      titleCards(
                        TobetoText.profileMySkills,
                      ),
                      titleCards(TobetoText.profileLanguages),
                      titleCards(TobetoText.profileMyCertificate),
                      titleCards(TobetoText.profileProjectAwards),
                      titleCards(TobetoText.profileWorkExperiences),
                      titleCards(TobetoText.profileInternship),
                      titleCards(TobetoText.profileCommunity),
                      titleCards(TobetoText.profileEducations),
                      titleCards(TobetoText.profileTobetoWorkSuccess, onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Tobeto Work Success Başla Butonuna Tıklandı!')));
                      }),
                      titleCards(TobetoText.profileTobetoTests),
                      titleCards(TobetoText.profileTobetoEducations),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget iconAndText(String iconPath, String text) {
    return Row(
      children: [
        Image.asset(iconPath, width: 55, height: 55),
        const SizedBox(width: 8),
        Text(text, style: TobetoTextStyle.poppins.bodyGrayLightLight16),
      ],
    );
  }
}

Widget titleCards(String title, {VoidCallback? onPressed}) {
  return SizedBox(
    width: double.infinity,
    child: Card(
      color: TobetoColor.chart.white,
      margin: const EdgeInsets.only(bottom: 5),
      child: Padding(
        padding: EdgeInsets.all(ScreenPadding.padding16px),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title, style: TobetoTextStyle.poppins.bodyBlackBold16),
                if (onPressed != null)
                  ElevatedButton(
                    onPressed: onPressed,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: TobetoColor.purple, // Arka plan rengi
                      foregroundColor: TobetoColor.text.white, // Metin rengi
                    ),
                    child: Text('Başla', style: TobetoTextStyle.poppins.captionWhiteSemiBold15),
                  ),
              ],
            ),
            const Divider(
              thickness: 0.7,
              color: TobetoColor.purple,
            )
          ],
        ),
      ),
    ),
  );
}
