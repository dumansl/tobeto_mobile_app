// import 'package:flutter/material.dart';

// import 'package:tobeto_mobile_app/screens/dashboard_screen/widgets/custom_navbar.dart';
// import 'package:tobeto_mobile_app/screens/screens.dart'; // Ekranların olduğu dizin
// import 'package:tobeto_mobile_app/utils/constant/constants.dart';
// import 'package:tobeto_mobile_app/utils/themes/text_style.dart'; // Sabitler

// class DashboardScreen extends StatefulWidget {
//   const DashboardScreen({super.key});

//   @override
//   _DashboardScreenState createState() => _DashboardScreenState();
// }

// class _DashboardScreenState extends State<DashboardScreen> {
//   int _selectedIndex = 2; // Başlangıçta seçili olan index

//   static const List<Widget> _screens = [
//     ProfileScreen(),
//     EducationScreen(),
//     HomeScreen(),
//     CatalogScreen(),
//     CalendarScreen(),
//   ];

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _screens[_selectedIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         unselectedFontSize: 32,
//         backgroundColor: Theme.of(context).colorScheme.onPrimary,
//         selectedIconTheme: const IconThemeData(opacity: 1.0),
//         currentIndex: _selectedIndex,
//         onTap: _onItemTapped,
//         items: [
//           BottomNavigationBarItem(
//             activeIcon: Image.asset(
//               ImagePath.profileActive,
//               width: IconSize.size35px,
//             ),
//             icon: Image.asset(
//               ImagePath.profile,
//               width: IconSize.size35px,
//             ),
//             label: TobetoText.bottomIconProfile,
//           ),
//           BottomNavigationBarItem(
//             activeIcon: Image.asset(
//               ImagePath.trainingsActive,
//               width: IconSize.size35px,
//             ),
//             icon: Image.asset(
//               ImagePath.trainings,
//               width: IconSize.size35px,
//             ),
//             label: TobetoText.bottomIconEducation,
//           ),
//           BottomNavigationBarItem(
//               activeIcon: Image.asset(
//                 ImagePath.homepageActive,
//                 width: IconSize.size35px,
//               ),
//               icon: Image.asset(
//                 ImagePath.homepage,
//                 width: IconSize.size35px,
//               ),
//               label: TobetoText.registerError),
//           BottomNavigationBarItem(
//             activeIcon: Image.asset(
//               ImagePath.catalogActive,
//               width: IconSize.size35px,
//             ),
//             icon: Image.asset(
//               ImagePath.catalog,
//               width: IconSize.size35px,
//             ),
//             label: TobetoText.bottomIconCatalog,
//           ),
//           BottomNavigationBarItem(
//             activeIcon: Image.asset(
//               ImagePath.calendarActive,
//               width: IconSize.size35px,
//             ),
//             icon: Image.asset(
//               ImagePath.calendar,
//               width: IconSize.size35px,
//             ),
//             label: TobetoText.bottomIconCalendar,
//           ),
//         ],
//       ),
//     );
//   }
// }
