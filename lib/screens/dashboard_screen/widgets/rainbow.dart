import 'package:flutter/material.dart';

class RainBow extends StatefulWidget {
  const RainBow({super.key});

  @override
  State<RainBow> createState() => _RainBowState();
}

class _RainBowState extends State<RainBow> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
            width: 330,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24.0),
              gradient: const LinearGradient(
                colors: [
                  Color(0XFF9933FF),
                  Color(0XFF17BAAA),
                  Color(0xff16BBA9),
                  Color(0xffEADA4A),
                  Color(0xff9933FF)
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: const ListTile(
              title: Row(
                children: [
                  Text('Engellilik Durumu '),
                  Text(
                    '*',
                    style: TextStyle(color: Colors.red), // Yıldız rengi
                  ),
                ],
              ),
              // Diğer ListTile özellikleri buraya eklenebilir
            )),
      ),
    );
  }
}
