import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tobeto_mobile_app/model/job_model.dart';

class JobService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Job>> getJobs(String userId) async {
    final snapshot = await _firestore.collection('users').doc(userId).collection('my_job').get();
    return snapshot.docs.map((doc) => Job.fromFirestore(doc.data(), doc.id)).toList();
  }
}
