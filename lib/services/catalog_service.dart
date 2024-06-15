import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tobeto_mobile_app/model/catalog_model.dart';

class CatalogService {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<CatalogModel?> fetchCourses() async {
    DocumentReference snapshot = await firestore
        .collection('educations')
        .doc('HRp6G8T2HcpZMjQMApaA')
        .collection('general_educations')
        .doc('btzSuMhwZHAPNJZ8zcUQ');

    DocumentSnapshot documentSnapshot = await snapshot.get();

    if (documentSnapshot.exists) {}
  }
}
