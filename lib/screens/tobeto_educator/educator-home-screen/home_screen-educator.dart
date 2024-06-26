import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_mobile_app/blocs/theme_bloc/theme_bloc.dart';
import 'package:tobeto_mobile_app/screens/home_screen/widgets/nested_scroll.dart';
import 'package:tobeto_mobile_app/screens/home_screen/widgets/box.dart';
import 'package:tobeto_mobile_app/screens/home_screen/widgets/boxlong.dart';
import 'package:tobeto_mobile_app/screens/home_screen/widgets/rainbow.dart';
import 'package:tobeto_mobile_app/screens/screens.dart';
import 'package:tobeto_mobile_app/utils/constant/constants.dart';
import 'package:tobeto_mobile_app/utils/themes/text_style.dart';

class HomeScreenEducator extends StatefulWidget {
  const HomeScreenEducator({super.key});

  @override
  State<HomeScreenEducator> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreenEducator> {
  final ScrollController _scrollController = ScrollController();
  bool _isTopRight = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.offset >= 100) {
        setState(() {
          _isTopRight = true;
        });
      } else {
        setState(() {
          _isTopRight = false;
        });
      }
    });
  }

  final PageStorageBucket bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: ScreenPadding.padding12px),
        child: NestedScroll(
          currentScreen: ListView(
            scrollDirection: Axis.vertical,
            children: [
              SizedBox(height: ScreenPadding.padding12px),
              Text(
                TobetoText.mainHeadline1,
                style: TobetoTextStyle.poppins(context).bodyBlackNormal16,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: ScreenPadding.padding12px),
              SizedBox(height: ScreenPadding.padding12px),
              Switch(
                value: context.read<ThemeBloc>().state == ThemeMode.dark,
                onChanged: (value) {
                  context.read<ThemeBloc>().add(ThemeChanged(value));
                },
              ),
              SizedBox(height: ScreenPadding.padding12px),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: ScreenPadding.padding12px),
                  SizedBox(height: ScreenPadding.padding12px),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Boxlong(
                          text: TobetoText.mainCard2title1,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const RewiewsScreen(),
                              ),
                            );
                          },
                          buttonText: TobetoText.mainCardbuttontitle,
                        ),
                      ),
                      SizedBox(width: ScreenUtil.getWidth(context) * 0.1),
                      Expanded(
                        child: Boxlong(
                          text: TobetoText.mainCard3title1,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const CatalogScreen(),
                              ),
                            );
                          },
                          buttonText: TobetoText.mainCardbuttontitle,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          scrollController: _scrollController,
          isTopRight: _isTopRight,
          bucket: bucket,
        ),
      ),
    );
  }
}

class _ExamplesCard extends StatelessWidget {
  const _ExamplesCard();

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.onPrimary,
      elevation: 12,
      child: Padding(
        padding: EdgeInsets.only(left: ScreenPadding.padding8px),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                Text(
                  "Herkes için Kodlama",
                  style: TobetoTextStyle.poppins(context).captionBlackBold12,
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  "Herkes için Kodlama",
                  style: TobetoTextStyle.poppins(context).captionBlackBold12,
                ),
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.watch_later_outlined,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
                Padding(
                  padding: EdgeInsets.only(left: ScreenPadding.padding8px),
                  child: Text(
                    "Herkes için Kodlama",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurface),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
