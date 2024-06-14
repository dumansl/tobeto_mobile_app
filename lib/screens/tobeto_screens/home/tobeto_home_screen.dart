import 'package:flutter/material.dart';
import 'package:tobeto_mobile_app/screens/tobeto_screens/home/home_widgets/custom_logo.dart';
import 'package:tobeto_mobile_app/screens/tobeto_screens/tobeto_screens.dart';
import 'package:tobeto_mobile_app/utils/constant/constants.dart';
import 'package:tobeto_mobile_app/utils/themes/text_style.dart';

class TobetoHomeScreen extends StatelessWidget {
  const TobetoHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Padding(
          padding: EdgeInsets.all(ScreenPadding.padding32px),
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
                      onPressed: () {},
                    ),
                    _drawerTextButton(
                      context,
                      text: TobetoText.hambugerMenuWhatDoWeOffer,
                      onPressed: () {},
                    ),
                    _drawerTextButton(
                      context,
                      text: TobetoText.hambugerMenuOurTrainings,
                      onPressed: () {},
                    ),
                    _drawerTextButton(
                      context,
                      text: TobetoText.hambugerMenuWhatHappeningTobeto,
                      onPressed: () {},
                    ),
                    _drawerTextButton(
                      context,
                      text: TobetoText.hambugerMenuSitemapAndResources,
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const SitemapAndResourcesScreen(),
                          ),
                        );
                      },
                    ),
                    _drawerTextButton(
                      context,
                      text: TobetoText.hambugerMenuAboutUsCommunication,
                      onPressed: () {},
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
      ),
      appBar: AppBar(
        title: const Text('Guest Home'),
      ),
      body: const Center(
        child: Text('Welcome Guest!'),
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
}
