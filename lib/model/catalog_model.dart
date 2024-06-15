import 'package:cloud_firestore/cloud_firestore.dart';

class CatalogModel {
  final String educationName;
  final String language;
  final String educationDuration;
  final double rating;
  final String teacherName;
  final String imageUrl;
  CatalogModel({
    required this.educationName,
    required this.language,
    required this.educationDuration,
    required this.rating,
    required this.teacherName,
    required this.imageUrl,
  });

  factory CatalogModel.fromFirestore(DocumentSnapshot doc) {
    return CatalogModel(
      educationName: doc['educationName'],
      language: doc['language'],
      educationDuration: doc['educationDuration'],
      rating: doc['rating'],
      teacherName: doc['teacherName'],
      imageUrl: doc['rating'],
    );
  }

  static fromDocument(QueryDocumentSnapshot<Object?> doc) {}
}
