// import 'package:cloud_firestore/cloud_firestore.dart';

// class ExperienceModel {
//   final String companyName;
//   final String experienceType;
//   final DateTime jobCompletion;
//   final String position;
//   final String sector;
//   final String selectCity;
//   final DateTime startOfBusiness;

//   ExperienceModel({
//     required this.companyName,
//     required this.experienceType,
//     required this.jobCompletion,
//     required this.position,
//     required this.sector,
//     required this.selectCity,
//     required this.startOfBusiness,
//   });

//   factory ExperienceModel.fromMap(Map<String, dynamic> map) {
//     return ExperienceModel(
//       companyName: map['company_name'],
//       experienceType: map['experience_type'],
//       jobCompletion: (map['job_completion'] as Timestamp).toDate(),
//       position: map['position'],
//       sector: map['sector'],
//       selectCity: map['select_city'],
//       startOfBusiness: (map['start_of_business'] as Timestamp).toDate(),
//     );
//   }
// }
