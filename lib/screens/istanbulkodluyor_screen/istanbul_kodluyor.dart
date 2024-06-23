import 'package:flutter/material.dart';
import 'package:tobeto_mobile_app/screens/istanbulkodluyor_screen/cards/about_istanbul_kodluyor_card.dart';
import 'package:tobeto_mobile_app/screens/istanbulkodluyor_screen/cards/apply_now_card.dart';
import 'package:tobeto_mobile_app/screens/istanbulkodluyor_screen/cards/description_card.dart';
import 'package:tobeto_mobile_app/screens/istanbulkodluyor_screen/cards/employment_path_card.dart';
import 'package:tobeto_mobile_app/screens/istanbulkodluyor_screen/cards/faq_card.dart';
import 'package:tobeto_mobile_app/screens/istanbulkodluyor_screen/cards/featured_education_card.dart';
import 'package:tobeto_mobile_app/screens/istanbulkodluyor_screen/cards/final_card.dart';
import 'package:tobeto_mobile_app/screens/istanbulkodluyor_screen/cards/introduction_card.dart';
import 'package:tobeto_mobile_app/screens/istanbulkodluyor_screen/cards/process_card.dart';
import 'package:tobeto_mobile_app/screens/istanbulkodluyor_screen/cards/project_photos_card.dart';
import 'package:tobeto_mobile_app/screens/istanbulkodluyor_screen/cards/project_support_card.dart';
import 'package:tobeto_mobile_app/screens/istanbulkodluyor_screen/widgets/custom_app_bar.dart';
import 'package:tobeto_mobile_app/utils/constant/constants.dart';

class IstanbulKodluyorScreen extends StatefulWidget {
  const IstanbulKodluyorScreen({super.key});

  @override
  State<IstanbulKodluyorScreen> createState() => _IstanbulKodluyorScreenState();
}

class _IstanbulKodluyorScreenState extends State<IstanbulKodluyorScreen> {
  final ScrollController _scrollController = ScrollController();

  void _scrollToItem() {
    _scrollController.animateTo(
      _scrollController.position.viewportDimension * 5.34, // Belirli bir pozisyon belirtin
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      backgroundColor: TobetoColor.card.cream,
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            const IntroductionCard(),
            DescriptionCard(
              faqButton: _scrollToItem,
            ),
            const AboutIstanbulKodluyorCard(),
            const ProcessCard(),
            const EmploymentPathCard(),
            const FeaturedEducationCard(),
            const ApplyNowCard(),
            const ProjectSupportCard(),
            const FAQCard(),
            const ProjectPhotosCard(),
            const FinalCard(),
          ],
        ),
      ),
    );
  }
}
