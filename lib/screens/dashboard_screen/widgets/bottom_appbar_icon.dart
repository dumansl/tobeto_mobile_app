import 'package:flutter/material.dart';
import 'package:tobeto_mobile_app/utils/constant/colors.dart';

class BottomAppbarIcon extends StatelessWidget {
  final int currentTab;
  final void Function() onPressed;
  final int pageIndex;
  final String activeIcon;
  final String inactiveIcon;
  final String iconName;
  const BottomAppbarIcon({
    super.key,
    required this.currentTab,
    required this.onPressed,
    required this.pageIndex,
    required this.iconName,
    required this.activeIcon,
    required this.inactiveIcon,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          foregroundColor: TobetoColor.background.white,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          shadowColor: TobetoColor.background.transparent,
          backgroundColor: TobetoColor.background.transparent),
      onPressed: onPressed,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          currentTab == pageIndex
              ? Image.asset(activeIcon, width: 35, height: 35)
              : Opacity(opacity: 0.5, child: Image.asset(inactiveIcon, width: 35, height: 35)),
          Text(
            iconName,
            style: TextStyle(
              color: currentTab == pageIndex ? TobetoColor.purple : TobetoColor.text.blackOpacity,
            ),
          ),
        ],
      ),
    );
  }
}
