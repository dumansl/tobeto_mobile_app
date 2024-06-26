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
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              OfferCard(
                title: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      const TextSpan(
                        text: 'Kontrol sende\n',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: 'adım at,\n',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.purple[900],
                        ),
                      ),
                      const TextSpan(
                        text: ' Tobeto ile fark yarat!',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                description: '',
                color: const Color(0xFFE9E8FF),
                imageAlignment: Alignment.centerRight,
                imagePath: ImagePath.code,
                isFirst: true,
              ),
              OfferCard(
                title: TobetoText.tofferPersonalCard2Title,
                description: TobetoText.tofferPersonalCard2Body,
                color: Colors.white,
                imageAlignment: Alignment.centerLeft,
                imagePath: ImagePath.ekip1,
              ),
              OfferCard(
                title: TobetoText.tofferPersonalCard3Title,
                description: TobetoText.tofferPersonalCard3Body,
                color: Colors.white,
                imageAlignment: Alignment.centerRight,
                imagePath: ImagePath.biz3,
              ),
              OfferCard(
                title: TobetoText.tofferPersonalCard4Title,
                description: TobetoText.tofferPersonalCard4Body,
                color: Colors.white,
                imageAlignment: Alignment.centerLeft,
                imagePath: ImagePath.ekip2,
                isLast: true,
              ),
              SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(ImagePath.kapak),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.vertical(bottom: Radius.circular(8)),
                ),
                child: const Column(
                  children: [
                    Text(
                      'Kariyeriniz için en iyi yolculuklar',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 8),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ActionButton(label: 'AI PROMPTING', route: CatalogScreen()),
                          ActionButton(label: 'PROJE YÖNETİMİ', route: CatalogScreen()),
                          ActionButton(label: 'FULL STACK DEVELOPER', route: CatalogScreen()),
                          ActionButton(label: 'İŞ ANALİSTİ', route: CatalogScreen()),
                          ActionButton(label: 'DİJİTAL PAZARLAMA', route: CatalogScreen()),
                          ActionButton(label: 'YAZILIM KALİTE', route: CatalogScreen()),
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
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.vertical(
          top: isFirst ? const Radius.circular(8) : Radius.zero,
          bottom: isLast ? const Radius.circular(8) : Radius.zero,
        ),
        border: Border(
          bottom: BorderSide(
            color: isLast ? Colors.transparent : Colors.grey.shade300,
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          if (imageAlignment == Alignment.centerLeft)
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  imagePath,
                  width: 150,
                  height: 170,
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
                const SizedBox(height: 8),
                if (description.isNotEmpty) Text(description),
                if (description.isNotEmpty) const SizedBox(height: 8),
              ],
            ),
          ),
          if (imageAlignment == Alignment.centerRight)
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  imagePath,
                  width: 150,
                  height: 170,
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

  const ActionButton({required this.label, required this.route});

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
        width: 100,
        height: 80,
        margin: const EdgeInsets.symmetric(horizontal: 4.0),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Center(
          child: ShaderMask(
            shaderCallback: (bounds) => const LinearGradient(
              colors: [Colors.blue, Colors.cyan],
              tileMode: TileMode.mirror,
            ).createShader(bounds),
            child: Text(
              label,
              style: const TextStyle(
                color: Colors.white,
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
