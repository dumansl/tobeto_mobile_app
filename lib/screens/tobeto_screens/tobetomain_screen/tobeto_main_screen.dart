import 'package:flutter/material.dart';
import 'package:tobeto_mobile_app/screens/screens.dart';
import 'package:tobeto_mobile_app/utils/constant/constants.dart';
import 'package:tobeto_mobile_app/utils/themes/text_style.dart';

class TobetoMainScreen extends StatelessWidget {
  const TobetoMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TobetoColor.card.cream,
        title: Padding(
          padding: EdgeInsets.all(ScreenPadding.padding24px),
          child: Image.asset(ImagePath.greyTobeto),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Image.asset(ImagePath.purpleBack),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const LoginScreen(),
              ),
            );
          },
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
      body: Padding(
        padding: EdgeInsets.all(ScreenPadding.padding16px),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 70),
                    child: Container(
                      decoration: BoxDecoration(
                        color: TobetoColor.card.lightGrey,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(50),
                        ),
                      ),
                      height: 200,
                      width: double.infinity,
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 25),
                        child: Container(
                          height: 150,
                          width: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            image: const DecorationImage(
                              image: AssetImage(ImagePath.ekip3),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 16),
                                    child: Text(
                                      TobetoText.tmainCard1Title,
                                      style: TobetoTextStyle.poppins(context).captionBlackBold12,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 16),
                                    child: Text(
                                      TobetoText.tmainCard1Body,
                                      style: TobetoTextStyle.poppins(context).captionBlackNormal12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 16),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(text: 'Birlikte', style: TobetoTextStyle.poppins(context).subtitlePurpleLight20),
                      TextSpan(text: ' Büyüyoruz!', style: TobetoTextStyle.poppins(context).titlePurpleBold24),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35.0),
                      gradient: LinearGradient(
                        colors: [
                          TobetoColor.card.lightGrey,
                          TobetoColor.card.lightGrey,
                          TobetoColor.rainbow.linearpurple,
                          TobetoColor.rainbow.linearpurple,
                          TobetoColor.card.lightGrey,
                          TobetoColor.card.lightGrey,
                        ],
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(30)),
                          color: TobetoColor.icon.grey,
                        ),
                        height: 120,
                        width: 120,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 4),
                              child: Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      color: const Color.fromARGB(255, 196, 133, 255),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Image.asset(ImagePath.news)),
                            ),
                            Text(
                              '8.000',
                              style: TobetoTextStyle.poppins(context).titlePurpleBold24,
                            ),
                            Text(
                              'Asenkron Eğitim İçeriği',
                              style: TobetoTextStyle.poppins(context).captionBlackThin12,
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35.0),
                      gradient: LinearGradient(
                        colors: [
                          TobetoColor.card.lightGrey,
                          TobetoColor.card.lightGrey,
                          TobetoColor.rainbow.linearpurple,
                          TobetoColor.rainbow.linearpurple,
                          TobetoColor.card.lightGrey,
                          TobetoColor.card.lightGrey,
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(30)),
                          color: TobetoColor.icon.grey,
                        ),
                        height: 120,
                        width: 120,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 4),
                              child: Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      color: const Color.fromARGB(255, 196, 133, 255),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Image.asset(ImagePath.company)),
                            ),
                            Text(
                              '1.000',
                              style: TobetoTextStyle.poppins(context).titlePurpleBold24,
                            ),
                            Text(
                              'Saat Canlı Ders',
                              style: TobetoTextStyle.poppins(context).captionBlackThin12,
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(33.0),
                    gradient: LinearGradient(
                      colors: [
                        TobetoColor.card.lightGrey,
                        TobetoColor.card.lightGrey,
                        Colors.indigo,
                        Colors.indigo,
                        TobetoColor.card.lightGrey,
                        TobetoColor.card.lightGrey,
                      ],
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(30)),
                        color: TobetoColor.icon.grey,
                      ),
                      height: 120,
                      width: 120,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 4),
                            child: Container(
                                width: 40,
                                height: 40,
                                decoration:
                                    BoxDecoration(color: Colors.blueAccent, borderRadius: BorderRadius.circular(20)),
                                child: Image.asset(ImagePath.graduationCap)),
                          ),
                          const Text(
                            '17.600',
                            style: TextStyle(color: Colors.indigo, fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Öğrenci',
                            style: TobetoTextStyle.poppins(context).captionBlackThin12,
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 16),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(33.0),
                    gradient: LinearGradient(
                      colors: [
                        TobetoColor.card.white,
                        TobetoColor.card.white,
                        TobetoColor.purple,
                        TobetoColor.purple,
                        TobetoColor.purple,
                        TobetoColor.purple,
                        TobetoColor.purple,
                        TobetoColor.card.white,
                        TobetoColor.card.white,
                      ],
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(30)),
                        color: TobetoColor.card.white,
                      ),
                      width: double.infinity,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 4),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(width: double.infinity, child: Image.asset(ImagePath.mainScreenGif)),
                            ),
                          ),
                          Text('Tobeto "İşte Başarı Modeli"mizi Keşfet!',
                              style: TobetoTextStyle.poppins(context).titleBlackBold24, textAlign: TextAlign.center),
                          Padding(
                            padding: const EdgeInsets.only(top: 30, left: 10, right: 10, bottom: 20),
                            child: Text(
                              'Üyelerimize ücretsiz sunduğumuz, iş bulma ve işte başarılı olma sürecinde gerekli 80 tane davranış ifadesinden oluşan Tobeto "İşte Başarı Modeli" ile, profesyonellik yetkinliklerini ölç, raporunu gör',
                              style: TobetoTextStyle.poppins(context).subtitleBlackNormal20,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const TobetoSuccesScreen(),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(backgroundColor: TobetoColor.purple),
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Text(
                                  'Hemen Başla',
                                  style: TobetoTextStyle.poppins(context).bodyWhiteBold16,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Text(
                TobetoText.tmainHeadline2,
                style: TobetoTextStyle.poppins(context).titleBlackBold24,
              ),
              Text(
                TobetoText.tmainHeadline3,
                style: TobetoTextStyle.poppins(context).captionBlackNormal12,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 16),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(33.0),
                    gradient: LinearGradient(
                      colors: [
                        TobetoColor.card.white,
                        TobetoColor.card.white,
                        TobetoColor.purple,
                        TobetoColor.purple,
                        TobetoColor.purple,
                        TobetoColor.purple,
                        TobetoColor.purple,
                        TobetoColor.card.white,
                        TobetoColor.card.white,
                      ],
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(30)),
                        color: TobetoColor.card.white,
                      ),
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 30),
                              child: Text(
                                  'Tobeto ve İstanbul Kodluyor Projesi, kariyerimde kaybolmuş hissettiğim bir dönemde karşıma çıktı ve gerçekten bir pusula gibi yol gösterdi. Artık hangi yöne ilerleyeceğim konusunda daha eminim. Tobeto ailesine minnettarım, benim için gerçek bir destek ve ilham kaynağı oldular. İyi ki varsınız, Tobeto ailesi.',
                                  style: TobetoTextStyle.poppins(context).subtitleBlackNormal20,
                                  textAlign: TextAlign.center),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(Radius.circular(50)),
                                border: Border.all(color: TobetoColor.purple, width: 2),
                                color: TobetoColor.card.white,
                                image: const DecorationImage(
                                  image: AssetImage(ImagePath.student),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              height: 100,
                              width: 100,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 30, bottom: 10),
                              child: Text(
                                'Zeynep KOŞUN',
                                style: TobetoTextStyle.poppins(context).subtitleBlackBold20,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Text(
                              'Öğrenci',
                              style: TobetoTextStyle.poppins(context).captionBlackNormal12,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Text(
                TobetoText.tmainHeadline4,
                style: TobetoTextStyle.poppins(context).titleBlackBold24,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Image.asset(ImagePath.enocta),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Image.asset(ImagePath.advancity),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: SizedBox(height: 50, child: Image.asset(ImagePath.codecademy)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: SizedBox(height: 50, child: Image.asset(ImagePath.perculus)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30, bottom: 20),
                    child: SizedBox(height: 100, child: Image.asset(ImagePath.huawei)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
