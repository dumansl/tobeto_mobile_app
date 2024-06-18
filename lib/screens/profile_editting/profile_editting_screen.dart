import 'package:flutter/material.dart';
import 'package:tobeto_mobile_app/screens/dashboard_screen/widgets/fixed_appbar.dart';
import 'package:tobeto_mobile_app/screens/profile_editting/screen/competencies.dart';
import 'package:tobeto_mobile_app/screens/profile_editting/screen/personal_information.dart';
import 'package:tobeto_mobile_app/screens/profile_editting/screen/work_life.dart';
import 'package:tobeto_mobile_app/utils/constant/constants.dart';

class ProfileEditPage extends StatefulWidget {
  const ProfileEditPage({super.key});

  @override
  State<ProfileEditPage> createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 11, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FixedAppbar(
        height: 130,
        bottom: TabBar(
          tabAlignment: TabAlignment.start,
          indicatorColor: TobetoColor.purple,
          controller: _tabController,
          dividerHeight: 0,
          isScrollable: true,
          tabs: [
            Tab(icon: Image.asset(ImagePath.personalInformation)),
            Tab(
                icon: Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Image.asset(ImagePath.experiences),
            )),
            Tab(icon: Image.asset(ImagePath.education)),
            Tab(icon: Image.asset(ImagePath.competencies)),
            Tab(icon: Image.asset(ImagePath.certificates)),
            Tab(
                icon: Padding(
              padding: const EdgeInsets.only(bottom: 2),
              child: Image.asset(ImagePath.communities),
            )),
            Tab(icon: Image.asset(ImagePath.projectsAndAwards)),
            Tab(icon: Image.asset(ImagePath.socialMedia)),
            Tab(icon: Image.asset(ImagePath.foreignLanguages)),
            Tab(
                icon: Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Image.asset(ImagePath.settings),
            )),
          ],
        ),
        title: TobetoText.profileAppBar,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: TabBarView(
          controller: _tabController,
          children: const [
            PersonalInformationForm(),
            WorkLife(),
            // EducationLife(),
            Competencies(),
            // EducationTab(),
            // SkillsTab(),
            // CertificatesTab(),
            // CommunitiesTab(),
            // HobbiesTab(),
            // SocialMedia(),
            // Languages(),
            // SettingsTab(),
          ],
        ),
      ),
    );
  }
}
