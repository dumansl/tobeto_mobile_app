// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModel {
  String? id;
  String? firstName;
  String? lastName;
  String? email;
  int? identification;
  String? github;
  String? country;
  String? city;
  String? district;
  String? street;
  String? aboutMe;
  UserModel({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.identification,
    this.github,
    this.country,
    this.city,
    this.district,
    this.street,
    this.aboutMe,
  });

  UserModel copyWith({
    String? id,
    String? firstName,
    String? lastName,
    String? email,
    int? identification,
    String? github,
    String? country,
    String? city,
    String? district,
    String? street,
    String? aboutMe,
  }) {
    return UserModel(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      identification: identification ?? this.identification,
      github: github ?? this.github,
      country: country ?? this.country,
      city: city ?? this.city,
      district: district ?? this.district,
      street: street ?? this.street,
      aboutMe: aboutMe ?? this.aboutMe,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'identification': identification,
      'github': github,
      'country': country,
      'city': city,
      'district': district,
      'street': street,
      'aboutMe': aboutMe,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] != null ? map['id'] as String : null,
      firstName: map['firstName'] != null ? map['firstName'] as String : null,
      lastName: map['lastName'] != null ? map['lastName'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      identification:
          map['identification'] != null ? map['identification'] as int : null,
      github: map['github'] != null ? map['github'] as String : null,
      country: map['country'] != null ? map['country'] as String : null,
      city: map['city'] != null ? map['city'] as String : null,
      district: map['district'] != null ? map['district'] as String : null,
      street: map['street'] != null ? map['street'] as String : null,
      aboutMe: map['aboutMe'] != null ? map['aboutMe'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(id: $id, firstName: $firstName, lastName: $lastName, email: $email, identification: $identification, github: $github, country: $country, city: $city, district: $district, street: $street, aboutMe: $aboutMe)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.email == email &&
        other.identification == identification &&
        other.github == github &&
        other.country == country &&
        other.city == city &&
        other.district == district &&
        other.street == street &&
        other.aboutMe == aboutMe;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        firstName.hashCode ^
        lastName.hashCode ^
        email.hashCode ^
        identification.hashCode ^
        github.hashCode ^
        country.hashCode ^
        city.hashCode ^
        district.hashCode ^
        street.hashCode ^
        aboutMe.hashCode;
  }
}
