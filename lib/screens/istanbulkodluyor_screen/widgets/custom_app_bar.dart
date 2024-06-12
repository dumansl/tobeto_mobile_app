import 'package:flutter/material.dart';
import 'package:tobeto_mobile_app/screens/screens.dart';
import 'package:tobeto_mobile_app/utils/constant/colors.dart';
import 'package:tobeto_mobile_app/utils/constant/image_string.dart';
import 'package:tobeto_mobile_app/utils/constant/sizes.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(70);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: TobetoColor.card.cream,
      title: Padding(
        padding: EdgeInsets.all(ScreenPadding.padding24px),
        child: Image.asset(ImagePath.greyTobeto),
      ),
      centerTitle: true,
      leading: IconButton(
        icon: Image.asset(ImagePath.purpleBack),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const LoginScreen(),
            ),
          );
        },
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const CircleAvatar(
            radius: 25,
            backgroundColor: Colors.transparent,
            backgroundImage: AssetImage(ImagePath.profilePhoto),
          ),
        ),
      ],
    );
  }
}
