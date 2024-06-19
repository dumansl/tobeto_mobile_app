import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tobeto_mobile_app/model/announcement_model.dart';

class AnnouncementService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Announcement>> getAnnouncements() async {
    try {
      QuerySnapshot snapshot = await _firestore.collection('announcements').get();
      List<Announcement> announcements = snapshot.docs.map((doc) {
        return Announcement(
          title: doc['title'],
          description: doc['subtitle'],
          date: (doc['time'] as Timestamp).toDate(),
          isRead: doc['isRead'],
        );
      }).toList();
      return announcements;
    } catch (e) {
      debugPrint('Error getting announcements: $e');
      return [];
    }
  }
}
