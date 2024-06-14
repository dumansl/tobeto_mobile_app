import 'package:flutter/material.dart';
import 'package:tobeto_mobile_app/utils/constant/constants.dart';
import 'package:tobeto_mobile_app/utils/themes/text_style.dart';

class ExamResultScreen extends StatelessWidget {
  const ExamResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TobetoColor.background.lightGrey,
      appBar: AppBar(
        backgroundColor: TobetoColor.background.lightGrey,
        title: const Text("Tobeto İşte Başarı Modeli"),
      ),
      body: Column(
        children: [
          Expanded(
              flex: 25,
              child: _resultCard(context,
                  assetName: ImagePath.trueLight, text: "18\nDoğru")),
          Expanded(
              flex: 25,
              child: _resultCard(context,
                  assetName: ImagePath.falseLight, text: "7\nYanlış")),
          Expanded(
              flex: 25,
              child: _resultCard(context,
                  assetName: ImagePath.emptyLight, text: "0\nBoş")),
          Expanded(
              flex: 25,
              child: _resultCard(context,
                  assetName: ImagePath.pointLight, text: "72\nPuan")),
        ],
      ),
    );
  }

  Widget _resultCard(BuildContext context,
      {required String assetName, required String text}) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(
          horizontal: ScreenPadding.screenpadding,
          vertical: ScreenPadding.padding8px),
      decoration: ShapeDecoration(
        image: DecorationImage(
          image: AssetImage(assetName),
          fit: BoxFit.fitWidth,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 4,
            offset: Offset(0, 4),
            spreadRadius: 0,
          )
        ],
      ),
      child: Center(
        child: Text(
          text,
          style: TobetoTextStyle.poppins(context).headlinePurpleSemiBold32,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
