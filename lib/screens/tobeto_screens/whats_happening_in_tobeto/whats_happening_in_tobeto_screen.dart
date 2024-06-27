import 'package:flutter/material.dart';
import 'package:tobeto_mobile_app/screens/dashboard_screen/widgets/fixed_appbar.dart';
import 'package:tobeto_mobile_app/screens/screens.dart';
import 'package:tobeto_mobile_app/utils/themes/text_style.dart';
import '../../../utils/constant/constants.dart';
import '../widgets/description_title_content.dart';
import 'we_in_the_press/we_in_the_press_screen.dart';

class WhatsHappeningIntobetoScreen extends StatelessWidget {
  const WhatsHappeningIntobetoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const FixedAppbar(
        isTobetoScreen: true,
      ),
      body: Padding(
        padding: EdgeInsets.only(
          top: ScreenPadding.padding24px,
          left: ScreenPadding.padding24px,
          right: ScreenPadding.padding24px,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _navigatorContent(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _navigatorContent(BuildContext context) {
    return Column(
      children: [
        _textDivider(context, text: TobetoText.hambugerMenuWhatHappeningTobeto),
        SizedBox(height: ScreenPadding.padding8px),
        DescriptionTitleContent(
          title: TobetoText.tblogTitle1,
          isButton: true,
          navigatorScreen: const BlogScreen(),
        ),
        DescriptionTitleContent(
          title: TobetoText.tpressAppBar,
          isButton: true,
          navigatorScreen: const WeInThePressScreen(),
        ),
        DescriptionTitleContent(
          title: TobetoText.calendarAppBar,
          isButton: true,
          navigatorScreen: const CalendarScreen(),
        ),
        DescriptionTitleContent(
          title: TobetoText.hambugerMenuIstanbulIsCodding,
          isButton: true,
          navigatorScreen: const IstanbulKodluyorScreen(),
        ),
      ],
    );
  }

  Widget _textDivider(BuildContext context, {required String text}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: TobetoTextStyle.poppins(context).subtitleGrayDarkBold20,
        ),
        Divider(color: TobetoColor.frame.lightGrey),
      ],
    );
  }
}
