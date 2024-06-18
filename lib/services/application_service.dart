import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tobeto_mobile_app/model/application_model.dart';

class ApplicationService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<Application> getApplication(String userId, String applicationId) async {
    try {
      DocumentSnapshot<Map<String, dynamic>> snapshot =
          await _firestore.collection('users').doc(userId).collection('my_appeal').doc(applicationId).get();

      if (snapshot.exists) {
        return Application(
          title: snapshot.data()?['name'] ?? '',
          description: snapshot.data()?['information'] ?? '',
          status: snapshot.data()?['status'] ?? '',
        );
      } else {
        throw Exception('Application not found');
      }
    } catch (e) {
      throw Exception('Failed to load application: $e');
    }
  }

  Future<String> getApplicationId(String userId) async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await _firestore.collection('users').doc(userId).collection('my_appeal').limit(1).get();

      if (querySnapshot.docs.isNotEmpty) {
        return querySnapshot.docs.first.id;
      } else {
        throw Exception('No applications found');
      }
    } catch (e) {
      throw Exception('Failed to get application ID: $e');
    }
  }
}
