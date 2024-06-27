import 'package:flutter/material.dart';
import 'package:tobeto_mobile_app/model/press_model.dart';
import 'package:tobeto_mobile_app/screens/dashboard_screen/widgets/fixed_appbar.dart';
import 'package:tobeto_mobile_app/utils/constant/constants.dart';
import 'package:tobeto_mobile_app/utils/themes/text_style.dart';

class PressDetailsScreen extends StatelessWidget {
  final PressModel press;
  const PressDetailsScreen({super.key, required this.press});

  @override
  Widget build(BuildContext context) {
    debugPrint(ScreenUtil.getHeight(context).toString());
    debugPrint(ScreenUtil.getWidth(context).toString());
    return Scaffold(
      appBar: FixedAppbar(
        title: Text(
          TobetoText.tpressAppBar,
          style: TobetoTextStyle.poppins(context).subHeadlinePurpleBold28,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(ScreenPadding.padding24px),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _imageTitle(context),
              SizedBox(height: ScreenPadding.padding16px),
              Text(
                press.description,
                style: TobetoTextStyle.poppins(context).captionGrayDarkLight15,
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: ScreenPadding.padding16px),
              if (press.imageUrls.isNotEmpty)
                _imageSlider(context, press.imageUrls),
            ],
          ),
        ),
      ),
    );
  }

  Stack _imageTitle(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: ScreenUtil.getHeight(context) * 0.25,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            image: DecorationImage(
              image: NetworkImage(press.imageUrls[0]),
              fit: BoxFit.cover,
            ),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                offset: Offset(0, 5),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: ScreenPadding.padding16px,
            vertical: ScreenPadding.padding32px,
          ),
          height: ScreenUtil.getHeight(context) * 0.25,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: TobetoColor.card.black.withOpacity(0.3),
          ),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              press.title,
              style: TobetoTextStyle.poppins(context).captionWhiteSemiBold15,
            ),
          ),
        ),
      ],
    );
  }

  Widget _imageSlider(BuildContext context, List<String> imageUrls) {
    return SizedBox(
      height: ScreenUtil.getHeight(context) * 0.2,
      child: PageView.builder(
        controller: PageController(
          viewportFraction: 0.8,
        ),
        itemCount: imageUrls.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(imageUrls[index]),
                    fit: BoxFit.cover,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: TobetoColor.card.grey,
                      blurRadius: 10.0,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
