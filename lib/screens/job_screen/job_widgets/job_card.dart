import 'package:flutter/material.dart';
import 'package:tobeto_mobile_app/model/job_model.dart';
import 'package:tobeto_mobile_app/utils/constant/colors.dart';
import 'package:tobeto_mobile_app/utils/themes/text_style.dart';
import '../job_details.dart';

class JobCard extends StatelessWidget {
  final Job job;

  const JobCard({super.key, required this.job});

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Card(
      color: isDarkMode ? TobetoColor.formField.darkGrey : TobetoColor.card.cream,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              job.jobType,
              style: TobetoTextStyle.poppins(context).bodyPurpleBold16,
            ),
            const SizedBox(height: 5),
            Text(
              job.jobTitle,
              style: TobetoTextStyle.poppins(context).subtitleBlackNormal20,
            ),
            const SizedBox(height: 5),
            Text(
              '${job.companyName} - ${job.location}',
              style: TobetoTextStyle.poppins(context).bodyGrayLightNormal16,
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  job.appliedDate.toLocal().toString().split(' ')[0],
                  style: TobetoTextStyle.poppins(context).bodyGrayLightNormal16,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => JobDetails(job: job),
                      ),
                    );
                  },
                  child: const Text(
                    'Detaylar',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
