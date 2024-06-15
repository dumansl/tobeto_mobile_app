import 'package:flutter/material.dart';
import 'package:tobeto_mobile_app/screens/profile_editting/profile_editting_screen.dart';
import 'package:tobeto_mobile_app/utils/constant/constants.dart';
import 'package:tobeto_mobile_app/utils/themes/text_style.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TobetoColor.card.cream,
        title: Text(TobetoText.profileAppBar,
            style: TobetoTextStyle.poppins(context).headlinePurpleBold32),
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
      backgroundColor: TobetoColor.card.cream,
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
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => UserPage()));
                },
                icon: Image.asset(ImagePath.organizer),
              ),
            ),
            MainTitleCard(
              iconAndTexts: [
                IconAndText(
                  icon: ImagePath.user,
                  text: TobetoText.profileName,
                  value: "Ekrem TEK",
                ),
                IconAndText(
                  icon: ImagePath.birthdate,
                  text: TobetoText.profileBirthday,
                  value: "19.01.1989",
                ),
                IconAndText(
                  icon: ImagePath.mail,
                  text: TobetoText.profileEmail,
                  value: "ekremtek@gmail.com",
                ),
                IconAndText(
                  icon: ImagePath.phone,
                  text: TobetoText.profilePhoneNumber,
                  value: "+90 (533) 669 75 68",
                ),
                IconAndText(
                  icon: ImagePath.gender,
                  text: TobetoText.profileGender,
                  value: "Erkek",
                ),
                IconAndText(
                  icon: ImagePath.soldier,
                  text: TobetoText.profileMilitaryStuation,
                  value: "Yapıldı",
                ),
                IconAndText(
                  icon: ImagePath.disabled,
                  text: TobetoText.profileDisableStuation,
                  value: "Yok",
                ),
              ],
            ),
            TitleCard(
              title: TobetoText.profileAboutMe,
              content: Text(
                'Elektronik ve Haberleşme Mühendisiyim. Mühendislik alanında farklı sektörlerde toplam 12 yıl deneyimim bulunmaktadır.',
                style: TobetoTextStyle.poppins(context).bodyGrayDarkNormal16,
              ),
            ),
            TitleCard(
              title: TobetoText.profileMySkills,
              content: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TwoLineCard(
                    line1: '',
                    line2: 'Takım Yönetimi',
                  ),
                  TwoLineCard(
                    line1: '',
                    line2: 'Mobil Geliştirici',
                  ),
                  TwoLineCard(
                    line1: '',
                    line2: 'Çok Görevli Çalışma',
                  ),
                ],
              ),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return const PopUpDialog();
                  },
                );
              },
              icon: ImagePath.eye,
            ),
            TitleCard(
              title: TobetoText.profileLanguages,
              content: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TwoLineCard(
                    line2: 'Türkçe',
                    line1: 'Ana Dil',
                  ),
                  TwoLineCard(
                    line2: 'İngilizce',
                    line1: 'Orta Seviye (B1-B2)',
                  ),
                ],
              ),
            ),
            TitleCard(
              title: TobetoText.profileMyCertificate,
              content: Text(
                'Henüz bir sertifika eklemediniz.',
                style: TobetoTextStyle.poppins(context).bodyGrayDarkNormal16,
              ),
            ),
            TitleCard(
              title: TobetoText.profileProjectAwards,
              content: Text(
                'Henüz bir proje veya ödül eklemediniz.',
                style: TobetoTextStyle.poppins(context).bodyGrayDarkNormal16,
              ),
            ),
            TitleCard(
              title: TobetoText.profileWorkExperiences,
              content: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TwoLineCard(
                    line1: 'Temmuz 2013 - Ekim 2015',
                    line2: 'Akbank - Kıdemli Mühendis',
                  ),
                ],
              ),
            ),
            TitleCard(
              title: TobetoText.profileInternship,
              content: Text(
                'Henüz bir staj veya gönüllü çalışma deneyimi eklemediniz.',
                style: TobetoTextStyle.poppins(context).bodyGrayDarkNormal16,
              ),
            ),
            TitleCard(
              title: TobetoText.profileCommunity,
              content: Text(
                'Henüz bir topluluk eklemediniz.',
                style: TobetoTextStyle.poppins(context).bodyGrayDarkNormal16,
              ),
            ),
            TitleCard(
              title: TobetoText.profileEducations,
              content: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TwoLineCard(
                    line1: 'Ocak 2009 - Haziran 2013',
                    line2: 'Kocaeli - ElohabMüh',
                  ),
                ],
              ),
            ),
            TitleCard(
              title: TobetoText.profileTobetoWorkSuccess,
              content: Column(
                children: [
                  Text(
                    'Henüz Tobeto Başarı Testi¨ne girmediniz.',
                    style:
                        TobetoTextStyle.poppins(context).bodyGrayDarkNormal16,
                    textAlign: TextAlign.left,
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text(
                                  'Tobeto Work Success Başla Butonuna Tıklandı!')),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: TobetoColor.purple,
                        foregroundColor: TobetoColor.text.white,
                      ),
                      child: Text('Başla',
                          style: TobetoTextStyle.poppins(context)
                              .captionWhiteSemiBold15),
                    ),
                  ),
                ],
              ),
            ),
            TitleCard(
              title: TobetoText.profileTobetoTests,
              content: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TwoLineCard(
                    line1: '31.05.2024',
                    line2: 'Full Stack - Not: 60',
                  ),
                ],
              ),
            ),
            TitleCard(
              title: TobetoText.profileTobetoEducations,
              content: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TwoLineCard(
                    line1: '22.09.2023 - Devam Ediyor...',
                    line2: 'Hoşgeldin Buluşması - 4',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MainTitleCard extends StatelessWidget {
  final List<IconAndText> iconAndTexts;

  const MainTitleCard({super.key, required this.iconAndTexts});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) =>
            ConstrainedBox(
              constraints: const BoxConstraints(
                minHeight: 0,
                maxHeight: double.infinity,
              ),
              child: Column(children: [
                SizedBox(
                  width: double.infinity,
                  child: Card(
                    color: TobetoColor.card.white,
                    margin: const EdgeInsets.only(bottom: 5),
                    child: Padding(
                      padding: EdgeInsets.all(ScreenPadding.padding16px),
                      child: Column(
                        children: iconAndTexts,
                      ),
                    ),
                  ),
                )
              ]),
            ));
  }
}

