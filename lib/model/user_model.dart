import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  late final String firstName;
  final String lastName;
  late final String email;
  final String? phone;
  final String? aboutMe;
  final int? areaId;
  final String? birthday;
  final String? country;
  final String? disabilityStatus;
  final String? district;
  final String? gender;
  final String? githubAddress;
  final String? militaryStatus;
  final String? neighborhoodAndStreet;
  final String? phoneNumber;
  final String? province;
  final List<ExperienceModel>? experiences;
  final List<EducationModel>? educations;
  final CompetencyModel? competencies;
  final List<CertificateModel>? certificates;
  final List<CommunityModel>? communities;
  final List<ProjectOrAwardModel>? projectsAndAwards;
  final MediaAccountModel? mediaAccounts;
  final List<ForeignLanguageModel>? foreignLanguages;

  UserModel({
    required this.email,
    required this.phone,
    this.aboutMe,
    this.areaId,
    this.birthday,
    this.country,
    this.disabilityStatus,
    this.district,
    required this.firstName,
    this.gender,
    this.githubAddress,
    required this.lastName,
    this.militaryStatus,
    this.neighborhoodAndStreet,
    this.phoneNumber,
    this.province,
    required this.experiences,
    required this.educations,
    this.competencies,
    required this.certificates,
    required this.communities,
    required this.projectsAndAwards,
    this.mediaAccounts,
    required this.foreignLanguages,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      email: map['email'] ?? '',
      phone: map['phone'] ?? '',
      aboutMe: map['aboutMe'],
      areaId: map['area_id'],
      birthday: map['birthday'],
      country: map['country'],
      disabilityStatus: map['disabilityStatus'],
      district: map['district'],
      firstName: map['firstName'],
      gender: map['gender'],
      githubAddress: map['github'],
      lastName: map['lastName'],
      militaryStatus: map['military_status'],
      neighborhoodAndStreet: map['street'],
      phoneNumber: map['phoneNumber'],
      province: map['city'],
      experiences: (map['experiences'] as List<dynamic>?)
              ?.map((item) =>
                  ExperienceModel.fromMap(item as Map<String, dynamic>))
              .toList() ??
          [],
      educations: (map['educations'] as List<dynamic>?)
              ?.map((item) =>
                  EducationModel.fromMap(item as Map<String, dynamic>))
              .toList() ??
          [],
      competencies: map['competencies'] != null
          ? CompetencyModel.fromMap(map['competencies'] as Map<String, dynamic>)
          : null,
      certificates: (map['certificates'] as List<dynamic>?)
              ?.map((item) =>
                  CertificateModel.fromMap(item as Map<String, dynamic>))
              .toList() ??
          [],
      communities: (map['communities'] as List<dynamic>?)
              ?.map((item) =>
                  CommunityModel.fromMap(item as Map<String, dynamic>))
              .toList() ??
          [],
      projectsAndAwards: (map['projectsAndAwards'] as List<dynamic>?)
              ?.map((item) =>
                  ProjectOrAwardModel.fromMap(item as Map<String, dynamic>))
              .toList() ??
          [],
      mediaAccounts: map['mediaAccounts'] != null
          ? MediaAccountModel.fromMap(
              map['mediaAccounts'] as Map<String, dynamic>)
          : null,
      foreignLanguages: (map['foreignLanguages'] as List<dynamic>?)
              ?.map((item) =>
                  ForeignLanguageModel.fromMap(item as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'phone': phone,
      'aboutMe': aboutMe,
      'areaId': areaId,
      'birthday': birthday,
      'country': country,
      'disabilityStatus': disabilityStatus,
      'district': district,
      'firstName': firstName,
      'gender': gender,
      'github': githubAddress,
      'lastName': lastName,
      'militaryStatus': militaryStatus,
      'street': neighborhoodAndStreet,
      'phoneNumber': phoneNumber,
      'city': province,
      'experiences': experiences!.map((item) => item.toMap()).toList(),
      'educations': educations!.map((item) => item.toMap()).toList(),
      'competencies': competencies?.toMap(),
      'certificates': certificates!.map((item) => item.toMap()).toList(),
      'communities': communities!.map((item) => item.toMap()).toList(),
      'projectsAndAwards':
          projectsAndAwards!.map((item) => item.toMap()).toList(),
      'mediaAccounts': mediaAccounts?.toMap(),
      'foreignLanguages':
          foreignLanguages!.map((item) => item.toMap()).toList(),
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

  Map<String, dynamic> toMap() {
    return {
      'project_or_award': projectOrAward,
      'history': Timestamp.fromDate(history),
    };
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

  Map<String, dynamic> toMap() {
    return {
      'behance': behance,
      'dribble': dribble,
      'instagram': instagram,
      'linkedIn': linkedIn,
      'twitter': twitter,
    };
  }
}

class ForeignLanguageModel {
  final String languageName;
  final String languageLevel;

  ForeignLanguageModel({
    required this.languageName,
    required this.languageLevel,
  });

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
      jobCompletion:
          (map['job_completion'] as Timestamp?)?.toDate() ?? DateTime.now(),
      position: map['position'] ?? '',
      sector: map['sector'] ?? '',
      selectCity: map['select_city'] ?? '',
      startOfBusiness:
          (map['start_of_business'] as Timestamp?)?.toDate() ?? DateTime.now(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'company_name': companyName,
      'experience_type': experienceType,
      'job_completion': Timestamp.fromDate(jobCompletion),
      'position': position,
      'sector': sector,
      'select_city': selectCity,
      'start_of_business': Timestamp.fromDate(startOfBusiness),
    };
  }
}

class EducationModel {
  final String? educationalStatus;
  final int? graduationYear;
  final String? section;
  final int? startingYear;
  final String? university;

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

  Map<String, dynamic> toMap() {
    return {
      'educational_status': educationalStatus,
      'graduation_year': graduationYear,
      'section': section,
      'starting_year': startingYear,
      'university': university,
    };
  }
}

class CompetencyModel {
  final List<String>? competencies;

  CompetencyModel({
    required this.competencies,
  });

  factory CompetencyModel.fromMap(Map<String, dynamic> map) {
    return CompetencyModel(
      competencies: List<String>.from(map['maturalist'] ?? []),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'maturalist': competencies,
    };
  }
}

class CommunityModel {
  final String? name;
  final String? titleOrPosition;

  CommunityModel({
    required this.name,
    required this.titleOrPosition,
  });

  factory CommunityModel.fromMap(Map<String, dynamic> map) {
    return CommunityModel(
      name: map['club_or_community_name'] ?? '',
      titleOrPosition: map['title_or_position'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'club_or_community_name': name,
      'title_or_position': titleOrPosition,
    };
  }
}

class CertificateModel {
  final String? fileName;
  final String? fileType;
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
      history: map['history'] ?? 0,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'file_name': fileName,
      'file_type': fileType,
      'history': history,
    };
  }
}
