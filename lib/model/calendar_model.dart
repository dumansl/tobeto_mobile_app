import 'package:cloud_firestore/cloud_firestore.dart';

class Lesson {
  final String title;
  final String instructor;
  final String time;
  final DateTime date;
  final int color;

  Lesson({
    required this.title,
    required this.instructor,
    required this.time,
    required this.date,
    required this.color,
  });

  factory Lesson.fromJson(Map<String, dynamic> json) {
    return Lesson(
      title: json['title'],
      instructor: json['instructor'],
      time: json['time'],
      date: (json['date'] as Timestamp).toDate(),
      color: int.parse(json['color'].replaceFirst('0x', ''), radix: 16),
    );
  }
}
