import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:tobeto_mobile_app/screens/profile_editting/screen/certificate.dart';
import 'package:tobeto_mobile_app/screens/profile_editting/screen/education_life.dart';
import 'package:tobeto_mobile_app/screens/profile_editting/screen/personal_information.dart';
import 'package:tobeto_mobile_app/screens/profile_editting/screen/work_life.dart';

class UserRepository {
  final TextEditingController profileEditCertificatesNameController =
      TextEditingController();
  final TextEditingController certificateDateController =
      TextEditingController();
  final userId = FirebaseAuth.instance.currentUser!.uid;
  FirebaseFirestore db = FirebaseFirestore.instance;

  PlatformFile? pickedfile;

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
      'companyName': workplaceNameController.text,
      'position': positionController.text,
      'experienceType': experienceTypeController.text,
      'sector': sectorController.text,
      'workCity': workplaceLocationController.text,
      'startWork': worklifeStartController.text,
      'endWork': worklifeEndController.text,
      'workDescription': jobDescriptionController.text,
      'educationStatu': educationStatuController.text,
      'univercity': univercityController.text,
      'graduatedDepartment': graduatedDepartmentController.text,
      'startUnivercityDate': startUnivercityDateController.text,
      'graduateUnivercityDate': graduateUnivercityDateController.text,
      'continueUnivercity': checkBoxController.value,
    });
  }

  Future<void> getData() async {
    final DocumentSnapshot userDoc =
        await db.collection('users').doc(userId).get();
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
      workplaceNameController.text = userDoc['companyName'] ?? '';
      positionController.text = userDoc['position'] ?? '';
      experienceTypeController.text = userDoc['experienceType'] ?? '';
      sectorController.text = userDoc['sector'] ?? '';
      workplaceLocationController.text = userDoc['workCity'] ?? '';
      worklifeStartController.text = userDoc['startWork'] ?? '';
      worklifeEndController.text = userDoc['endWork'] ?? '';
      jobDescriptionController.text = userDoc['workDescription'] ?? '';
      educationStatuController.text = userDoc['educationStatu'] ?? '';
      univercityController.text = userDoc['univercity'] ?? '';
      graduatedDepartmentController.text = userDoc['graduatedDepartment'] ?? '';
      startUnivercityDateController.text = userDoc['startUnivercityDate'] ?? '';
      graduateUnivercityDateController.text =
          userDoc['graduateUnivercityDate'] ?? '';
      checkBoxController.value = userDoc['continueUnivercity'] ?? '';
    }
  }

  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;
    pickedfile = result.files.first;
  }

  Future uploadFile(BuildContext context) async {
    if (pickedfile == null) {
      print("No file selected");
      return;
    }

    // Check file extension
  

    final path = 'certificate/$userId/${basename(pickedfile!.name)}';
    final file = File(pickedfile!.path!);
    final ref = FirebaseStorage.instance.ref().child(path);

    // Upload file to Firebase Storage
    await ref.putFile(file);
    String downloadURL = await ref.getDownloadURL();
    print("Dosya $userId'nin kimliği altında Firebase Storage'a yüklendi.");

    // Check if a document with the same file name exists in Firestore
    final QuerySnapshot existingFiles = await db
        .collection('users')
        .doc(userId)
        .collection('certificates')
        .where('fileName', isEqualTo: pickedfile!.name)
        .get();

    if (existingFiles.docs.isNotEmpty) {
      // If the document exists, update it
      await existingFiles.docs.first.reference
          .update({'certificateUrl': downloadURL});
      print("Mevcut belge güncellendi.");
    } else {
      // If the document doesn't exist, create a new document
      await db.collection('users').doc(userId).collection('certificates').add({
        'fileName': pickedfile!.name,
        'certificateUrl': downloadURL,
      });
      print("Yeni belge oluşturuldu.");
    }
  }
}
