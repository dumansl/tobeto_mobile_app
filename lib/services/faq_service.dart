import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tobeto_mobile_app/model/faq_model.dart';
import 'package:tobeto_mobile_app/services/firebase_service.provider.dart';
import 'package:tobeto_mobile_app/services/handler_errors.dart';

class FAQService {
  FirebaseFirestore get firestore => FirebaseServiceProvider().firestore;

  Future<Map<String, FAQCategory>> fetchFAQs() async {
    return handleErrors(
      operation: () async {
        Map<String, FAQCategory> faqs = {};
        DocumentSnapshot<Map<String, dynamic>> snapshot =
            await firestore.doc('/f.a.q./CCuDFWl0u0PklJPObNzT/').get();

        if (snapshot.exists) {
          Map<String, dynamic> data = snapshot.data()!;
          faqs['education'] = FAQCategory.fromMap(data['education']);
          faqs['support'] = FAQCategory.fromMap(data['support']);
          faqs['tobeto'] = FAQCategory.fromMap(data['tobeto']);
        }
        debugPrint('Fetched FAQs: $faqs');
        return faqs;
      },
      onError: (e) {
        debugPrint('Error fetching FAQs: $e');
        throw Exception('Error fetching FAQs: $e');
      },
    );
  }
}
