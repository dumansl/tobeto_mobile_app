import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tobeto_mobile_app/model/user_model.dart';
import 'package:tobeto_mobile_app/screens/profile_editting/screen/personal_information.dart';

class UserRepository {
  final String userId;
  FirebaseFirestore db = FirebaseFirestore.instance;

  UserRepository() : userId = FirebaseAuth.instance.currentUser!.uid;

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

  Future<List<Map<String, dynamic>>> getEducationLife() async {
    final data = await _getCollectionData('educationLife');
    return List<Map<String, dynamic>>.from(data ?? []);
  }

  Future<void> addEducationLife(Map<String, dynamic> educationLife) async {
    await _addToCollection('educationLife', educationLife);
  }

  Future<void> removeEducationLife(Map<String, dynamic> educationLife) async {
    await _removeFromCollection('educationLife', educationLife);
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
      firstNameController.text = userDoc['firstName'] ?? '';
      lastNameController.text = userDoc['lastName'] ?? '';
      emailController.text = userDoc['email'] ?? '';
      identificationController.text = userDoc['identification'] ?? '';
      githubController.text = userDoc['github'] ?? '';
      countryController.text = userDoc['country'] ?? '';
      cityController.text = userDoc['city'] ?? '';
      districtController.text = userDoc['district'] ?? '';
      streetController.text = userDoc['street'] ?? '';
      aboutMeController.text = userDoc['aboutMe'] ?? '';
      phoneNumberController.text = userDoc['phoneNumber'] ?? '';
      birthDateController.text = userDoc['birthday'] ?? '';
      genderController.text = userDoc['gender'] ?? '';
      militaryStatuController.text = userDoc['militaryStatu'] ?? '';
      disabledStatuController.text = userDoc['disabledStatu'] ?? '';
    }
    return null;
  }
}
