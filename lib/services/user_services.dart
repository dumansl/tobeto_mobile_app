import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tobeto_mobile_app/model/foreignLanguageModel.dart';
import 'package:tobeto_mobile_app/model/certificate_model.dart';
import 'package:tobeto_mobile_app/model/community_model.dart';
import 'package:tobeto_mobile_app/model/competency_model.dart';
import 'package:tobeto_mobile_app/model/education_model.dart';
import 'package:tobeto_mobile_app/model/experince_model.dart';
import 'package:tobeto_mobile_app/model/mediaaccount.dart';
import 'package:tobeto_mobile_app/model/projectorawards.dart';
import 'package:tobeto_mobile_app/model/user_model.dart';

class UserServices {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserModel?> getUserData() async {
    User? user = _auth.currentUser;
    if (user != null) {
      DocumentSnapshot userDoc =
          await _firestore.collection('users').doc(user.uid).get();
      if (userDoc.exists) {
        return UserModel.fromMap(userDoc.data() as Map<String, dynamic>);
      }
    }
    return null;
  }

  Future<List<ExperienceModel>> getUserExperiences() async {
    User? user = _auth.currentUser;
    if (user != null) {
      QuerySnapshot experienceDocs = await _firestore
          .collection('users')
          .doc(user.uid)
          .collection('my_experiences')
          .get();
      return experienceDocs.docs
          .map((doc) =>
              ExperienceModel.fromMap(doc.data() as Map<String, dynamic>))
          .toList();
    }
    return [];
  }

  Future<EducationModel?> getUserEducation() async {
    User? user = _auth.currentUser;
    if (user != null) {
      DocumentSnapshot educationDoc = await _firestore
          .collection('users')
          .doc(user.uid)
          .collection('my_education_life')
          .doc('arSKTbxqVWNGTiXWvUyx')
          .get();
      if (educationDoc.exists) {
        return EducationModel.fromMap(
            educationDoc.data() as Map<String, dynamic>);
      }
    }
    return null;
  }

  Future<CompetencyModel?> getUserCompetencies() async {
    User? user = _auth.currentUser;
    if (user != null) {
      DocumentSnapshot competencyDoc = await _firestore
          .collection('users')
          .doc(user.uid)
          .collection('my_competencies')
          .doc('maturity')
          .get();
      if (competencyDoc.exists) {
        return CompetencyModel.fromMap(
            competencyDoc.data() as Map<String, dynamic>);
      }
    }
    return null;
  }

  Future<List<CertificateModel>> getUserCertificates() async {
    User? user = _auth.currentUser;
    if (user != null) {
      QuerySnapshot certificateDocs = await _firestore
          .collection('users')
          .doc(user.uid)
          .collection('my_certificates')
          .get();
      return certificateDocs.docs
          .map((doc) =>
              CertificateModel.fromMap(doc.data() as Map<String, dynamic>))
          .toList();
    }
    return [];
  }

  Future<List<CommunityModel>> getUserCommunities() async {
    User? user = _auth.currentUser;
    if (user != null) {
      QuerySnapshot communityDocs = await _firestore
          .collection('users')
          .doc(user.uid)
          .collection('member_communities')
          .get();
      return communityDocs.docs
          .map((doc) =>
              CommunityModel.fromMap(doc.data() as Map<String, dynamic>))
          .toList();
    }
    return [];
  }

  Future<List<ProjectOrAwardModel>> getUserProjectsAndAwards() async {
    User? user = _auth.currentUser;
    if (user != null) {
      QuerySnapshot projectOrAwardDocs = await _firestore
          .collection('users')
          .doc(user.uid)
          .collection('projects_and_awards')
          .get();
      return projectOrAwardDocs.docs
          .map((doc) =>
              ProjectOrAwardModel.fromMap(doc.data() as Map<String, dynamic>))
          .toList();
    }
    return [];
  }

  Future<MediaAccountModel?> getUserMediaAccounts() async {
    User? user = _auth.currentUser;
    if (user != null) {
      DocumentSnapshot mediaAccountDoc = await _firestore
          .collection('users')
          .doc(user.uid)
          .collection('my_media_accounts')
          .doc('accounts')
          .get();
      if (mediaAccountDoc.exists) {
        return MediaAccountModel.fromMap(
            mediaAccountDoc.data() as Map<String, dynamic>);
      }
    }
    return null;
  }

  Future<ForeignLanguageModel?> getUserForeignLanguages() async {
    User? user = _auth.currentUser;
    if (user != null) {
      DocumentSnapshot foreignLanguageDoc = await _firestore
          .collection('users')
          .doc(user.uid)
          .collection('my_foreign_languages')
          .doc('jVxEw3OOiVOEH5NBDokM')
          .get();
      if (foreignLanguageDoc.exists) {
        return ForeignLanguageModel.fromMap(
            foreignLanguageDoc.data() as Map<String, dynamic>);
      }
    }
    return null;
  }
}
