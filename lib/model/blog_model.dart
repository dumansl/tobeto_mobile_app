import 'package:cloud_firestore/cloud_firestore.dart';

class Blog {
  final String id;
  final String title;
  final DateTime date;
  final String image;
  final String content;
  final String subImage;

  Blog({
    required this.id,
    required this.title,
    required this.date,
    required this.image,
    required this.content,
    required this.subImage,
  });

  factory Blog.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Blog(
      id: data['id'],
      title: data['title'],
      date: (data['date'] as Timestamp).toDate(), // Timestamp'i DateTime'e dönüştür
      image: data['image'],
      content: data['content'],
      subImage: data['subImage'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'id': id,
      'title': title,
      'date': Timestamp.fromDate(date), // DateTime'den Timestamp'e dönüştür
      'image': image,
      'content': content,
    };
  }
}
