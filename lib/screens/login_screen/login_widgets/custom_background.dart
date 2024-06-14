import 'package:flutter/material.dart';
import 'package:tobeto_mobile_app/utils/constant/constants.dart';

class CustomBackground extends StatelessWidget {
  final bool educatorSwitch;
  const CustomBackground({super.key, this.educatorSwitch = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(educatorSwitch
              ? ImagePath.loginBackgroundEducator
              : ImagePath.loginBackground),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
