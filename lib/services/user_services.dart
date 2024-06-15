import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tobeto_mobile_app/model/user_model.dart';

class UserServices {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserModel?> getUserData() async {
    User? user = _auth.currentUser;
    if (user != null) {
      DocumentSnapshot userDoc = await _firestore.collection('users').doc(user.uid).get();
      if (userDoc.exists) {
        return UserModel.fromMap(userDoc.data() as Map<String, dynamic>);
      }
    }
    return null;
  }

  Future<List<ExperienceModel>> getUserExperiences() async {
    User? user = _auth.currentUser;
    if (user != null) {
      QuerySnapshot experienceDocs =
          await _firestore.collection('users').doc(user.uid).collection('my_experiences').get();
      return experienceDocs.docs.map((doc) => ExperienceModel.fromMap(doc.data() as Map<String, dynamic>)).toList();
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
        return EducationModel.fromMap(educationDoc.data() as Map<String, dynamic>);
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
          .doc('GPI6C4aLsVEbZjTujHZ5')
          .get();
      if (competencyDoc.exists) {
        return CompetencyModel.fromMap(competencyDoc.data() as Map<String, dynamic>);
      }
    }
    return null;
  }

  Future<List<CertificateModel>> getUserCertificates() async {
    User? user = _auth.currentUser;
    if (user != null) {
      QuerySnapshot certificateDocs =
          await _firestore.collection('users').doc(user.uid).collection('my_certificates').get();
      return certificateDocs.docs.map((doc) => CertificateModel.fromMap(doc.data() as Map<String, dynamic>)).toList();
    }
    return [];
  }

  Future<List<CommunityModel>> getUserCommunities() async {
    User? user = _auth.currentUser;
    if (user != null) {
      QuerySnapshot communityDocs =
          await _firestore.collection('users').doc(user.uid).collection('my_communities').get();
      return communityDocs.docs.map((doc) => CommunityModel.fromMap(doc.data() as Map<String, dynamic>)).toList();
    }
    return [];
  }

  Future<List<ProjectOrAwardModel>> getUserProjectsAndAwards() async {
    User? user = _auth.currentUser;
    if (user != null) {
      QuerySnapshot projectOrAwardDocs =
          await _firestore.collection('users').doc(user.uid).collection('my_projects_and_awards').get();
      return projectOrAwardDocs.docs
          .map((doc) => ProjectOrAwardModel.fromMap(doc.data() as Map<String, dynamic>))
          .toList();
    }
    return [];
  }

  Future<MediaAccountModel?> getUserMediaAccounts() async {
    User? user = _auth.currentUser;
    if (user != null) {
      DocumentSnapshot mediaAccountsDoc = await _firestore
          .collection('users')
          .doc(user.uid)
          .collection('social_media_accounts')
          .doc('my_accounts')
          .get();
      if (mediaAccountsDoc.exists) {
        return MediaAccountModel.fromMap(mediaAccountsDoc.data() as Map<String, dynamic>);
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
          .doc('CArFBd5DtTThBC7HXoIj')
          .get();
      if (foreignLanguageDoc.exists) {
        return ForeignLanguageModel.fromMap(foreignLanguageDoc.data() as Map<String, dynamic>);
      }
    }
    return null;
  }
}
