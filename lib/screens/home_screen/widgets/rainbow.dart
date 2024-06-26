import 'package:flutter/material.dart';
import 'package:tobeto_mobile_app/utils/constant/constants.dart';

class Rainbow extends StatelessWidget {
  const Rainbow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final assetImagePath = isDarkMode
        ? 'assets/images/ik-logo-light.png'
        : 'assets/images/ik-logo-dark.png';
    return Center(
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              width: ScreenUtil.getWidth(context) * 0.92,
              height: ScreenUtil.getHeight(context) * 0.162,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24.0),
                gradient: LinearGradient(
                  colors: [
                    TobetoColor.purple,
                    TobetoColor.rainbow.lineargreen,
                    TobetoColor.rainbow.linaergreenv2,
                    TobetoColor.rainbow.linearyellow,
                    TobetoColor.purple
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
                    width: ScreenUtil.getWidth(context) * 0.9,
                    height: ScreenUtil.getHeight(context) * 0.155,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.onPrimary,
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                    child: Image.asset(assetImagePath),
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
