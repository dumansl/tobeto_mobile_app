import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:tobeto_mobile_app/model/user_model.dart';
import 'package:tobeto_mobile_app/screens/profile_editting/screen/personal_information.dart';

class UserService {
  final String userId;
  FirebaseFirestore db = FirebaseFirestore.instance;
  final FirebaseStorage storage = FirebaseStorage.instance;
  UserService() : userId = FirebaseAuth.instance.currentUser!.uid;
  FirebaseMessaging fcm = FirebaseMessaging.instance;

  Future<List<dynamic>?> _getCollectionData(String collectionName) async {
    final DocumentSnapshot snapshot = await db.collection('users').doc(userId).get();
    var data = snapshot.data() as Map<String, dynamic>;
    return data[collectionName];
  }

  Future<void> _updateCollection(String collectionName, dynamic dataToUpdate) async {
    await db.collection('users').doc(userId).update({
      collectionName: dataToUpdate,
    });
  }

  Future<void> _addToCollection(String collectionName, dynamic dataToAdd) async {
    await _updateCollection(collectionName, FieldValue.arrayUnion([dataToAdd]));
  }

  Future<void> _removeFromCollection(String collectionName, dynamic dataToRemove) async {
    await _updateCollection(collectionName, FieldValue.arrayRemove([dataToRemove]));
  }

  Future<List<String>> loadSkills() async {
    final data = await _getCollectionData('skill');
    return List<String>.from(data ?? []);
  }

  Future<void> addSkill(String skill) async {
    await _addToCollection('skill', skill);
  }

  Future<void> removeSkill(String skill) async {
    await _removeFromCollection('skill', skill);
  }

  Future<List<Map<String, dynamic>>> loadWorkLife() async {
    final data = await _getCollectionData('workLife');
    return List<Map<String, dynamic>>.from(data ?? []);
  }

  Future<void> addWorkLife(Map<String, dynamic> workLife) async {
    final workLifeData = {
      'workplaceName': workLife['workplaceName'],
      'position': workLife['position'],
      'experienceType': workLife['experienceType'],
      'sector': workLife['sector'],
      'workplaceLocation': workLife['workplaceLocation'],
      'worklifeStart': workLife['worklifeStart'],
      'worklifeEnd': workLife['worklifeEnd'],
      'jobDescription': workLife['jobDescription'],
      'workStatu': workLife['workStatu'],
    };
    await _addToCollection('workLife', workLifeData);
  }

  Future<void> removeWorkLife(Map<String, dynamic> workLife) async {
    await _removeFromCollection('workLife', workLife);
  }

  Future<List<Map<String, dynamic>>> loadEducationLife() async {
    final data = await _getCollectionData('educationLife');
    return List<Map<String, dynamic>>.from(data ?? []);
  }

  Future<void> addEducationLife(Map<String, dynamic> educationLife) async {
    final educationLifeData = {
      'educationStatu': educationLife['educationStatu'],
      'univercity': educationLife['univercity'],
      'graduatedDepartment': educationLife['graduatedDepartment'],
      'startUnivercityDate': educationLife['startUnivercityDate'],
      'graduateUnivercityDate': educationLife['graduateUnivercityDate'],
      'continueUnivercity': educationLife['continueUnivercity'],
    };
    await _addToCollection('educationLife', educationLifeData);
  }

  Future<void> removeEducationLife(Map<String, dynamic> educationLife) async {
    await _removeFromCollection('educationLife', educationLife);
  }

  Future<List<Map<String, dynamic>>> loadClubCominities() async {
    final data = await _getCollectionData('clubCominities');
    return List<Map<String, dynamic>>.from(data ?? []);
  }

  Future<void> addClubCominities(Map<String, dynamic> clubCominities) async {
    final clubCominitiesData = {
      'communityName': clubCominities['communityName'],
      'communityTitle': clubCominities['communityTitle'],
    };
    debugPrint(clubCominitiesData.toString());
    await _addToCollection('clubCominities', clubCominitiesData);
  }

  Future<void> removeClubCominities(Map<String, dynamic> clubCominities) async {
    await _removeFromCollection('clubCominities', clubCominities);
  }

  Future<List<Map<String, dynamic>>> loadProjectsPrize() async {
    final data = await _getCollectionData('projectsPrize');
    return List<Map<String, dynamic>>.from(data ?? []);
  }

  Future<void> addProjectsPrize(Map<String, dynamic> projectsPrize) async {
    final projectsPrizeData = {
      'projectAwardName': projectsPrize['projectAwardName'],
      'certificatesDate': projectsPrize['certificatesDate'],
    };
    await _addToCollection('projectsPrize', projectsPrizeData);
  }

  Future<void> removeProjectsPrize(Map<String, dynamic> projectsPrize) async {
    await _removeFromCollection('projectsPrize', projectsPrize);
  }

