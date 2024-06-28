import 'package:flutter/material.dart';
import 'package:tobeto_mobile_app/utils/constant/constants.dart';
import 'package:tobeto_mobile_app/utils/horizontal_page_route.dart';
import 'package:tobeto_mobile_app/utils/themes/text_style.dart';

class DescriptionTitleContent extends StatefulWidget {
  final String title;
  final String? description;
  final bool isButton;
  final Widget? navigatorScreen;
  const DescriptionTitleContent(
      {super.key, required this.title, this.description, this.isButton = false, this.navigatorScreen});

  @override
  State<DescriptionTitleContent> createState() => _DescriptionTitleContentState();
}

class _DescriptionTitleContentState extends State<DescriptionTitleContent> {
  bool _isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            widget.isButton
                ? Navigator.push(
                    context,
                    createHorizontalPageRoute(widget.navigatorScreen!),
                  )
                : setState(
                    () {
                      _isExpanded = !_isExpanded;
                    },
                  );
          },
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: ScreenPadding.padding16px,
              vertical: ScreenPadding.padding12px,
            ),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.tertiaryContainer,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(SizeRadius.radius16px),
                topRight: Radius.circular(SizeRadius.radius16px),
                bottomLeft: _isExpanded ? const Radius.circular(0) : Radius.circular(SizeRadius.radius16px),
                bottomRight: _isExpanded ? const Radius.circular(0) : Radius.circular(SizeRadius.radius16px),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    widget.title,
                    style: TobetoTextStyle.poppins(context).captionBlackBold12,
                  ),
                ),
                Icon(
                  _isExpanded ? Icons.arrow_drop_down_rounded : Icons.arrow_right_rounded,
                  size: IconSize.size35px,
                  color: Theme.of(context).colorScheme.tertiaryFixed,
                ),
              ],
            ),
          ),
        ),
        _isExpanded
            ? Container(
                padding: EdgeInsets.all(ScreenPadding.padding16px),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.tertiaryFixedDim,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(SizeRadius.radius16px),
                    bottomLeft: Radius.circular(SizeRadius.radius16px),
                  ),
                ),
                child: Text(
                  widget.description!,
                  style: TobetoTextStyle.poppins(context).captionLightGrayBold12,
                  textAlign: TextAlign.justify,
                ),
              )
            : const SizedBox(),
        SizedBox(
          height: ScreenPadding.padding16px,
        )
      ],
    );
  }
}
