import 'package:flutter/material.dart';

import '../../utils/constant/constants.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(ScreenPadding.x),
        child: const Center(
          child: Text(
            'data',
          ),
        ),
      ),
    );
  }
}
