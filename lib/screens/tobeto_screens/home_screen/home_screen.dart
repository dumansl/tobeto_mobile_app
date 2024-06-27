import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_mobile_app/blocs/export_bloc.dart';

import 'package:tobeto_mobile_app/screens/dashboard_screen/widgets/fixed_appbar.dart';
import 'package:tobeto_mobile_app/screens/screens.dart';
import 'package:tobeto_mobile_app/screens/tobeto_screens/widgets/custom_logo.dart';
import 'package:tobeto_mobile_app/screens/tobeto_screens/tobeto_screens.dart';
import 'package:tobeto_mobile_app/services/shared_preferences_service.dart';
import 'package:tobeto_mobile_app/utils/constant/constants.dart';
import 'package:tobeto_mobile_app/utils/themes/text_style.dart';

class TobetoHomeScreen extends StatefulWidget {
  const TobetoHomeScreen({super.key});

  @override
  State<TobetoHomeScreen> createState() => _TobetoHomeScreenState();
}

class _TobetoHomeScreenState extends State<TobetoHomeScreen> {
  late SharedPreferencesService _sharedPreferencesService;

  @override
  void initState() {
    super.initState();
    _sharedPreferencesService = SharedPreferencesService();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _drawer(context),
      appBar: const FixedAppbar(
        isLeading: false,
        isTobetoScreen: true,
      ),
      body: _body(context),
    );
  }

  Drawer _drawer(BuildContext context) {
    bool value = context.read<ThemeBloc>().state == ThemeMode.dark;
    return Drawer(
      child: Padding(
        padding: EdgeInsets.only(
          top: ScreenPadding.padding32px,
          left: ScreenPadding.padding32px,
          right: ScreenPadding.padding32px,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Expanded(
              flex: 15,
              child: CustomLogo(
                height: 75,
                width: 200,
              ),
            ),
            Expanded(
              flex: 60,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _drawerTextButton(
                    context,
                    text: TobetoText.hambugerMenuAboutUs,
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const WhoAreWeScreen(),
                        ),
                      );
                    },
                  ),
                  _drawerTextButton(
                    context,
                    text: TobetoText.hambugerMenuWhatDoWeOffer,
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const WhatDoWeOfferScreen(),
                        ),
                      );
                    },
                  ),
                  _drawerTextButton(
                    context,
                    text: TobetoText.hambugerMenuOurTrainings,
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CatalogScreen(),
                        ),
                      );
                    },
                  ),
                  _drawerTextButton(
                    context,
                    text: TobetoText.hambugerMenuWhatHappeningTobeto,
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const WhatsHappeningIntobetoScreen(),
                        ),
                      );
                    },
                  ),
                  _drawerTextButton(
                    context,
                    text: TobetoText.tmapFAQBox,
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const FAQScreen(),
                        ),
                      );
                    },
                  ),
                  _drawerTextButton(
                    context,
                    text: TobetoText.hambugerMenuResources,
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ResourcesScreen(),
                        ),
                      );
                    },
                  ),
                  _drawerTextButton(
                    context,
                    text: TobetoText.hambugerMenuAboutUsCommunication,
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CommunicationScreen(),
                        ),
                      );
                    },
                  ),
                  _drawerTextButton(
                    context,
                    text: TobetoText.hambugerMenuIstanbulIsCodding,
                    onPressed: () {
                      if (_sharedPreferencesService.isLoggedIn()) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const DashboardScreen(),
                          ),
                        );
                      } else if (!_sharedPreferencesService.isLoggedIn()) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                      }
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      value ? Icons.nights_stay : Icons.wb_sunny,
                      color: value ? Colors.white : Colors.yellow,
                      size: IconSize.size35px,
                    ),
                    onPressed: () {
                      value = !value;
                      context.read<ThemeBloc>().add(ThemeChanged(value));
                    },
                  ),
                ],
              ),
            ),
            const Expanded(
              flex: 25,
              child: SizedBox(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _drawerTextButton(BuildContext context,
      {required String text, required VoidCallback onPressed}) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TobetoTextStyle.poppins(context).captionGrayBold18,
      ),
    );
  }

  Widget _body(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.light;
    final assetImagePath =
        isDarkMode ? 'assets/gifs/skills.gif' : 'assets/gifs/skilldark.gif';
    return Padding(
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
                      color: Theme.of(context).colorScheme.onSecondary,
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
                                    style: TobetoTextStyle.poppins(context)
                                        .captionBlackBold12,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 16),
                                  child: Text(
                                    TobetoText.tmainCard1Body,
                                    style: TobetoTextStyle.poppins(context)
                                        .captionBlackNormal12,
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
                    TextSpan(
                        text: 'Birlikte',
                        style: TobetoTextStyle.poppins(context)
                            .subtitlePurpleLight20),
                    TextSpan(
                        text: ' Büyüyoruz!',
                        style:
                            TobetoTextStyle.poppins(context).titlePurpleBold24),
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
                        borderRadius:
                            const BorderRadius.all(Radius.circular(30)),
                        color: Theme.of(context).colorScheme.onSecondary,
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
                                    color: const Color.fromARGB(
                                        255, 196, 133, 255),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Image.asset(ImagePath.news)),
                          ),
                          Text(
                            '8.000',
                            style: TobetoTextStyle.poppins(context)
                                .titlePurpleBold24,
                          ),
                          Text(
                            'Asenkron Eğitim İçeriği',
                            style: TobetoTextStyle.poppins(context)
                                .captionBlackThin12,
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
                        borderRadius:
                            const BorderRadius.all(Radius.circular(30)),
                        color: Theme.of(context).colorScheme.onSecondary,
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
                                    color: const Color.fromARGB(
                                        255, 196, 133, 255),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Image.asset(ImagePath.company)),
                          ),
                          Text(
                            '1.000',
                            style: TobetoTextStyle.poppins(context)
                                .titlePurpleBold24,
                          ),
                          Text(
                            'Saat Canlı Ders',
                            style: TobetoTextStyle.poppins(context)
                                .captionBlackThin12,
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
                      color: Theme.of(context).colorScheme.onSecondary,
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
                                  color: Colors.blueAccent,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Image.asset(ImagePath.graduationCap)),
                        ),
                        const Text(
                          '17.600',
                          style: TextStyle(
                              color: Colors.indigo,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Öğrenci',
                          style: TobetoTextStyle.poppins(context)
                              .captionBlackThin12,
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
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
                    width: double.infinity,
                    child: Column(
                      children: [
                        BlocBuilder<ThemeBloc, ThemeMode>(
                          builder: (context, state) {
                            return Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: TobetoColor.card.shadowColor
                                        .withOpacity(0.4),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: const Offset(
                                        2, 4), // changes position of shadow
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(50),
                              ),
                              width: double.infinity,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Image.asset(assetImagePath

                                    // Burada anahtar ekleyerek rebuild sağlıyoruz
                                    ),
                              ),
                            );
                          },
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(top: ScreenPadding.padding8px),
                          child: Text('Tobeto "İşte Başarı Modeli"mizi Keşfet!',
                              style: TobetoTextStyle.poppins(context)
                                  .titleBlackBold24,
                              textAlign: TextAlign.center),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 30, left: 10, right: 10, bottom: 20),
                          child: Text(
                            'Üyelerimize ücretsiz sunduğumuz, iş bulma ve işte başarılı olma sürecinde gerekli 80 tane davranış ifadesinden oluşan Tobeto "İşte Başarı Modeli" ile, profesyonellik yetkinliklerini ölç, raporunu gör',
                            style: TobetoTextStyle.poppins(context)
                                .subtitleBlackNormal20,
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
                                  builder: (context) =>
                                      const TobetoSuccesScreen(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: TobetoColor.purple),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Text(
                                'Hemen Başla',
                                style: TobetoTextStyle.poppins(context)
                                    .bodyWhiteBold16,
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
                      color: Theme.of(context).colorScheme.onSecondary,
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
                                style: TobetoTextStyle.poppins(context)
                                    .subtitleBlackNormal20,
                                textAlign: TextAlign.center),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(50)),
                              border: Border.all(
                                  color: TobetoColor.purple, width: 2),
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
                              style: TobetoTextStyle.poppins(context)
                                  .subtitleBlackBold20,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Text(
                            'Öğrenci',
                            style: TobetoTextStyle.poppins(context)
                                .captionBlackNormal12,
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
                  child: SizedBox(
                      height: 50, child: Image.asset(ImagePath.codecademy)),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: SizedBox(
                      height: 50, child: Image.asset(ImagePath.perculus)),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30, bottom: 20),
                  child: SizedBox(
                      height: 100, child: Image.asset(ImagePath.huawei)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
