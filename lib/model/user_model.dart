import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? id;
  final String firstName;
  final String lastName;
  final int? phoneNumber;
  final int? birthDate;
  final String? gender;
  final String? militaryStatu;
  final String? disabledStatu;
  final String email;
  final int? identification;
  final String? github;
  final String? country;
  final String? city;
  final String? district;
  final String? street;
  final String? aboutMe;
  final String? skill;
  final String? avatarUrl;

  UserModel({
    this.id,
    this.avatarUrl,
    required this.firstName,
    required this.lastName,
    this.phoneNumber,
    this.birthDate,
    this.gender,
    this.militaryStatu,
    this.disabledStatu,
    required this.email,
    this.identification,
    this.github,
    this.country,
    this.city,
    this.district,
    this.street,
    this.aboutMe,
    this.skill,
  });

  factory UserModel.fromFirestore(DocumentSnapshot doc) {
    return UserModel(
      firstName: doc['firstName'] ?? '',
      lastName: doc['lastName'] ?? '',
      phoneNumber: doc['phoneNumber'] ?? '',
      birthDate: doc['birthday'] ?? '',
      gender: doc['gender'] ?? '',
      militaryStatu: doc['militaryStatu'] ?? '',
      disabledStatu: doc['disabledStatu'] ?? '',
      email: doc['email'] ?? '',
      identification: doc['identification'] ?? '',
      github: doc['github'] ?? '',
      country: doc['country'] ?? '',
      city: doc['city'],
      district: doc['district'] ?? '',
      street: doc['street'] ?? '',
      aboutMe: doc['aboutMe'] ?? '',
      skill: doc['skill'] ?? '',
      avatarUrl: doc['avatarUrl'] ?? '',
    );
  }

  factory UserModel.fromMap(Map<String, dynamic> data) {
    return UserModel(
      id: data['id'] ?? '',
      firstName: data['firstName'] ?? '',
      lastName: data['lastName'] ?? '',
      phoneNumber: data['phoneNumber'] ?? '',
      birthDate: data['birthday'] ?? '',
      gender: data['gender'] ?? '',
      militaryStatu: data['militaryStatu'] ?? '',
      disabledStatu: data['disabledStatu'] ?? '',
      email: data['email'] ?? '',
      identification: data['identification'] ?? '',
      github: data['github'] ?? '',
      country: data['country'] ?? '',
      city: data['city'] ?? '',
      district: data['district'] ?? '',
      street: data['street'] ?? '',
      aboutMe: data['aboutMe'] ?? '',
      skill: data['skill'] ?? '',
      avatarUrl: data['avatarUrl'] ?? '',
    );
  }
}
