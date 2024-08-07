import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:tobeto_mobile_app/blocs/theme_bloc/theme_bloc.dart';
import 'package:tobeto_mobile_app/screens/home_screen/widgets/nested_scroll.dart';
import 'package:tobeto_mobile_app/screens/home_screen/widgets/box.dart';
import 'package:tobeto_mobile_app/screens/home_screen/widgets/boxlong.dart';
import 'package:tobeto_mobile_app/screens/home_screen/widgets/rainbow.dart';
import 'package:tobeto_mobile_app/screens/screens.dart';
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
    bool value = context.read<ThemeBloc>().state == ThemeMode.dark;
    final List<Widget> boxWidgets = [
      Box(
        text: TobetoText.mainCard1,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ApplicationScreen(),
            ),
          );
        },
      ),
      Box(
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
      Box(
        text: TobetoText.mainCard3,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AnnouncementScreen(),
            ),
          );
        },
      ),
      Box(
        text: TobetoText.mainCard4,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const SurveyScreen(),
            ),
          );
        },
      ),
      Box(
        text: TobetoText.mainCard5,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const JobScreen(),
            ),
          );
        },
      ),
    ];
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: ScreenPadding.padding12px),
        child: NestedScroll(
          currentScreen: ListView(
            scrollDirection: Axis.vertical,
            children: [
              Padding(
                padding: EdgeInsets.all(ScreenPadding.padding16px),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        pushReplacementWithoutNavBar(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const TobetoHomeScreen()));
                      },
                      child: Container(
                        height: IconSize.size35px,
                        width: IconSize.size35px,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(ImagePath.tTobeto)),
                        ),
                      ),
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
              Text(
                TobetoText.mainHeadline1,
                style: TobetoTextStyle.poppins(context).bodyBlackNormal16,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: ScreenPadding.padding12px),
              const Rainbow(),
              SizedBox(height: ScreenPadding.padding12px),
              Text(
                TobetoText.mainHeadline2,
                style: TobetoTextStyle.poppins(context).bodyBlackNormal16,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: ScreenPadding.padding12px),
              Text(
                TobetoText.mainHeadline3,
                style: TobetoTextStyle.poppins(context).subtitleBlackSemiBold20,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: ScreenPadding.padding12px),
              SizedBox(
                height: ScreenUtil.getHeight(context) * 0.12,

                // ListView.builder için yükseklik belirleyin
                child: ListView.builder(
                  itemCount: boxWidgets.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return boxWidgets[
                        index]; // Belirlenen Box widget'larını kullan
                  },
                ),
              ),
              SizedBox(height: ScreenPadding.padding12px),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: ScreenPadding.padding12px),
                  Padding(
                    padding: EdgeInsets.only(left: ScreenPadding.padding8px),
                    child: Text(
                      "Sınavlarım",
                      style: TobetoTextStyle.poppins(context).bodyBlackBold16,
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: ScreenUtil.getHeight(context) * 0.15,
                          width: ScreenUtil.getWidth(context) * 0.9,
                          child: const _ExamplesCard(),
                        ),
                      ),
                    ],
                  ),
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
                      SizedBox(width: ScreenUtil.getWidth(context) * 0.08),
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
                  style: TobetoTextStyle.poppins(context).captionBlackThin12,
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  "Herkes için Kodlama",
                  style: TobetoTextStyle.poppins(context).captionBlackThin12,
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