class IconAndText extends StatelessWidget {
  final String icon;
  final String text;
  final String value;

  const IconAndText({
    super.key,
    required this.icon,
    required this.text,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(icon),
        const SizedBox(width: 15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(text,
                style: TobetoTextStyle.poppins(context).bodyGrayDarkSemiBold16),
            Text(value,
                style: TobetoTextStyle.poppins(context).captionGrayBold18),
          ],
        ),
      ],
    );
  }
}

class TitleCard extends StatelessWidget {
  final String title;
  final Widget content;
  final Function()? onTap;
  final String? icon;

  const TitleCard({
    super.key,
    required this.title,
    required this.content,
    this.onTap,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        color: TobetoColor.card.white,
        margin: const EdgeInsets.only(bottom: 5),
        child: Padding(
          padding: EdgeInsets.all(ScreenPadding.padding16px),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(title,
                      style: TobetoTextStyle.poppins(context).bodyBlackBold16),
                  if (icon != null)
                    InkWell(
                      onTap: onTap,
                      child: Image.asset(icon!),
                    ),
                ],
              ),
              const Divider(
                thickness: 0.7,
                color: TobetoColor.purple,
              ),
              content,
            ],
          ),
        ),
      ),
    );
  }
}

class TwoLineCard extends StatelessWidget {
  final String? line1;
  final String line2;

  const TwoLineCard({super.key, this.line1, required this.line2});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        color: TobetoColor.card.white,
        margin: const EdgeInsets.only(bottom: 5),
        child: Padding(
          padding: EdgeInsets.all(ScreenPadding.padding16px),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(line1!,
                  style: TobetoTextStyle.poppins(context).captionGrayNormal12),
              Text(line2,
                  style:
                      TobetoTextStyle.poppins(context).bodyGrayDarkSemiBold16),
            ],
          ),
        ),
      ),
    );
  }
}

class PopUpDialog extends StatelessWidget {
  const PopUpDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: TobetoColor.card.cream,
      title: Text(TobetoText.profileMySkills),
      content: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          DialogCard(skill: 'Takım Yönetimi'),
          DialogCard(skill: 'Mobil Geliştiricilik'),
          DialogCard(skill: 'Çok Görevli Çalışma'),
          DialogCard(skill: 'Aktif Dinleme'),
          DialogCard(skill: 'İletişim'),
        ],
      ),
    );
  }
}

class DialogCard extends StatelessWidget {
  final String skill;

  const DialogCard({super.key, required this.skill});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        color: TobetoColor.card.white,
        margin: const EdgeInsets.only(bottom: 5),
        child: Padding(
          padding: EdgeInsets.all(ScreenPadding.padding16px),
          child: Text(skill,
              style: TobetoTextStyle.poppins(context).bodyGrayDarkSemiBold16),
        ),
      ),
    );
  }
}
