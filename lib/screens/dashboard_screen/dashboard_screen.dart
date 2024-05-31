import 'package:flutter/material.dart';
import 'package:tobeto_mobile_app/screens/dashboard_screen/widgets/bottom_appbar_icon.dart';
import 'package:tobeto_mobile_app/screens/screens.dart';
import 'package:tobeto_mobile_app/utils/constant/constants.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _HomeState();
}

class _HomeState extends State<DashboardScreen> {
  final ScrollController _scrollController = ScrollController();
  bool _isTopRight = false;

  int currentTab = 0;
  final List<Widget> screens = [
    const HomeScreen(),
    const HomeScreen(),
    const LoginScreen(),
    const SplashScreen(),
    const LoginScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.offset >= 100) {
        // 100 pikselden fazla kaydırıldığında konumu değiştir
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
      body: NestedScrollView(
        controller: _scrollController,
        floatHeaderSlivers: true,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              backgroundColor: TobetoColor.background.white,
              expandedHeight: 240,
              toolbarHeight: 80,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: SizedBox(
                  child: Stack(
                    children: [
                      Container(
                        padding: _isTopRight
                            ? const EdgeInsets.only(top: 30, right: 10)
                            : const EdgeInsets.symmetric(vertical: 20),
                        alignment: _isTopRight
                            ? Alignment.centerRight
                            : Alignment.bottomCenter,
                        child: CircleAvatar(
                          radius: _isTopRight ? 30 : 60,
                          backgroundImage:
                              const AssetImage(ImagePath.profilePhoto),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 40),
                        alignment: _isTopRight
                            ? Alignment.center
                            : Alignment.bottomCenter,
                        child: const Text(
                          "TOBETO'ya hoş geldin Enes",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ];
        },
        body: PageStorage(
          bucket: bucket,
          child: currentScreen,
        ),
      ),
      floatingActionButton: SizedBox(
        height: 75,
        width: 75,
        child: FloatingActionButton(
          foregroundColor: TobetoColor.background.white,
          backgroundColor: TobetoColor.background.white,
          onPressed: () {
            setState(() {
              currentScreen = const HomeScreen();
              currentTab = 0;
            });
          },
          shape: const CircleBorder(),
          child: currentTab == 0
              ? Image.asset(ImagePath.homepageActive, width: 35, height: 35)
              : Opacity(
                  opacity: 0.5,
                  child:
                      Image.asset(ImagePath.homepage, width: 35, height: 35)),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: TobetoColor.card.shadowColor,
              blurRadius: 20,
              spreadRadius: 0,
              // offset: const Offset(0, 0),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          child: BottomAppBar(
            elevation: 10,
            height: 70,
            notchMargin: 6,
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
                          currentScreen = const HomeScreen();
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
                            currentScreen = const LoginScreen();
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
