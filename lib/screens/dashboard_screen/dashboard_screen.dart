import 'package:flutter/material.dart';
import 'package:tobeto_mobile_app/screens/dashboard_screen/widgets/bottom_appbar_icon.dart';
import 'package:tobeto_mobile_app/screens/dashboard_screen/widgets/nested_scroll.dart';
import 'package:tobeto_mobile_app/screens/screens.dart';
import 'package:tobeto_mobile_app/utils/constant/constants.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _HomeState();
}

class _HomeState extends State<Dashboard> {
  final ScrollController _scrollController = ScrollController();
  bool _isTopRight = false;

  int currentTab = 0;

  final List<Widget> screens = [
    const HomeScreen(),
    const ProfileScreen(),
    const EducationScreen(),
    const SplashScreen(),
    const LoginScreen(),
  ];

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
  Widget currentScreen = const HomeScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScroll(
        scrollController: _scrollController,
        isTopRight: _isTopRight,
        bucket: bucket,
        currentScreen: currentScreen,
      ),
      floatingActionButton: Fab(
        currentTab: currentTab,
        onPressed: () {
          setState(() {
            currentScreen = const HomeScreen();
            currentTab = 0;
          });
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: TobetoColor.card.shadowColor,
              blurRadius: SizeRadius.radius16px,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.vertical(top: Radius.circular(SizeRadius.radius20px)),
          child: BottomAppBar(
            height: ScreenUtil.getHeight(context) * 0.085,
            notchMargin: ScreenPadding.padding6px,
            padding: const EdgeInsets.all(0),
            color: TobetoColor.card.white,
            shape: const CircularNotchedRectangle(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    BottomAppbarIcon(
                      currentTab: currentTab,
                      onPressed: () {
                        setState(() {
                          currentScreen = const ProfileScreen();
                          currentTab = 1;
                        });
                      },
                      pageIndex: 1,
                      iconName: TobetoText.bottomIconProfile,
                      activeIcon: ImagePath.profileActive,
                      inactiveIcon: ImagePath.profile,
                    ),
                    BottomAppbarIcon(
                        currentTab: currentTab,
                        onPressed: () {
                          setState(() {
                            currentScreen = const EducationScreen();
                            currentTab = 2;
                          });
                        },
                        pageIndex: 2,
                        iconName: TobetoText.bottomIconEducation,
                        activeIcon: ImagePath.trainingsActive,
                        inactiveIcon: ImagePath.trainings)
                  ],
                ),
                Row(
                  children: <Widget>[
                    BottomAppbarIcon(
                        currentTab: currentTab,
                        onPressed: () {
                          setState(() {
                            currentScreen = const HomeScreen();
                            currentTab = 3;
                          });
                        },
                        pageIndex: 3,
                        iconName: TobetoText.bottomIconCatalog,
                        activeIcon: ImagePath.catalogActive,
                        inactiveIcon: ImagePath.catalog),
                    BottomAppbarIcon(
                        currentTab: currentTab,
                        onPressed: () {
                          setState(() {
                            currentScreen = const SplashScreen();
                            currentTab = screens.indexOf(const SplashScreen());
                          });
                        },
                        pageIndex: screens.indexOf(const SplashScreen()),
                        iconName: TobetoText.bottomIconCalendar,
                        activeIcon: ImagePath.calendarActive,
                        inactiveIcon: ImagePath.calendar)
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Fab extends StatelessWidget {
  const Fab({
    super.key,
    required this.currentTab,
    required this.onPressed,
  });

  final int currentTab;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ScreenUtil.getHeight(context) * 0.09,
      width: ScreenUtil.getWidth(context) * 0.18,
      child: FloatingActionButton(
        foregroundColor: TobetoColor.background.white,
        backgroundColor: TobetoColor.background.white,
        onPressed: onPressed,
        shape: const CircleBorder(),
        child: currentTab == 0
            ? Image.asset(ImagePath.homepageActive, width: IconSize.size35px, height: IconSize.size35px)
            : Opacity(
                opacity: 0.5,
                child: Image.asset(ImagePath.homepage, width: IconSize.size35px, height: IconSize.size35px)),
      ),
    );
  }
}
