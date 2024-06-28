import 'package:flutter/material.dart';
import 'package:tobeto_mobile_app/model/job_model.dart';
import 'package:tobeto_mobile_app/screens/dashboard_screen/widgets/fixed_appbar.dart';
import 'package:tobeto_mobile_app/utils/themes/text_style.dart';

class JobDetails extends StatelessWidget {
  final Job job;

  const JobDetails({super.key, required this.job});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FixedAppbar(
        title: Text('İş Süreçlerim', style: TobetoTextStyle.poppins(context).subHeadlinePurpleBold28),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(job.jobTitle, style: TobetoTextStyle.poppins(context).titlePurpleBold24),
            const SizedBox(height: 10),
            Text('${job.companyName} - ${job.location}', style: TobetoTextStyle.poppins(context).captionGrayNormal18),
            const SizedBox(height: 10),
            Text('İş Tipi: ${job.jobType}', style: TobetoTextStyle.poppins(context).bodyGrayDarkNormal16),
            const SizedBox(height: 10),
            Text('Başvuru Tarihi: ${job.appliedDate.toLocal().toString().split(' ')[0]}',
                style: TobetoTextStyle.poppins(context).bodyGrayDarkNormal16),
            const SizedBox(height: 20),
            Text('İş Tanımı', style: TobetoTextStyle.poppins(context).titlePurpleBold24),
            const SizedBox(height: 10),
            Text('Detaylar...', style: TobetoTextStyle.poppins(context).bodyGrayDarkNormal16),
          ],
        ),
      ),
    );
  }
}
