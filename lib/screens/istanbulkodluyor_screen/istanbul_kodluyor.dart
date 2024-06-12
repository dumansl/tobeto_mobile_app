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

class IstanbulKodluyorScreen extends StatelessWidget {
  const IstanbulKodluyorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      backgroundColor: TobetoColor.card.cream,
      body: const SingleChildScrollView(
        child: Column(
          children: [
            IntroductionCard(),
            DescriptionCard(),
            AboutIstanbulKodluyorCard(),
            ProcessCard(),
            EmploymentPathCard(),
            FeaturedEducationCard(),
            ApplyNowCard(),
            ProjectSupportCard(),
            FAQCard(),
            ProjectPhotosCard(),
            FinalCard(),
          ],
        ),
      ),
    );
  }
}
