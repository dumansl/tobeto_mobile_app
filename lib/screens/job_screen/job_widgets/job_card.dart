import 'package:flutter/material.dart';
import 'package:tobeto_mobile_app/utils/constant/colors.dart';
import '../job_details.dart';

class JobCard extends StatelessWidget {
  final String jobType;
  final String jobTitle;
  final String companyName;
  final String location;
  final String appliedDate;

  JobCard({
    required this.jobType,
    required this.jobTitle,
    required this.companyName,
    required this.location,
    required this.appliedDate,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              jobType,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
                color: TobetoColor.purple,
              ),
            ),
            SizedBox(height: 5),
            Text(
              jobTitle,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            Text(
              '$companyName - $location',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '$appliedDate',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: Colors.grey[600],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => JobDetails(
                          jobType: jobType,
                          jobTitle: jobTitle,
                          companyName: companyName,
                          location: location,
                          appliedDate: appliedDate,
                        ),
                      ),
                    );
                  },
                  child: Text(
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
