import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tobeto_mobile_app/model/job_model.dart';
import 'package:tobeto_mobile_app/services/firebase_service.provider.dart';
import 'package:tobeto_mobile_app/services/handler_errors.dart';

class JobService {
  FirebaseFirestore get firestore => FirebaseServiceProvider().firestore;

  Future<List<Job>> getJobs(String userId) async {
    return handleErrors(
      operation: () async {
        final snapshot = await firestore
            .collection('users')
            .doc(userId)
            .collection('my_job')
            .get();
        return snapshot.docs
            .map((doc) => Job.fromFirestore(doc.data(), doc.id))
            .toList();
      },
      onError: (e) {
        throw Exception('Error fetching jobs: $e');
      },
    );
  }
}
