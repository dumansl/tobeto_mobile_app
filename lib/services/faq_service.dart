// faq_service.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tobeto_mobile_app/model/faq_model.dart';

class FAQService {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<Map<String, FAQCategory>> fetchFAQs() async {
    Map<String, FAQCategory> faqs = {};
    DocumentSnapshot snapshot =
        await firestore.doc('/f.a.q./CCuDFWl0u0PklJPObNzT/').get();

    if (snapshot.exists) {
      Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;

      faqs['education'] = FAQCategory.fromMap(data['education']);
      faqs['support'] = FAQCategory.fromMap(data['support']);
      faqs['tobeto'] = FAQCategory.fromMap(data['tobeto']);
    }
    debugPrint(faqs.toString());
    return faqs;
  }
}
