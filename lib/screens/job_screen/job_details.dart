import 'package:flutter/material.dart';
import 'package:tobeto_mobile_app/utils/themes/text_style.dart';

class JobDetails extends StatelessWidget {
  final String jobType;
  final String jobTitle;
  final String companyName;
  final String location;
  final String appliedDate;

  const JobDetails({
    super.key,
    required this.jobType,
    required this.jobTitle,
    required this.companyName,
    required this.location,
    required this.appliedDate,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('İş Detayları',
            style: TobetoTextStyle.poppins.captionLightGrayBold24),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(jobTitle, style: TobetoTextStyle.poppins.titlePurpleBold24),
            const SizedBox(height: 10),
            Text('$companyName - $location',
                style: TobetoTextStyle.poppins.captionGrayNormal18),
            const SizedBox(height: 10),
            Text(
              'İş Tipi: $jobType',
              style: TobetoTextStyle.poppins.bodyGrayDarkNormal16,
            ),
            const SizedBox(height: 10),
            Text(
              'Başvuru Tarihi: $appliedDate',
              style: TobetoTextStyle.poppins.bodyGrayDarkNormal16,
            ),
            const SizedBox(height: 20),
            Text('İş Tanımı', style: TobetoTextStyle.poppins.titlePurpleBold24),
            const SizedBox(height: 10),
            Text('Detaylar...',
                style: TobetoTextStyle.poppins.bodyGrayDarkNormal16),
          ],
        ),
      ),
    );
  }
}
