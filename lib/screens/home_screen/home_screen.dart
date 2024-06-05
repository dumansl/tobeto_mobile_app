import 'package:flutter/material.dart';
import 'package:tobeto_mobile_app/screens/home_screen/widgets/nested_scroll.dart';
import 'package:tobeto_mobile_app/screens/home_screen/widgets/box.dart';
import 'package:tobeto_mobile_app/screens/home_screen/widgets/boxlong.dart';
import 'package:tobeto_mobile_app/screens/home_screen/widgets/rainbow.dart';
import 'package:tobeto_mobile_app/screens/reviews_screen/rewiews_screen.dart';
import 'package:tobeto_mobile_app/utils/constant/constants.dart';
import 'package:tobeto_mobile_app/utils/themes/text_style.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
              SizedBox(
                height: ScreenPadding.padding12px,
              ),
              Text(
                TobetoText.mainHeadline1,
                style: TobetoTextStyle.poppins.bodyBlackNormal16,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: ScreenPadding.padding12px,
              ),
              const Rainbow(),
              SizedBox(
                height: ScreenPadding.padding12px,
              ),
              Text(
                TobetoText.mainHeadline2,
                style: TobetoTextStyle.poppins.bodyBlackNormal16,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: ScreenPadding.padding12px,
              ),
              Text(
                TobetoText.mainHeadline3,
                style: TobetoTextStyle.poppins.subtitleBlackSemiBold20,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: ScreenPadding.padding12px,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Box(
                      text: TobetoText.mainCard1,
                      onTap: () {},
                    ),
                  ),
                  Expanded(
                    child: Box(
                      text: TobetoText.mainCard2,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RewiewsScreen(),
                          ),
                        );
                      },
                    ),
                  ),
                  Expanded(
                    child: Box(
                      text: TobetoText.mainCard3,
                      onTap: () {},
                    ),
                  ),
                  Expanded(
                    child: Box(
                      text: TobetoText.mainCard4,
                      onTap: () {},
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: ScreenPadding.padding12px,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: ScreenPadding.padding12px,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: ScreenPadding.padding8px),
                    child: Text(
                      "Sınavlarım",
                      style: TobetoTextStyle.poppins.bodyBlackBold16,
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: ScreenUtil.getHeight(context) * 0.15,
                          width: ScreenUtil.getWidth(context) * 0.9,
                          child: Card(
                            color: TobetoColor.card.cream,
                            elevation: 12,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: ScreenPadding.padding8px),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "Herkes için Kodlama",
                                        style: TobetoTextStyle
                                            .poppins.captionBlackBold12,
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text("Herkes için Kodlama",
                                          style: TobetoTextStyle
                                              .poppins.captionGrayBold12)
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Icon(Icons.watch_later_outlined),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: ScreenPadding.padding8px),
                                        // ignore: prefer_const_constructors
                                        child: Text(
                                          "Herkes için Kodlama",
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: ScreenPadding.padding12px,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Boxlong(
                          text: TobetoText.mainCard2title1,
                          onPressed: () {},
                          buttonText: TobetoText.mainCardbuttontitle,
                        ),
                      ),
                      SizedBox(
                        width: ScreenUtil.getWidth(context) * 0.1,
                      ),
                      Expanded(
                        child: Boxlong(
                          text: TobetoText.mainCard3title1,
                          onPressed: () {},
                          buttonText: TobetoText.mainCardbuttontitle,
                        ),
                      ),
                    ],
                  )
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
