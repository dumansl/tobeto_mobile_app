import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tobeto_mobile_app/model/educator_annocement_model.dart';

class EducatorAnnouncementRepository {
  final FirebaseFirestore _firestore;

  EducatorAnnouncementRepository({FirebaseFirestore? firestore})
      : _firestore = firestore ?? FirebaseFirestore.instance;

  Future<List<EducatorAnnouncement>> fetchAnnouncements() async {
    try {
      final snapshot =
          await _firestore.collection('/educator-announcements ').get();
      List<EducatorAnnouncement> announcementEducator = snapshot.docs
          .map((doc) => EducatorAnnouncement.fromMap(doc.data(), doc.id))
          .toList();
      debugPrint(announcementEducator.toString());
      return announcementEducator;
    } catch (e) {
      throw Exception('Error fetching announcements: $e');
    }
  }
}
