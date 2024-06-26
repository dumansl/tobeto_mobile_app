import 'package:flutter/material.dart';
import 'package:tobeto_mobile_app/screens/dashboard_screen/widgets/fixed_appbar.dart';

class WhatDoWeOfferScreen extends StatelessWidget {
  const WhatDoWeOfferScreen({super.key});
  // TO DO : Zehra Karaca
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: FixedAppbar(
        isTobetoScreen: true,
      ),
    );
  }
}
