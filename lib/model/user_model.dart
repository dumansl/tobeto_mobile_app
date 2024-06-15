// models/user_model.dart

class UserModel {
  final String? aboutMe;
  final int? areaId;
  final String? birthday;
  final String? country;
  final String? disabilityStatus;
  final String? district;
  final String? email;
  final String? firstName;
  final String? gender;
  final String? githubAddress;
  final String? lastName;
  final String? militaryStatus;
  final String? neighborhoodAndStreet;
  final String? phoneNumber;
  final String? province;

  UserModel({
    this.aboutMe,
    this.areaId,
    this.birthday,
    this.country,
    this.disabilityStatus,
    this.district,
    this.email,
    this.firstName,
    this.gender,
    this.githubAddress,
    this.lastName,
    this.militaryStatus,
    this.neighborhoodAndStreet,
    this.phoneNumber,
    this.province,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      aboutMe: map['about_me'],
      areaId: map['area_id'],
      birthday: map['birthday'],
      country: map['country'],
      disabilityStatus: map['disability_status'],
      district: map['district'],
      email: map['email'],
      firstName: map['firstName'],
      gender: map['gender'],
      githubAddress: map['github_address'],
      lastName: map['lastName'],
      militaryStatus: map['military_statu'],
      neighborhoodAndStreet: map['neighborhood_and_street'],
      phoneNumber: map['phone_number'],
      province: map['province'],
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
