import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tobeto_mobile_app/model/press_model.dart';

class PressService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<List<PressModel>> getPress() async {
    QuerySnapshot snapshot = await _db.collection('weInThePress').get();
    List<PressModel> pressList =
        snapshot.docs.map((doc) => PressModel.fromFirestore(doc)).toList();
    return pressList;
  }
}
