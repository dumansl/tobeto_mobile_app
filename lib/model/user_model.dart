import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  //Kişisel Bilgiler
  final String? id;
  final String firstName;
  final String lastName;
  final int phoneNumber;
  final int birthDate;
  final String gender;
  final String militaryStatu;
  final String disabledStatu;
  final String email;
  final int identification;
  final String github;
  final String country;
  final String city;
  final String district;
  final String street;
  final String aboutMe;
  //Deneyimler
  final String companyName;
  final String position;
  final String experienceType;
  final String sector;
  final String workCity;
  final String startWork;
  final String endWork; //Çalışmaya devam ediyorum checkBox
  final String workDescription;
  final bool workStatu;
  //Eğitim Hayatı
//   final String educationStatu;
//   final String univercity;
//   final String graduatedDepartment;
//   final String startUnivercityDate;
//   final String graduateUnivercityDate;
//   bool continueUnivercity; // Devam ediyorum checkBox
//   //Yetkinlikler
//   final String skill;
// //Sertifikalar
//   final String certificateName;
//   final String certificatesDate; // dosya yükleme kutusu
//   //Üye ve Topluluklar
//   final String communityName;
//   final String communityStatu;
//   //Projeler ve Ödüller
//   final String projectName;
//   final String projectDate;
//   //Medya Hesapları
//   final String socialMediaName;
//   final String socialMediaLink;
//   //Yabancı Diller
//   final String languageName;
//   final String languageLevel;
//   //Ayarlar
//   final String oldPassword;
//   final String newPassword;
//   final String oldPasswordAgain;

  UserModel({
    this.id,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.birthDate,
    required this.gender,
    required this.militaryStatu,
    required this.disabledStatu,
    required this.email,
    required this.identification,
    required this.github,
    required this.country,
    required this.city,
    required this.district,
    required this.street,
    required this.aboutMe,
    required this.companyName,
    required this.position,
    required this.experienceType,
    required this.sector,
    required this.workCity,
    required this.startWork,
    required this.endWork,
    required this.workDescription,
    required this.workStatu,
  });

  factory UserModel.fromFirestore(DocumentSnapshot doc) {
    return UserModel(
      firstName: doc['firstName'],
      lastName: doc['lastName'],
      phoneNumber: doc['phoneNumber'],
      birthDate: doc['birthday'],
      gender: doc['gender'],
      militaryStatu: doc['militaryStatu'],
      disabledStatu: doc['disabledStatu'],
      email: doc['email'],
      identification: doc['identification'],
      github: doc['github'],
      country: doc['country'],
      city: doc['city'],
      district: doc['district'],
      street: doc['street'],
      aboutMe: doc['aboutMe'],
      companyName: doc['companyName'],
      position: doc['position'],
      experienceType: doc['experienceType'],
      sector: doc['sector'],
      workCity: doc['workCity'],
      startWork: doc['startWork'],
      endWork: doc['endWork'],
      workDescription: doc['workDescription'],
      workStatu: doc['workStatu'],
    );
  }

  factory UserModel.fromMap(Map<String, dynamic> data) {
    return UserModel(
      id: data['id'],
      firstName: data['firstName'],
      lastName: data['lastName'],
      phoneNumber: data['phoneNumber'],
      birthDate: data['birthday'],
      gender: data['gender'],
      militaryStatu: data['militaryStatu'],
      disabledStatu: data['disabledStatu'],
      email: data['email'],
      identification: data['identification'],
      github: data['github'],
      country: data['country'],
      city: data['city'],
      district: data['district'],
      street: data['street'],
      aboutMe: data['aboutMe'],
      companyName: data['companyName'],
      position: data['position'],
      experienceType: data['experienceType'],
      sector: data['sector'],
      workCity: data['workCity'],
      startWork: data['startWork'],
      endWork: data['endWork'],
      workDescription: data['workDescription'],
      workStatu: data['workStatu'],
    );
  }
}


// //Deneyimler
//   String companyName;
//   String position;
//   String? experienceType;
//   String? sector;
//   String? workCity;
//   String? startWork;
//   String? endWork; //Çalışmaya devam ediyorum checkBox
//   String? workDescription;
//   //Eğitim Hayatı
//   String? educationStatu;
//   String? univercity;
//   String? graduatedDepartment;
//   String? startUnivercityDate;
//   String? graduateUnivercityDate;
//   bool? continueUnivercity; // Devam ediyorum checkBox
//   //Yetkinlikler
//   String? skill;
// //Sertifikalar
//   String? certificateName;
//   String? certificatesDate; // dosya yükleme kutusu
//   //Üye ve Topluluklar
//   String? communityName;
//   String? communityStatu;
//   //Projeler ve Ödüller
//   String? projectName;
//   String? projectDate;
//   //Medya Hesapları
//   String? socialMediaName;
//   String? socialMediaLink;
//   //Yabancı Diller
//   String? languageName;
//   String? languageLevel;
//   //Ayarlar
//   String? oldPassword;
//   String? newPassword;
//   String? oldPasswordAgain;


