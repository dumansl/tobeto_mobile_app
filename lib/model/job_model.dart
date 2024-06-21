import 'package:cloud_firestore/cloud_firestore.dart';

class Job {
  final String jobType;
  final String jobTitle;
  final String companyName;
  final String location;
  final DateTime appliedDate;
  final bool interview;
  final String id;

  Job({
    required this.jobType,
    required this.jobTitle,
    required this.companyName,
    required this.location,
    required this.appliedDate,
    required this.interview,
    required this.id,
  });

  factory Job.fromFirestore(Map<String, dynamic> data, String id) {
    return Job(
      jobType: data['jobType'],
      jobTitle: data['jobTitle'],
      companyName: data['companyName'],
      location: data['location'],
      appliedDate: (data['appliedDate'] as Timestamp).toDate(),
      interview: data['interview'],
      id: id,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'jobType': jobType,
      'jobTitle': jobTitle,
      'companyName': companyName,
      'location': location,
      'appliedDate': Timestamp.fromDate(appliedDate),
      'interview': interview,
    };
  }
}
