import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

  Future<List<EducationModel>> getUserEducation() async {
    User? user = _auth.currentUser;
    if (user != null) {
      QuerySnapshot educationDoc = await _firestore
          .collection('users')
          .doc(user.uid)
          .collection('my_education_life')
          .get();
      return educationDoc.docs
          .map((doc) =>
              EducationModel.fromMap(doc.data() as Map<String, dynamic>))
          .toList();
    }
    return [];
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
      DocumentSnapshot mediaAccountsDoc = await _firestore
          .collection('users')
          .doc(user.uid)
          .collection('my_media_accounts')
          .doc('accounts')
          .get();
      if (mediaAccountsDoc.exists) {
        return MediaAccountModel.fromMap(
            mediaAccountsDoc.data() as Map<String, dynamic>);
      }
    }
    return null;
  }

  Future<List<ForeignLanguageModel>> getUserForeignLanguages() async {
    User? user = _auth.currentUser;
    if (user != null) {
      QuerySnapshot foreignLanguageDoc = await _firestore
          .collection('users')
          .doc(user.uid)
          .collection('my_foreign_languages')
          .get();
      return foreignLanguageDoc.docs
          .map((doc) =>
              ForeignLanguageModel.fromMap(doc.data() as Map<String, dynamic>))
          .toList();
    }
    return [];
  }

  Future<void> updateUserData(UserModel userModel) async {
    User? user = _auth.currentUser;
    if (user != null) {
      await _firestore
          .collection('users')
          .doc(user.uid)
          .update(userModel.toMap());
    }
  }

  // Deneyimler
  Future<void> addUserExperience(ExperienceModel experience) async {
    User? user = _auth.currentUser;
    if (user != null) {
      await _firestore
          .collection('users')
          .doc(user.uid)
          .collection('my_experiences')
          .add(experience.toMap());
    }
  }

  Future<void> updateUserExperience(
      String experienceId, ExperienceModel experience) async {
    User? user = _auth.currentUser;
    if (user != null) {
      await _firestore
          .collection('users')
          .doc(user.uid)
          .collection('my_experiences')
          .doc(experienceId)
          .update(experience.toMap());
    }
  }

  Future<void> deleteUserExperience(String experienceId) async {
    User? user = _auth.currentUser;
    if (user != null) {
      await _firestore
          .collection('users')
          .doc(user.uid)
          .collection('my_experiences')
          .doc(experienceId)
          .delete();
    }
  }

  // Eğitim
  Future<void> addUserEducation(EducationModel education) async {
    User? user = _auth.currentUser;
    if (user != null) {
      await _firestore
          .collection('users')
          .doc(user.uid)
          .collection('my_education_life')
          .add(education.toMap());
    }
  }

  Future<void> updateUserEducation(
      String educationId, EducationModel education) async {
    User? user = _auth.currentUser;
    if (user != null) {
      await _firestore
          .collection('users')
          .doc(user.uid)
          .collection('my_education_life')
          .doc(educationId)
          .update(education.toMap());
    }
  }

  Future<void> deleteUserEducation(String educationId) async {
    User? user = _auth.currentUser;
    if (user != null) {
      await _firestore
          .collection('users')
          .doc(user.uid)
          .collection('my_education_life')
          .doc(educationId)
          .delete();
    }
  }

  // Yetkinlikler
  Future<void> updateUserCompetencies(CompetencyModel competencies) async {
    User? user = _auth.currentUser;
    if (user != null) {
      await _firestore
          .collection('users')
          .doc(user.uid)
          .collection('my_competencies')
          .doc('maturity')
          .update(competencies.toMap());
    }
  }

  // Sertifikalar
  Future<void> addUserCertificate(CertificateModel certificate) async {
    User? user = _auth.currentUser;
    if (user != null) {
      await _firestore
          .collection('users')
          .doc(user.uid)
          .collection('my_certificates')
          .add(certificate.toMap());
    }
  }

  Future<void> updateUserCertificate(
      String certificateId, CertificateModel certificate) async {
    User? user = _auth.currentUser;
    if (user != null) {
      await _firestore
          .collection('users')
          .doc(user.uid)
          .collection('my_certificates')
          .doc(certificateId)
          .update(certificate.toMap());
    }
  }

  Future<void> deleteUserCertificate(String certificateId) async {
    User? user = _auth.currentUser;
    if (user != null) {
      await _firestore
          .collection('users')
          .doc(user.uid)
          .collection('my_certificates')
          .doc(certificateId)
          .delete();
    }
  }

  // Topluluklar
  Future<void> addUserCommunity(CommunityModel community) async {
    User? user = _auth.currentUser;
    if (user != null) {
      await _firestore
          .collection('users')
          .doc(user.uid)
          .collection('member_communities')
          .add(community.toMap());
    }
  }

  Future<void> updateUserCommunity(
      String communityId, CommunityModel community) async {
    User? user = _auth.currentUser;
    if (user != null) {
      await _firestore
          .collection('users')
          .doc(user.uid)
          .collection('member_communities')
          .doc(communityId)
          .update(community.toMap());
    }
  }

  Future<void> deleteUserCommunity(String communityId) async {
    User? user = _auth.currentUser;
    if (user != null) {
      await _firestore
          .collection('users')
          .doc(user.uid)
          .collection('member_communities')
          .doc(communityId)
          .delete();
    }
  }

  // Projeler ve Ödüller
  Future<void> addUserProjectOrAward(ProjectOrAwardModel projectOrAward) async {
    User? user = _auth.currentUser;
    if (user != null) {
      await _firestore
          .collection('users')
          .doc(user.uid)
          .collection('projects_and_awards')
          .add(projectOrAward.toMap());
    }
  }

  Future<void> updateUserProjectOrAward(
      String projectOrAwardId, ProjectOrAwardModel projectOrAward) async {
    User? user = _auth.currentUser;
    if (user != null) {
      await _firestore
          .collection('users')
          .doc(user.uid)
          .collection('projects_and_awards')
          .doc(projectOrAwardId)
          .update(projectOrAward.toMap());
    }
  }

  Future<void> deleteUserProjectOrAward(String projectOrAwardId) async {
    User? user = _auth.currentUser;
    if (user != null) {
      await _firestore
          .collection('users')
          .doc(user.uid)
          .collection('projects_and_awards')
          .doc(projectOrAwardId)
          .delete();
    }
  }

  // Sosyal Medya Hesapları
  Future<void> updateUserMediaAccounts(MediaAccountModel mediaAccounts) async {
    User? user = _auth.currentUser;
    if (user != null) {
      await _firestore
          .collection('users')
          .doc(user.uid)
          .collection('my_media_accounts')
          .doc('accounts')
          .update(mediaAccounts.toMap());
    }
  }

  // Yabancı Diller
  Future<void> addUserForeignLanguage(
      ForeignLanguageModel foreignLanguage) async {
    User? user = _auth.currentUser;
    if (user != null) {
      await _firestore
          .collection('users')
          .doc(user.uid)
          .collection('my_foreign_languages')
          .add(foreignLanguage.toMap());
    }
  }

  Future<void> updateUserForeignLanguage(
      String foreignLanguageId, ForeignLanguageModel foreignLanguage) async {
    User? user = _auth.currentUser;
    if (user != null) {
      await _firestore
          .collection('users')
          .doc(user.uid)
          .collection('my_foreign_languages')
          .doc(foreignLanguageId)
          .update(foreignLanguage.toMap());
    }
  }

  Future<void> deleteUserForeignLanguage(String foreignLanguageId) async {
    User? user = _auth.currentUser;
    if (user != null) {
      await _firestore
          .collection('users')
          .doc(user.uid)
          .collection('my_foreign_languages')
          .doc(foreignLanguageId)
          .delete();
    }
  }
}
