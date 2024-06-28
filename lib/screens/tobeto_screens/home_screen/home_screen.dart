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
            Expanded(
              flex: 15,
              child: CustomLogo(
                width: ScreenUtil.getWidth(context) * 0.5,
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
                          builder: (context) => const WhatsHappeningIntobetoScreen(),
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

  Widget _drawerTextButton(BuildContext context, {required String text, required VoidCallback onPressed}) {
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
    final assetImagePath = isDarkMode ? 'assets/gifs/skills.gif' : 'assets/gifs/skilldark.gif';
    return Padding(
      padding: EdgeInsets.all(ScreenPadding.padding16px),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: ScreenPadding.padding70px),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.onSecondary,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(50),
                      ),
                    ),
                    height: ScreenUtil.getHeight(context) * 0.204,
                    width: double.infinity,
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: ScreenPadding.padding24px),
                      child: Container(
                        height: ScreenUtil.getHeight(context) * 0.155,
                        width: ScreenUtil.getWidth(context) * 0.42,
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
                            padding: EdgeInsets.only(left: ScreenPadding.padding6px),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: ScreenPadding.padding24px),
                                  child: Text(
                                    TobetoText.tmainCard1Title,
                                    style: TobetoTextStyle.poppins(context).captionBlackBold12,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: ScreenPadding.padding12px),
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
              padding: EdgeInsets.only(top: ScreenPadding.padding16px, bottom: ScreenPadding.padding16px),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                        text: TobetoText.tmainHeadline1Rich1,
                        style: TobetoTextStyle.poppins(context).subtitlePurpleLight20),
                    TextSpan(
                        text: TobetoText.tmainHeadline1Rich2,
                        style: TobetoTextStyle.poppins(context).titlePurpleBold24),
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
                    padding: EdgeInsets.all(ScreenPadding.padding4px),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(30)),
                        color: Theme.of(context).colorScheme.onSecondary,
                      ),
                      height: ScreenUtil.getHeight(context) * 0.125,
                      width: ScreenUtil.getWidth(context) * 0.275,
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: ScreenPadding.padding4px),
                            child: Container(
                                height: ScreenUtil.getHeight(context) * 0.045,
                                width: ScreenUtil.getWidth(context) * 0.1,
                                decoration: BoxDecoration(
                                    color: const Color.fromARGB(255, 196, 133, 255),
                                    borderRadius: BorderRadius.circular(30)),
                                child: Image.asset(ImagePath.news)),
                          ),
                          Text(
                            TobetoText.infoEducationNumber,
                            style: TobetoTextStyle.poppins(context).titlePurpleBold24,
                          ),
                          Text(
                            TobetoText.infoEducationTitle,
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
                    padding: EdgeInsets.all(ScreenPadding.padding4px),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(30)),
                        color: Theme.of(context).colorScheme.onSecondary,
                      ),
                      height: ScreenUtil.getHeight(context) * 0.125,
                      width: ScreenUtil.getWidth(context) * 0.275,
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: ScreenPadding.padding4px),
                            child: Container(
                                height: ScreenUtil.getHeight(context) * 0.045,
                                width: ScreenUtil.getWidth(context) * 0.1,
                                decoration: BoxDecoration(
                                    color: const Color.fromARGB(255, 196, 133, 255),
                                    borderRadius: BorderRadius.circular(30)),
                                child: Image.asset(ImagePath.company)),
                          ),
                          Text(
                            TobetoText.infoOnlineNumber,
                            style: TobetoTextStyle.poppins(context).titlePurpleBold24,
                          ),
                          Text(
                            TobetoText.infoOnlineTitle,
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
              padding: EdgeInsets.only(top: ScreenPadding.padding16px),
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
                  padding: EdgeInsets.all(ScreenPadding.padding4px),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(30)),
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
                    height: ScreenUtil.getHeight(context) * 0.125,
                    width: ScreenUtil.getWidth(context) * 0.275,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: ScreenPadding.padding4px),
                          child: Container(
                              height: ScreenUtil.getHeight(context) * 0.045,
                              width: ScreenUtil.getWidth(context) * 0.1,
                              decoration:
                                  BoxDecoration(color: Colors.blueAccent, borderRadius: BorderRadius.circular(30)),
                              child: Image.asset(ImagePath.graduationCap)),
                        ),
                        Text(
                          TobetoText.infoStudentNumber,
                          style: const TextStyle(color: Colors.indigo, fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          TobetoText.infoStudentTitle,
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
              padding: EdgeInsets.only(top: ScreenPadding.padding16px, bottom: ScreenPadding.padding16px),
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
                  padding: EdgeInsets.all(ScreenPadding.padding4px),
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
                                    color: TobetoColor.card.shadowColor.withOpacity(0.4),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: const Offset(2, 4), // changes position of shadow
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(50),
                              ),
                              width: double.infinity,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Image.asset(assetImagePath),
                              ),
                            );
                          },
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: ScreenPadding.padding8px),
                          child: Text(TobetoText.tmainTobetoTitle,
                              style: TobetoTextStyle.poppins(context).titleBlackBold24, textAlign: TextAlign.center),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: ScreenPadding.padding30px,
                              left: ScreenPadding.padding10px,
                              right: ScreenPadding.padding10px,
                              bottom: ScreenPadding.padding20px),
                          child: Text(
                            TobetoText.tmainTobetoBody,
                            style: TobetoTextStyle.poppins(context).subtitleBlackNormal20,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: ScreenPadding.padding10px),
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
                              padding: EdgeInsets.all(ScreenPadding.padding12px),
                              child: Text(
                                TobetoText.tmainButton,
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
              padding: EdgeInsets.only(top: ScreenPadding.padding16px, bottom: ScreenPadding.padding16px),
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
                  padding: EdgeInsets.all(ScreenPadding.padding4px),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(30)),
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
                    width: double.infinity,
                    child: Padding(
                      padding: EdgeInsets.all(ScreenPadding.padding12px),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: ScreenPadding.padding30px),
                            child: Text(TobetoText.tmainHeadline3Body,
                                style: TobetoTextStyle.poppins(context).subtitleBlackNormal20,
                                textAlign: TextAlign.center),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(Radius.circular(60)),
                              border: Border.all(color: TobetoColor.purple, width: 2),
                              color: TobetoColor.card.white,
                              image: const DecorationImage(
                                image: AssetImage(ImagePath.student),
                                fit: BoxFit.cover,
                              ),
                            ),
                            height: ScreenUtil.getHeight(context) * 0.11,
                            width: ScreenUtil.getWidth(context) * 0.23,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: ScreenPadding.padding30px, bottom: ScreenPadding.padding10px),
                            child: Text(
                              TobetoText.tmainHeadline4Name,
                              style: TobetoTextStyle.poppins(context).subtitleBlackBold20,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Text(
                            TobetoText.tmainHeadline4Student,
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
                  padding: EdgeInsets.only(top: ScreenPadding.padding30px),
                  child: Image.asset(ImagePath.enocta),
                ),
                Padding(
                  padding: EdgeInsets.only(top: ScreenPadding.padding30px),
                  child: Image.asset(ImagePath.advancity),
                ),
                Padding(
                  padding: EdgeInsets.only(top: ScreenPadding.padding30px),
                  child:
                      SizedBox(height: ScreenUtil.getHeight(context) * 0.055, child: Image.asset(ImagePath.codecademy)),
                ),
                Padding(
                  padding: EdgeInsets.only(top: ScreenPadding.padding30px),
                  child:
                      SizedBox(height: ScreenUtil.getHeight(context) * 0.055, child: Image.asset(ImagePath.perculus)),
                ),
                Padding(
                  padding: EdgeInsets.only(top: ScreenPadding.padding30px, bottom: ScreenPadding.padding20px),
                  child: SizedBox(height: ScreenUtil.getHeight(context) * 0.08, child: Image.asset(ImagePath.huawei)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
