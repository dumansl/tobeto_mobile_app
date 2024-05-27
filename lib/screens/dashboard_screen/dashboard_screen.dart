// TO DO : Enes Yıldız

import 'package:flutter/material.dart';
import 'package:tobeto_mobile_app/utils/constant/colors.dart';
import 'package:tobeto_mobile_app/utils/constant/constants.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Text("Merhaba")),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: TobetoColor.text.lightGrey,
        child: Row(
          children: [
            Column(
              children: [IconButton(onPressed: () {}, icon: Image.asset(ImagePath.profile)), Text('Profilim')],
            )
          ],
        ),
      ),
    );
  }
}

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: StateColor().success,
      selectedLabelStyle: TextStyle(color: TobetoColor.purple),
      unselectedLabelStyle: TextStyle(color: TobetoColor.text.lightGrey),
      items: [
        BottomNavigationBarItem(
            backgroundColor: Colors.grey,
            icon: IconButton(onPressed: () {}, icon: Image.asset(ImagePath.profile)),
            label: "Profilim"),
        BottomNavigationBarItem(
            icon: IconButton(onPressed: () {}, icon: Image.asset(ImagePath.profile)), label: "Eğitimlerim"),
        BottomNavigationBarItem(
          icon: IconButton(onPressed: () {}, icon: Image.asset(ImagePath.profile)),
          label: "Katalog",
        ),
        BottomNavigationBarItem(
            icon: IconButton(onPressed: () {}, icon: Image.asset(ImagePath.profile)), label: "Takvim"),
      ],
    );
  }
}
