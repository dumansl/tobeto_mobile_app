import 'package:flutter/material.dart';
import 'package:tobeto_mobile_app/screens/dashboard_screen/widgets/fixed_appbar.dart';
import 'package:tobeto_mobile_app/screens/home_screen/home_screen.dart';
import 'package:tobeto_mobile_app/screens/profile_editting/screen/profile_edit_screen.dart';
import 'package:tobeto_mobile_app/screens/profile_screen/profile_screen.dart';
import 'package:tobeto_mobile_app/utils/constant/constants.dart';

// import 'tabs/contact_tab.dart';
// import 'tabs/work_tab.dart';
// import 'tabs/education_tab.dart';
// import 'tabs/skills_tab.dart';
// import 'tabs/certificates_tab.dart';
// import 'tabs/communities_tab.dart';

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
        height: 150,
        bottom: TabBar(
          tabAlignment: TabAlignment.start,
          indicatorColor: TobetoColor.purple,
          dividerColor: Colors.amber,
          labelColor: TobetoColor.purple,
          controller: _tabController,
          dividerHeight: 0,
          isScrollable: true,
          tabs: const [
            Tab(icon: Icon(Icons.person), text: "Genel"),
            Tab(icon: Icon(Icons.contact_mail), text: "İletişim"),
            Tab(icon: Icon(Icons.work), text: "İş"),
            Tab(icon: Icon(Icons.school), text: "Eğitim"),
            Tab(icon: Icon(Icons.assignment), text: "Yetenekler"),
            Tab(icon: Icon(Icons.card_membership), text: "Sertifikalar"),
            Tab(icon: Icon(Icons.group), text: "Topluluklar"),
            Tab(icon: Icon(Icons.houseboat), text: "Hobiler"),
            Tab(icon: Icon(Icons.language), text: "Diller"),
            Tab(icon: Icon(Icons.star), text: "Ödüller"),
            Tab(icon: Icon(Icons.settings), text: "Ayarlar"),
          ],
        ),
        title: TobetoText.profileAppBar,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: TabBarView(
          controller: _tabController,
          children: const [
            GeneralTab(),
            ProfileScreen(),
            HomeScreen(),
            // WorkTab(),
            // EducationTab(),
            // SkillsTab(),
            // CertificatesTab(),
            // CommunitiesTab(),
            // HobbiesTab(),
            // LanguagesTab(),
            // AwardsTab(),
            // SettingsTab(),
          ],
        ),
      ),
    );
  }
}
