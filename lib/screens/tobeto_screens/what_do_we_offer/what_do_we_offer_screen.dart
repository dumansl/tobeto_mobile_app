import 'package:flutter/material.dart';
import 'package:tobeto_mobile_app/screens/catalog_screen/catalog.dart';
import 'package:tobeto_mobile_app/screens/dashboard_screen/widgets/fixed_appbar.dart';
import 'package:tobeto_mobile_app/utils/constant/constants.dart';

class WhatDoWeOfferScreen extends StatelessWidget {
  const WhatDoWeOfferScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: FixedAppbar(
        isTobetoScreen: true,
      ),
      body: WhatDoWeOffer(),
    );
  }
}

class WhatDoWeOffer extends StatelessWidget {
  const WhatDoWeOffer({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(ScreenPadding.padding8px),
          child: Column(
            children: [
              OfferCard(
                title: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: TobetoText.tofferPersonalCard1BodyRich1,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                      TextSpan(
                        text: TobetoText.tofferPersonalCard1BodyRich2,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: TobetoColor.purple,
                        ),
                      ),
                      TextSpan(
                        text: TobetoText.tofferPersonalCard1BodyRich3,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                    ],
                  ),
                ),
                description: '',
                color: Theme.of(context).colorScheme.surfaceDim,
                imageAlignment: Alignment.centerRight,
                imagePath: ImagePath.code,
                isFirst: true,
              ),
              OfferCard(
                title: TobetoText.tofferPersonalCard2Title,
                description: TobetoText.tofferPersonalCard2Body,
                color: Theme.of(context).colorScheme.onPrimary,
                imageAlignment: Alignment.centerLeft,
                imagePath: ImagePath.ekip1,
              ),
              OfferCard(
                title: TobetoText.tofferPersonalCard3Title,
                description: TobetoText.tofferPersonalCard3Body,
                color: Theme.of(context).colorScheme.onPrimary,
                imageAlignment: Alignment.centerRight,
                imagePath: ImagePath.biz3,
              ),
              OfferCard(
                title: TobetoText.tofferPersonalCard4Title,
                description: TobetoText.tofferPersonalCard4Body,
                color: Theme.of(context).colorScheme.onPrimary,
                imageAlignment: Alignment.centerLeft,
                imagePath: ImagePath.ekip2,
                isLast: true,
              ),
              Container(
                padding: EdgeInsets.all(ScreenPadding.padding16px),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(ImagePath.kapak),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  children: [
                    Text(
                      TobetoText.tofferPersonalCard5Title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: TobetoColor.text.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: ScreenUtil.getHeight(context) * 0.016),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ActionButton(label: TobetoText.tofferPersonalCard5TitleE1, route: const CatalogScreen()),
                          ActionButton(label: TobetoText.tofferPersonalCard5TitleE2, route: const CatalogScreen()),
                          ActionButton(label: TobetoText.tofferPersonalCard5TitleE3, route: const CatalogScreen()),
                          ActionButton(label: TobetoText.tofferPersonalCard5TitleE4, route: const CatalogScreen()),
                          ActionButton(label: TobetoText.tofferPersonalCard5TitleE5, route: const CatalogScreen()),
                          ActionButton(label: TobetoText.tofferPersonalCard5TitleE6, route: const CatalogScreen()),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OfferCard extends StatelessWidget {
  final dynamic title; // Changed from String to dynamic to accept RichText
  final String description;
  final Color color;
  final Alignment imageAlignment;
  final String imagePath;
  final bool isFirst;
  final bool isLast;

  const OfferCard({
    super.key,
    required this.title,
    required this.description,
    required this.color,
    required this.imageAlignment,
    required this.imagePath,
    this.isFirst = false,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(ScreenPadding.padding16px),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.vertical(
          top: isFirst ? const Radius.circular(0) : Radius.zero,
          bottom: isLast ? const Radius.circular(0) : Radius.zero,
        ),
        border: Border(
          top: isFirst
              ? const BorderSide(color: TobetoColor.purple, width: 4)
              : const BorderSide(color: TobetoColor.purple, width: 2),
          bottom: isLast
              ? const BorderSide(color: TobetoColor.purple, width: 4)
              : const BorderSide(color: TobetoColor.purple, width: 2),
          left: imageAlignment == Alignment.centerLeft
              ? BorderSide.none
              : const BorderSide(color: TobetoColor.purple, width: 4),
          right: imageAlignment == Alignment.centerRight
              ? BorderSide.none
              : const BorderSide(color: TobetoColor.purple, width: 4),
        ),
      ),
      child: Row(
        children: [
          if (imageAlignment == Alignment.centerLeft)
            Padding(
              padding: EdgeInsets.only(right: ScreenPadding.padding16px),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  imagePath,
                  width: ScreenUtil.getWidth(context) * 0.46,
                  height: ScreenUtil.getHeight(context) * 0.16,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                title is RichText
                    ? title
                    : Text(
                        title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                SizedBox(height: ScreenUtil.getHeight(context) * 0.005),
                if (description.isNotEmpty) Text(description),
                if (description.isNotEmpty) SizedBox(height: ScreenUtil.getHeight(context) * 0.005),
              ],
            ),
          ),
          if (imageAlignment == Alignment.centerRight)
            Padding(
              padding: EdgeInsets.only(left: ScreenPadding.padding16px),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  imagePath,
                  width: ScreenUtil.getWidth(context) * 0.47,
                  height: ScreenUtil.getWidth(context) * 0.35,
                  fit: BoxFit.cover,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class ActionButton extends StatelessWidget {
  final String label;
  final Widget route;

  const ActionButton({super.key, required this.label, required this.route});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => route),
        );
      },
      child: Container(
        width: ScreenUtil.getWidth(context) * 0.22,
        height: ScreenUtil.getWidth(context) * 0.22,
        margin: EdgeInsets.symmetric(horizontal: ScreenPadding.padding4px),
        padding: EdgeInsets.all(ScreenPadding.padding8px),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onPrimary,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Center(
          child: ShaderMask(
            shaderCallback: (bounds) => const LinearGradient(
              colors: [TobetoColor.purple, Colors.cyan],
              tileMode: TileMode.mirror,
            ).createShader(bounds),
            child: Text(
              label,
              style: TextStyle(
                color: TobetoColor.card.white,
                fontSize: 14,
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
            ),
          ),
        ),
      ),
    );
  }
}
