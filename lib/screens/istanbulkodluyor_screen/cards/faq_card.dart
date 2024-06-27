import 'package:flutter/material.dart';
import 'package:tobeto_mobile_app/screens/istanbulkodluyor_screen/widgets/centered_text.dart';
import 'package:tobeto_mobile_app/screens/istanbulkodluyor_screen/widgets/custom_container.dart';
import 'package:tobeto_mobile_app/screens/istanbulkodluyor_screen/widgets/vertical_padding.dart';
import 'package:tobeto_mobile_app/utils/constant/colors.dart';
import 'package:tobeto_mobile_app/utils/constant/sizes.dart';
import 'package:tobeto_mobile_app/utils/constant/text.dart';
import 'package:tobeto_mobile_app/utils/themes/text_style.dart';

class FAQCard extends StatefulWidget {
  const FAQCard({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FAQCardState createState() => _FAQCardState();
}

class _FAQCardState extends State<FAQCard> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const VerticalPadding(),
        CenteredText(
          text: TobetoText.istanbulHeadline7,
          style: TobetoTextStyle.poppins(context).captionBlackBold24,
        ),
        const VerticalPadding(),
        GestureDetector(
          onTap: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
          child: CustomContainer(
            backgroundColor: TobetoColor.card.navyBlue,
            borderRadius: const BorderRadius.all(Radius.circular(30)),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CenteredText(
                    text: TobetoText.istanbulApplicationButton,
                    style: TobetoTextStyle.poppins(context).captionWhiteBold15,
                  ),
                  SizedBox(
                    width: ScreenUtil.getWidth(context) * 0.127,
                  ),
                  Icon(
                    _isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                    color: TobetoColor.text.white,
                    size: 50,
                  ),
                ],
              ),
            ],
          ),
        ),
        if (_isExpanded)
          CustomContainer(
            backgroundColor: Theme.of(context).colorScheme.onPrimary,
            borderRadius: const BorderRadius.all(Radius.circular(30)),
            children: [
              Padding(
                padding: EdgeInsets.all(ScreenPadding.padding16px),
                child: Text(
                  TobetoText.istanbulCard6Body,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSurface,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        const VerticalPadding(),
      ],
    );
  }
}