  Future<List<Map<String, dynamic>>> loadSocialMedia() async {
    final data = await _getCollectionData('socialMedia');
    return List<Map<String, dynamic>>.from(data ?? []);
  }

  Future<void> addSocialMedia(Map<String, dynamic> socialMedia) async {
    final socialMediaData = {
      'socialMediaName': socialMedia['socialMediaName'],
      'socialMediaLink': socialMedia['socialMediaLink'],
    };
    await _addToCollection('socialMedia', socialMediaData);
  }

  Future<void> removeSocialMedia(Map<String, dynamic> socialMedia) async {
    await _removeFromCollection('socialMedia', socialMedia);
  }

  Future<List<Map<String, dynamic>>> loadLanguages() async {
    final data = await _getCollectionData('languages');
    return List<Map<String, dynamic>>.from(data ?? []);
  }

  Future<void> addLanguages(Map<String, dynamic> languages) async {
    final languagesData = {
      'languageName': languages['languageName'],
      'languageLevel': languages['languageLevel'],
    };
    await _addToCollection('languages', languagesData);
  }

  Future<void> removeLanguages(Map<String, dynamic> languages) async {
    await _removeFromCollection('languages', languages);
  }

  Future<List<Map<String, dynamic>>> loadCertificate() async {
    final data = await _getCollectionData('certificate');
    return List<Map<String, dynamic>>.from(data ?? []);
  }

  Future<void> addCertificate(Map<String, dynamic> certificate) async {
    final certificateData = {
      'certificatesName': certificate['certificatesName'],
      'certificateDate': certificate['certificateDate'],
    };
    debugPrint(certificateData.toString());
    await _addToCollection('certificate', certificateData);
  }

  Future<void> removeCertificate(Map<String, dynamic> certificate) async {
    await _removeFromCollection('certificate', certificate);
  }

  Future<String> getPhoto() async {
    final DocumentSnapshot userDoc = await db.collection('users').doc(userId).get();
    final data = userDoc.data() as Map<String, dynamic>?;
    if (userDoc.exists && data != null && data.containsKey('avatarUrl')) {
      return data['avatarUrl'] ?? '';
    }
    return ''; // No profile photo
  }

  Future<String> updateProfilePhoto(File image) async {
    final ref = storage.ref().child('avatars').child('$userId.jpg');
    final uploadTask = ref.putFile(image);
    final snapshot = await uploadTask.whenComplete(() => null);
    final imageUrl = await snapshot.ref.getDownloadURL();
    await db.collection('users').doc(userId).update({'avatarUrl': imageUrl});
    return imageUrl;
  }

  Future<void> updateProfileEdit() async {
    await db.collection('users').doc(userId).update({
      'firstName': firstNameController.text,
      'lastName': lastNameController.text,
      'email': emailController.text,
      'identification': identificationController.text,
      'github': githubController.text,
      'country': countryController.text,
      'city': cityController.text,
      'district': districtController.text,
      'street': streetController.text,
      'aboutMe': aboutMeController.text,
      'phoneNumber': phoneNumberController.text,
      'birthday': birthDateController.text,
      'gender': genderController.text,
      'militaryStatu': militaryStatuController.text,
      'disabledStatu': disabledStatuController.text,
    });
  }

  Future<UserModel?> getData() async {
    final DocumentSnapshot userDoc = await db.collection('users').doc(userId).get();
    if (userDoc.exists) {
      final data = userDoc.data() as Map<String, dynamic>;
      firstNameController.text = data['firstName'] ?? '';
      lastNameController.text = data['lastName'] ?? '';
      emailController.text = data['email'] ?? '';
      identificationController.text = data['identification'] ?? '';
      githubController.text = data['github'] ?? '';
      countryController.text = data['country'] ?? '';
      cityController.text = data['city'] ?? '';
      districtController.text = data['district'] ?? '';
      streetController.text = data['street'] ?? '';
      aboutMeController.text = data['aboutMe'] ?? '';
      phoneNumberController.text = data['phoneNumber'] ?? '';
      birthDateController.text = data['birthday'] ?? '';
      genderController.text = data['gender'] ?? '';
      militaryStatuController.text = data['militaryStatu'] ?? '';
      disabledStatuController.text = data['disabledStatu'] ?? '';
    }
    return null;
  }

  Future<void> requestNotificationPermissions() async {
    final permission = await fcm.requestPermission();
    if (permission.authorizationStatus == AuthorizationStatus.authorized) {
      final userId = FirebaseAuth.instance.currentUser!.uid;
      final token = await fcm.getToken();
      // await fcm.subscribeToTopic('mobil1A');
      fcm.onTokenRefresh.listen((token) {});
      await db.collection('users').doc(userId).update({'token': token});
    }
  }
}
