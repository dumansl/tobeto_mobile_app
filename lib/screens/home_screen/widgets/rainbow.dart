import 'package:flutter/material.dart';

class Rainbow extends StatelessWidget {
  const Rainbow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
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
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Column(
              children: [
                Align(
                  alignment:
                      Alignment.bottomCenter, // Center the white container
                  child: Container(
                    width: 326,
                    height: 96,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                    child: Image.asset(
                      'assets/images/ik-logo-dark.png',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
