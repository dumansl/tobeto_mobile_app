import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tobeto_mobile_app/model/survey_model.dart';
import 'package:tobeto_mobile_app/services/firebase_service.provider.dart';
import 'package:tobeto_mobile_app/services/handler_errors.dart';

class SurveyService {
  FirebaseFirestore get firestore => FirebaseServiceProvider().firestore;

  Future<List<SurveyModel>> getSurveys() async {
    return handleErrors(
      operation: () async {
        QuerySnapshot snapshot = await firestore.collection('survey').get();
        return snapshot.docs
            .map((doc) =>
                SurveyModel.fromMap(doc.data() as Map<String, dynamic>))
            .toList();
      },
      onError: (e) {
        throw Exception('Error getting surveys: $e');
      },
    );
  }

  Future<List<SurveyModel>> getSurveyDetails(String surveyId) async {
    return handleErrors(
      operation: () async {
        DocumentSnapshot snapshot =
            await firestore.collection('survey').doc(surveyId).get();
        Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
        List<dynamic> questionsData = data['questions'] as List<dynamic>;
        return questionsData
            .map((questionData) =>
                SurveyModel.fromMap(questionData as Map<String, dynamic>))
            .toList();
      },
      onError: (e) {
        throw Exception('Error getting survey details: $e');
      },
    );
  }

  Future<void> saveAnswers(
      String userId, String surveyId, List<String> responses) async {
    return handleErrors(
      operation: () async {
        await firestore
            .collection('users')
            .doc(userId)
            .collection('my_surveys')
            .doc(surveyId)
            .set({'responses': responses});
      },
      onError: (e) {
        throw Exception('Error saving answers: $e');
      },
    );
  }
}
