// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModel {
  //Kişisel Bilgiler
  String? id;
  String? firstName;
  String? lastName;
  int? phoneNumber;
  int? birthDate;
  String? gender;
  String? militaryStatu;
  String? disabledStatu;
  String? email;
  int? identification;
  String? github;
  String? country;
  String? city;
  String? district;
  String? street;
  String? aboutMe;
  //Deneyimler
  String? companyName;
  String? position;
  String? experienceType;
  String? sector;
  String? workCity;
  String? startWork;
  String? endWork; //Çalışmaya devam ediyorum checkBox
  String? workDescription;
  //Eğitim Hayatı
  String? educationStatu;
  String? univercity;
  String? graduatedDepartment;
  String? startUnivercityDate;
  String? graduateUnivercityDate; // Devam ediyorum checkBox
  //Yetkinlikler
  String? skill;
//Sertifikalar
  String? certificateName;
  String? certificatesDate; // dosya yükleme kutusu
  //Üye ve Topluluklar
  String? communityName;
  String? communityStatu;
  //Projeler ve Ödüller
  String? projectName;
  String? projectDate;
  //Medya Hesapları
  String? socialMediaName;
  String? socialMediaLink;
  //Yabancı Diller
  String? languageName;
  String? languageLevel;
  //Ayarlar
  String? oldPassword;
  String? newPassword;
  String? oldPasswordAgain;
  UserModel({
    this.id,
    this.firstName,
    this.lastName,
    this.phoneNumber,
    this.birthDate,
    this.gender,
    this.militaryStatu,
    this.disabledStatu,
    this.email,
    this.identification,
    this.github,
    this.country,
    this.city,
    this.district,
    this.street,
    this.aboutMe,
    this.companyName,
    this.position,
    this.experienceType,
    this.sector,
    this.workCity,
    this.startWork,
    this.endWork,
    this.workDescription,
    this.educationStatu,
    this.univercity,
    this.graduatedDepartment,
    this.startUnivercityDate,
    this.graduateUnivercityDate,
    this.skill,
    this.certificateName,
    this.certificatesDate,
    this.communityName,
    this.communityStatu,
    this.projectName,
    this.projectDate,
    this.socialMediaName,
    this.socialMediaLink,
    this.languageName,
    this.languageLevel,
    this.oldPassword,
    this.newPassword,
    this.oldPasswordAgain,
  });

  UserModel copyWith({
    String? id,
    String? firstName,
    String? lastName,
    int? phoneNumber,
    int? birthDate,
    String? gender,
    String? militaryStatu,
    String? disabledStatu,
    String? email,
    int? identification,
    String? github,
    String? country,
    String? city,
    String? district,
    String? street,
    String? aboutMe,
    String? companyName,
    String? position,
    String? experienceType,
    String? sector,
    String? workCity,
    String? startWork,
    String? endWork,
    String? workDescription,
    String? educationStatu,
    String? univercity,
    String? graduatedDepartment,
    String? startUnivercityDate,
    String? graduateUnivercityDate,
    String? skill,
    String? certificateName,
    String? certificatesDate,
    String? communityName,
    String? communityStatu,
    String? projectName,
    String? projectDate,
    String? socialMediaName,
    String? socialMediaLink,
    String? languageName,
    String? languageLevel,
    String? oldPassword,
    String? newPassword,
    String? oldPasswordAgain,
  }) {
    return UserModel(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      birthDate: birthDate ?? this.birthDate,
      gender: gender ?? this.gender,
      militaryStatu: militaryStatu ?? this.militaryStatu,
      disabledStatu: disabledStatu ?? this.disabledStatu,
      email: email ?? this.email,
      identification: identification ?? this.identification,
      github: github ?? this.github,
      country: country ?? this.country,
      city: city ?? this.city,
      district: district ?? this.district,
      street: street ?? this.street,
      aboutMe: aboutMe ?? this.aboutMe,
      companyName: companyName ?? this.companyName,
      position: position ?? this.position,
      experienceType: experienceType ?? this.experienceType,
      sector: sector ?? this.sector,
      workCity: workCity ?? this.workCity,
      startWork: startWork ?? this.startWork,
      endWork: endWork ?? this.endWork,
      workDescription: workDescription ?? this.workDescription,
      educationStatu: educationStatu ?? this.educationStatu,
      univercity: univercity ?? this.univercity,
      graduatedDepartment: graduatedDepartment ?? this.graduatedDepartment,
      startUnivercityDate: startUnivercityDate ?? this.startUnivercityDate,
      graduateUnivercityDate: graduateUnivercityDate ?? this.graduateUnivercityDate,
      skill: skill ?? this.skill,
      certificateName: certificateName ?? this.certificateName,
      certificatesDate: certificatesDate ?? this.certificatesDate,
      communityName: communityName ?? this.communityName,
      communityStatu: communityStatu ?? this.communityStatu,
      projectName: projectName ?? this.projectName,
      projectDate: projectDate ?? this.projectDate,
      socialMediaName: socialMediaName ?? this.socialMediaName,
      socialMediaLink: socialMediaLink ?? this.socialMediaLink,
      languageName: languageName ?? this.languageName,
      languageLevel: languageLevel ?? this.languageLevel,
      oldPassword: oldPassword ?? this.oldPassword,
      newPassword: newPassword ?? this.newPassword,
      oldPasswordAgain: oldPasswordAgain ?? this.oldPasswordAgain,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'phoneNumber': phoneNumber,
      'birthDate': birthDate,
      'gender': gender,
      'militaryStatu': militaryStatu,
      'disabledStatu': disabledStatu,
      'email': email,
      'identification': identification,
      'github': github,
      'country': country,
      'city': city,
      'district': district,
      'street': street,
      'aboutMe': aboutMe,
      'companyName': companyName,
      'position': position,
      'experienceType': experienceType,
      'sector': sector,
      'workCity': workCity,
      'startWork': startWork,
      'endWork': endWork,
      'workDescription': workDescription,
      'educationStatu': educationStatu,
      'univercity': univercity,
      'graduatedDepartment': graduatedDepartment,
      'startUnivercityDate': startUnivercityDate,
      'graduateUnivercityDate': graduateUnivercityDate,
      'skill': skill,
      'certificateName': certificateName,
      'certificatesDate': certificatesDate,
      'communityName': communityName,
      'communityStatu': communityStatu,
      'projectName': projectName,
      'projectDate': projectDate,
      'socialMediaName': socialMediaName,
      'socialMediaLink': socialMediaLink,
      'languageName': languageName,
      'languageLevel': languageLevel,
      'oldPassword': oldPassword,
      'newPassword': newPassword,
      'oldPasswordAgain': oldPasswordAgain,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] != null ? map['id'] as String : null,
      firstName: map['firstName'] != null ? map['firstName'] as String : null,
      lastName: map['lastName'] != null ? map['lastName'] as String : null,
      phoneNumber: map['phoneNumber'] != null ? map['phoneNumber'] as int : null,
      birthDate: map['birthDate'] != null ? map['birthDate'] as int : null,
      gender: map['gender'] != null ? map['gender'] as String : null,
      militaryStatu: map['militaryStatu'] != null ? map['militaryStatu'] as String : null,
      disabledStatu: map['disabledStatu'] != null ? map['disabledStatu'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      identification: map['identification'] != null ? map['identification'] as int : null,
      github: map['github'] != null ? map['github'] as String : null,
      country: map['country'] != null ? map['country'] as String : null,
      city: map['city'] != null ? map['city'] as String : null,
      district: map['district'] != null ? map['district'] as String : null,
      street: map['street'] != null ? map['street'] as String : null,
      aboutMe: map['aboutMe'] != null ? map['aboutMe'] as String : null,
      companyName: map['companyName'] != null ? map['companyName'] as String : null,
      position: map['position'] != null ? map['position'] as String : null,
      experienceType: map['experienceType'] != null ? map['experienceType'] as String : null,
      sector: map['sector'] != null ? map['sector'] as String : null,
      workCity: map['workCity'] != null ? map['workCity'] as String : null,
      startWork: map['startWork'] != null ? map['startWork'] as String : null,
      endWork: map['endWork'] != null ? map['endWork'] as String : null,
      workDescription: map['workDescription'] != null ? map['workDescription'] as String : null,
      educationStatu: map['educationStatu'] != null ? map['educationStatu'] as String : null,
      univercity: map['univercity'] != null ? map['univercity'] as String : null,
      graduatedDepartment: map['graduatedDepartment'] != null ? map['graduatedDepartment'] as String : null,
      startUnivercityDate: map['startUnivercityDate'] != null ? map['startUnivercityDate'] as String : null,
      graduateUnivercityDate: map['graduateUnivercityDate'] != null ? map['graduateUnivercityDate'] as String : null,
      skill: map['skill'] != null ? map['skill'] as String : null,
      certificateName: map['certificateName'] != null ? map['certificateName'] as String : null,
      certificatesDate: map['certificatesDate'] != null ? map['certificatesDate'] as String : null,
      communityName: map['communityName'] != null ? map['communityName'] as String : null,
      communityStatu: map['communityStatu'] != null ? map['communityStatu'] as String : null,
      projectName: map['projectName'] != null ? map['projectName'] as String : null,
      projectDate: map['projectDate'] != null ? map['projectDate'] as String : null,
      socialMediaName: map['socialMediaName'] != null ? map['socialMediaName'] as String : null,
      socialMediaLink: map['socialMediaLink'] != null ? map['socialMediaLink'] as String : null,
      languageName: map['languageName'] != null ? map['languageName'] as String : null,
      languageLevel: map['languageLevel'] != null ? map['languageLevel'] as String : null,
      oldPassword: map['oldPassword'] != null ? map['oldPassword'] as String : null,
      newPassword: map['newPassword'] != null ? map['newPassword'] as String : null,
      oldPasswordAgain: map['oldPasswordAgain'] != null ? map['oldPasswordAgain'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(id: $id, firstName: $firstName, lastName: $lastName, phoneNumber: $phoneNumber, birthDate: $birthDate, gender: $gender, militaryStatu: $militaryStatu, disabledStatu: $disabledStatu, email: $email, identification: $identification, github: $github, country: $country, city: $city, district: $district, street: $street, aboutMe: $aboutMe, companyName: $companyName, position: $position, experienceType: $experienceType, sector: $sector, workCity: $workCity, startWork: $startWork, endWork: $endWork, workDescription: $workDescription, educationStatu: $educationStatu, univercity: $univercity, graduatedDepartment: $graduatedDepartment, startUnivercityDate: $startUnivercityDate, graduateUnivercityDate: $graduateUnivercityDate, skill: $skill, certificateName: $certificateName, certificatesDate: $certificatesDate, communityName: $communityName, communityStatu: $communityStatu, projectName: $projectName, projectDate: $projectDate, socialMediaName: $socialMediaName, socialMediaLink: $socialMediaLink, languageName: $languageName, languageLevel: $languageLevel, oldPassword: $oldPassword, newPassword: $newPassword, oldPasswordAgain: $oldPasswordAgain)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.phoneNumber == phoneNumber &&
        other.birthDate == birthDate &&
        other.gender == gender &&
        other.militaryStatu == militaryStatu &&
        other.disabledStatu == disabledStatu &&
        other.email == email &&
        other.identification == identification &&
        other.github == github &&
        other.country == country &&
        other.city == city &&
        other.district == district &&
        other.street == street &&
        other.aboutMe == aboutMe &&
        other.companyName == companyName &&
        other.position == position &&
        other.experienceType == experienceType &&
        other.sector == sector &&
        other.workCity == workCity &&
        other.startWork == startWork &&
        other.endWork == endWork &&
        other.workDescription == workDescription &&
        other.educationStatu == educationStatu &&
        other.univercity == univercity &&
        other.graduatedDepartment == graduatedDepartment &&
        other.startUnivercityDate == startUnivercityDate &&
        other.graduateUnivercityDate == graduateUnivercityDate &&
        other.skill == skill &&
        other.certificateName == certificateName &&
        other.certificatesDate == certificatesDate &&
        other.communityName == communityName &&
        other.communityStatu == communityStatu &&
        other.projectName == projectName &&
        other.projectDate == projectDate &&
        other.socialMediaName == socialMediaName &&
        other.socialMediaLink == socialMediaLink &&
        other.languageName == languageName &&
        other.languageLevel == languageLevel &&
        other.oldPassword == oldPassword &&
        other.newPassword == newPassword &&
        other.oldPasswordAgain == oldPasswordAgain;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        firstName.hashCode ^
        lastName.hashCode ^
        phoneNumber.hashCode ^
        birthDate.hashCode ^
        gender.hashCode ^
        militaryStatu.hashCode ^
        disabledStatu.hashCode ^
        email.hashCode ^
        identification.hashCode ^
        github.hashCode ^
        country.hashCode ^
        city.hashCode ^
        district.hashCode ^
        street.hashCode ^
        aboutMe.hashCode ^
        companyName.hashCode ^
        position.hashCode ^
        experienceType.hashCode ^
        sector.hashCode ^
        workCity.hashCode ^
        startWork.hashCode ^
        endWork.hashCode ^
        workDescription.hashCode ^
        educationStatu.hashCode ^
        univercity.hashCode ^
        graduatedDepartment.hashCode ^
        startUnivercityDate.hashCode ^
        graduateUnivercityDate.hashCode ^
        skill.hashCode ^
        certificateName.hashCode ^
        certificatesDate.hashCode ^
        communityName.hashCode ^
        communityStatu.hashCode ^
        projectName.hashCode ^
        projectDate.hashCode ^
        socialMediaName.hashCode ^
        socialMediaLink.hashCode ^
        languageName.hashCode ^
        languageLevel.hashCode ^
        oldPassword.hashCode ^
        newPassword.hashCode ^
        oldPasswordAgain.hashCode;
  }
}
