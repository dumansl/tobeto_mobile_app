import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tobeto_mobile_app/model/survey_model.dart';

class SurveyService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<SurveyModel>> getSurveys() async {
    try {
      QuerySnapshot snapshot = await _firestore.collection('survey').get();
      return snapshot.docs.map((doc) {
        return SurveyModel.fromMap(doc.data() as Map<String, dynamic>);
      }).toList();
    } catch (e) {
      throw Exception('Error getting surveys: $e');
    }
  }

  Future<List<SurveyModel>> getSurveyDetails(String surveyId) async {
    try {
      DocumentSnapshot snapshot = await _firestore.collection('survey').doc(surveyId).get();
      Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
      List<dynamic> questionsData = data['questions'] as List<dynamic>;
      return questionsData.map((question) {
        return SurveyModel.fromMap(question as Map<String, dynamic>);
      }).toList();
    } catch (e) {
      throw Exception('Error getting survey details: $e');
    }
  }

  Future<void> saveAnswers(String userId, String surveyId, List<String> responses) async {
    try {
      await _firestore
          .collection('users')
          .doc(userId)
          .collection('my_surveys')
          .doc(surveyId)
          .set({'responses': responses});
    } catch (e) {
      throw Exception('Error saving answers: $e');
    }
  }
}
