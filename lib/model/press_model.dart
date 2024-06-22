import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class PressModel {
  final String id;
  final int date;
  final String description;
  final List<String> imageUrls;
  final String title;

  PressModel({
    required this.id,
    required this.date,
    required this.description,
    required this.imageUrls,
    required this.title,
  });

  factory PressModel.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;
    return PressModel(
      id: doc.id,
      date: data['date'] ?? 0,
      description: data['description'] ?? '',
      imageUrls: List<String>.from(data['imageUrl'] ?? []),
      title: data['title'] ?? '',
    );
  }

  String getFormattedDate(BuildContext context) {
    initializeDateFormatting('tr_TR', null);
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(date * 1000);
    String formattedDate = DateFormat.yMMMMd('tr_TR').format(dateTime);
    return formattedDate;
  }
}
