import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Lesson {
  final String title;
  final DateTime date;
  final String instructor;
  final String time;
  final Color color;

  Lesson({
    required this.title,
    required this.date,
    required this.instructor,
    required this.time,
    required this.color,
  });

  factory Lesson.fromJson(Map<String, dynamic> json) {
    return Lesson(
      title: json['title'],
      date: (json['date'] as Timestamp).toDate(),
      instructor: json['instructor'],
      time: json['time'],
      color: Colors.blue, // Renk sabit olarak belirlendi
    );
  }
}
