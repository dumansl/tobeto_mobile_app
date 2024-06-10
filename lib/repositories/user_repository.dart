import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tobeto_mobile_app/screens/profile_editting/screen/personal_information.dart';

class UserRepository {
  final userId = FirebaseAuth.instance.currentUser!.uid;
  FirebaseFirestore db = FirebaseFirestore.instance;
  late String _uid;

  Future<void> uploadProfileEdit() async {
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
      'aboutMe': aboutMeController.text
    });
  }

  Future<void> getData() async {
    _uid = userId;
    final DocumentSnapshot userDoc = await db.collection('users').doc(_uid).get();
    firstNameController.text = userDoc.get('firstName');
    lastNameController.text = userDoc.get('lastName');
    identificationController.text = userDoc.get('identification');
    emailController.text = userDoc.get('email');
    githubController.text = userDoc.get('github');
    countryController.text = userDoc.get('country');
    cityController.text = userDoc.get('city');
    districtController.text = userDoc.get('district');
    streetController.text = userDoc.get('street');
    aboutMeController.text = userDoc.get('aboutMe');
    // selectedGender = userDoc.get('gender');
    // selectedMilitaryStatus = userDoc.get('militaryStatus');
    // selectedDisabilityStatus = userDoc.get('disabilityStatus');
  }

  void initializeControllers() {
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    identificationController = TextEditingController();
    emailController = TextEditingController();
    githubController = TextEditingController();
    countryController = TextEditingController();
    cityController = TextEditingController();
    districtController = TextEditingController();
    streetController = TextEditingController();
    aboutMeController = TextEditingController();
  }
}
