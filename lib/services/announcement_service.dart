import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tobeto_mobile_app/model/announcement_model.dart';
import 'package:tobeto_mobile_app/services/handler_errors.dart';
import 'firebase_service.provider.dart';

class AnnouncementService {
  FirebaseFirestore get _firestore => FirebaseServiceProvider().firestore;

  Future<List<Announcement>> getAnnouncements() async {
    return handleErrors(
      operation: () async {
        QuerySnapshot snapshot =
            await _firestore.collection('announcements').get();
        List<Announcement> announcements = snapshot.docs.map((doc) {
          return Announcement(
            title: doc['title'],
            description: doc['subtitle'],
            date: (doc['time'] as Timestamp).toDate(),
            isRead: doc['isRead'],
          );
        }).toList();
        return announcements;
      },
      onError: (e) {
        debugPrint('Error getting announcements: $e');
      },
    );
  }
}
