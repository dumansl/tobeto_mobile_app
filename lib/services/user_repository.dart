import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tobeto_mobile_app/screens/profile_editting/screen/personal_information.dart';

class UserRepository {
  final userId = FirebaseAuth.instance.currentUser!.uid;
  FirebaseFirestore db = FirebaseFirestore.instance;

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
      'aboutMe': aboutMeController.text,
      'phoneNumber': phoneNumberController.text,
      'birthDate': birthDateController.text,
      'gender': genderController.text,
      'militaryStatu': militaryStatuController.text,
      'disabledStatu': disabledStatuController.text,
    });
  }

  Future<void> getData() async {
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
      birthDateController.text = userDoc['birthDate'] ?? '';
      genderController.text = userDoc['gender'] ?? '';
      militaryStatuController.text = userDoc['militaryStatu'] ?? '';
      disabledStatuController.text = userDoc['disabledStatu'] ?? '';
    }
  }
}
