import 'package:cloud_firestore/cloud_firestore.dart';

class Announcement {
  final String title;
  final String description;
  final DateTime date;
  final bool isRead;

  Announcement({
    required this.title,
    required this.description,
    required this.date,
    required this.isRead,
  });

  Announcement copyWith({
    String? title,
    String? description,
    DateTime? date,
    bool? isRead,
  }) {
    return Announcement(
      title: title ?? this.title,
      description: description ?? this.description,
      date: date ?? this.date,
      isRead: isRead ?? this.isRead,
    );
  }
}
