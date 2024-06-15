import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String aboutMe;
  final int areaId;
  final String birthday;
  final String country;
  final String disabilityStatus;
  final String district;
  final String email;
  final String firstName;
  final String gender;
  final String githubAddress;
  final String lastName;
  final String militaryStatus;
  final String neighborhoodAndStreet;
  final String phoneNumber;
  final String province;

  UserModel({
    required this.aboutMe,
    required this.areaId,
    required this.birthday,
    required this.country,
    required this.disabilityStatus,
    required this.district,
    required this.email,
    required this.firstName,
    required this.gender,
    required this.githubAddress,
    required this.lastName,
    required this.militaryStatus,
    required this.neighborhoodAndStreet,
    required this.phoneNumber,
    required this.province,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      aboutMe: map['about_me'] ?? '',
      areaId: map['area_id'] ?? 0,
      birthday: map['birthday'] ?? '',
      country: map['country'] ?? '',
      disabilityStatus: map['disability_status'] ?? '',
      district: map['district'] ?? '',
      email: map['email'] ?? '',
      firstName: map['firstName'] ?? '',
      gender: map['gender'] ?? '',
      githubAddress: map['github_address'] ?? '',
      lastName: map['lastName'] ?? '',
      militaryStatus: map['military_statu'] ?? '',
      neighborhoodAndStreet: map['neighborhood_and_street'] ?? '',
      phoneNumber: map['phone_number'] ?? '',
      province: map['province'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'about_me': aboutMe,
      'area_id': areaId,
      'birthday': birthday,
      'country': country,
      'disability_status': disabilityStatus,
      'district': district,
      'email': email,
      'firstName': firstName,
      'gender': gender,
      'github_address': githubAddress,
      'lastName': lastName,
      'military_statu': militaryStatus,
      'neighborhood_and_street': neighborhoodAndStreet,
      'phone_number': phoneNumber,
      'province': province,
    };
  }
}

class ProjectOrAwardModel {
  final String projectOrAward;
  final DateTime history;

  ProjectOrAwardModel({
    required this.projectOrAward,
    required this.history,
  });

  factory ProjectOrAwardModel.fromMap(Map<String, dynamic> map) {
    return ProjectOrAwardModel(
      projectOrAward: map['project_or_award'] ?? '',
      history: (map['history'] as Timestamp?)?.toDate() ?? DateTime.now(),
    );
  }
}

class MediaAccountModel {
  final String behance;
  final String dribble;
  final String instagram;
  final String linkedIn;
  final String twitter;

  MediaAccountModel({
    required this.behance,
    required this.dribble,
    required this.instagram,
    required this.linkedIn,
    required this.twitter,
  });

  factory MediaAccountModel.fromMap(Map<String, dynamic> map) {
    return MediaAccountModel(
      behance: map['behance'] ?? '',
      dribble: map['dribble'] ?? '',
      instagram: map['instagram'] ?? '',
      linkedIn: map['linkedIn'] ?? '',
      twitter: map['twitter'] ?? '',
    );
  }
}

class ForeignLanguageModel {
  final String languageName;
  final String languageLevel;

  ForeignLanguageModel({required this.languageName, required this.languageLevel});

  factory ForeignLanguageModel.fromMap(Map<String, dynamic> map) {
    return ForeignLanguageModel(
      languageName: map['language_name'] ?? '',
      languageLevel: map['language_level'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'language_name': languageName,
      'language_level': languageLevel,
    };
  }
}

class ExperienceModel {
  final String companyName;
  final String experienceType;
  final DateTime jobCompletion;
  final String position;
  final String sector;
  final String selectCity;
  final DateTime startOfBusiness;

  ExperienceModel({
    required this.companyName,
    required this.experienceType,
    required this.jobCompletion,
    required this.position,
    required this.sector,
    required this.selectCity,
    required this.startOfBusiness,
  });

  factory ExperienceModel.fromMap(Map<String, dynamic> map) {
    return ExperienceModel(
      companyName: map['company_name'] ?? '',
      experienceType: map['experience_type'] ?? '',
      jobCompletion: (map['job_completion'] as Timestamp?)?.toDate() ?? DateTime.now(),
      position: map['position'] ?? '',
      sector: map['sector'] ?? '',
      selectCity: map['select_city'] ?? '',
      startOfBusiness: (map['start_of_business'] as Timestamp?)?.toDate() ?? DateTime.now(),
    );
  }
}

class EducationModel {
  final String educationalStatus;
  final int graduationYear;
  final String section;
  final int startingYear;
  final String university;

  EducationModel({
    required this.educationalStatus,
    required this.graduationYear,
    required this.section,
    required this.startingYear,
    required this.university,
  });

  factory EducationModel.fromMap(Map<String, dynamic> map) {
    return EducationModel(
      educationalStatus: map['educational_status'] ?? '',
      graduationYear: map['graduation_year'] ?? 0,
      section: map['section'] ?? '',
      startingYear: map['starting_year'] ?? 0,
      university: map['university'] ?? '',
    );
  }
}

class CompetencyModel {
  final List<String> competencies;

  CompetencyModel({
    required this.competencies,
  });

  factory CompetencyModel.fromMap(Map<String, dynamic> map) {
    return CompetencyModel(
      competencies: List<String>.from(map['maturalist'] ?? []),
    );
  }
}

class CommunityModel {
  final String name;
  final String titleOrPosition;

  CommunityModel({
    required this.name,
    required this.titleOrPosition,
  });

  factory CommunityModel.fromMap(Map<String, dynamic> map) {
    return CommunityModel(
      name: map['Name'] ?? '',
      titleOrPosition: map['title_or_position'] ?? '',
    );
  }
}

class CertificateModel {
  final String fileName;
  final String fileType;
  final int history;

  CertificateModel({
    required this.fileName,
    required this.fileType,
    required this.history,
  });

  factory CertificateModel.fromMap(Map<String, dynamic> map) {
    return CertificateModel(
      fileName: map['file_name'] ?? '',
      fileType: map['file_type'] ?? '',
      history: map['hiistory'] ?? 0,
    );
  }
}
