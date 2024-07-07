import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tobeto_mobile_app/model/press_model.dart';
import 'package:tobeto_mobile_app/services/firebase_service.provider.dart';
import 'package:tobeto_mobile_app/services/handler_errors.dart';

class PressService {
  FirebaseFirestore get firestore => FirebaseServiceProvider().firestore;

  Future<List<PressModel>> getPress() async {
    return handleErrors(
      operation: () async {
        QuerySnapshot snapshot =
            await firestore.collection('weInThePress').get();
        return snapshot.docs
            .map((doc) => PressModel.fromFirestore(doc))
            .toList();
      },
      onError: (e) {
        throw Exception('Error fetching press: $e');
      },
    );
  }
}
