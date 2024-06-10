import 'package:flutter/material.dart';
import 'package:tobeto_mobile_app/utils/constant/colors.dart';
import 'package:tobeto_mobile_app/utils/themes/text_style.dart';
import '../job_screen/job_widgets/job_card.dart';

class JobScreen extends StatefulWidget {
  const JobScreen({super.key});

  @override
  State<JobScreen> createState() => _JobScreenState();
}

class _JobScreenState extends State<JobScreen> {
  int selectedIndex = 0;

  List<Map<String, dynamic>> jobs = [
    {
      'jobType': 'TAM ZAMANLI',
      'jobTitle': 'Frontend Developer',
      'companyName': 'Tobeto',
      'location': 'Ankara',
      'appliedDate': '29 Haziran 2020',
      'interview': false,
    },
    {
      'jobType': 'TAM ZAMANLI',
      'jobTitle': 'Mobile Developer',
      'companyName': 'Tobeto',
      'location': 'İstanbul',
      'appliedDate': '01 Temmuz 2020',
      'interview': true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('İş Süreçlerim',
            style: TobetoTextStyle.poppins.headlineBlackBold32),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.purple.shade50,
                borderRadius: BorderRadius.circular(20),
              ),
              child: ToggleButtons(
                borderColor: Colors.transparent,
                fillColor: TobetoColor.purple,
                borderWidth: 2,
                selectedBorderColor: Colors.transparent,
                selectedColor: Colors.white,
                borderRadius: BorderRadius.circular(20),
                isSelected: [selectedIndex == 0, selectedIndex == 1],
                onPressed: (index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                children: const [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text('Başvurularım',
                        style: TextStyle(fontFamily: 'Poppins')),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text('Mülakatlarım',
                        style: TextStyle(fontFamily: 'Poppins')),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: jobs.where((job) {
                if (selectedIndex == 1) {
                  return job['interview'] == true;
                }
                return true;
              }).map((job) {
                return JobCard(
                  jobType: job['jobType'],
                  jobTitle: job['jobTitle'],
                  companyName: job['companyName'],
                  location: job['location'],
                  appliedDate: job['appliedDate'],
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
