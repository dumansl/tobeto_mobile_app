import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tobeto_mobile_app/model/educator_annocement_model.dart';
import 'package:tobeto_mobile_app/services/firebase_service.provider.dart';
import 'package:tobeto_mobile_app/services/handler_errors.dart';

class EducatorAnnouncementRepository {
  FirebaseFirestore get _firestore => FirebaseServiceProvider().firestore;

  Future<List<EducatorAnnouncement>> fetchAnnouncements() async {
    return handleErrors(
      operation: () async {
        final snapshot =
            await _firestore.collection('/educator-announcements').get();
        List<EducatorAnnouncement> announcements = snapshot.docs
            .map((doc) => EducatorAnnouncement.fromMap(doc.data(), doc.id))
            .toList();
        debugPrint('Fetched ${announcements.length} announcements');
        return announcements;
      },
      onError: (e) {
        debugPrint('Error fetching announcements: $e');
        throw Exception('Error fetching announcements: $e');
      },
    );
  }
}
