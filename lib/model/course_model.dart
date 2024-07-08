import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Course extends Equatable {
  final String id;
  final String title;
  final String imageUrl;
  final String status;
  final int duration;
  final int points;
  final String language;
  final String category;
  final String type;
  final String content;
  final String videoUrl;
  final String videoName;
  final int videoDuration;
  final int videoPoints;
  final String videoLanguage;
  final String educationContent;
  final String producer;
  final int videoNumber;
  final DateTime startTime;
  final DateTime endTime;
  final List<String> playlist;
  final String videoCategory;
  final String subType;
  final bool isWatched;

  const Course(
      {required this.id,
      required this.title,
      required this.imageUrl,
      required this.status,
      required this.duration,
      required this.points,
      required this.language,
      required this.category,
      required this.type,
      required this.content,
      required this.videoUrl,
      required this.videoName,
      required this.videoDuration,
      required this.videoPoints,
      required this.videoLanguage,
      required this.educationContent,
      required this.producer,
      required this.videoNumber,
      required this.startTime,
      required this.endTime,
      required this.playlist,
      required this.videoCategory,
      required this.subType,
      required this.isWatched});

  @override
  List<Object?> get props => [
        title,
        imageUrl,
        status,
        duration,
        points,
        language,
        category,
        type,
        content,
        videoUrl,
        videoName,
        videoDuration,
        videoPoints,
        videoLanguage,
        educationContent,
        producer,
        videoNumber,
        startTime,
        endTime,
        playlist,
        videoCategory,
        subType,
        isWatched
      ];

  factory Course.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Course(
      id: doc.id,
      title: data['title'] ?? '',
      imageUrl: data['imageUrl'] ?? '',
      status: data['statu'] ?? '',
      duration: data['duration'] ?? 0,
      points: data['points'] ?? 0,
      language: data['language'] ?? '',
      category: data['category'] ?? '',
      content: data['content'] ?? '',
      videoUrl: data['videoUrl'] ?? '',
      videoName: data['videoName'] ?? '',
      videoDuration: data['videoDuration'] ?? 0,
      videoPoints: data['videoPoints'] ?? 0,
      videoLanguage: data['videoLanguage'] ?? '',
      educationContent: data['educationContent'] ?? '',
      producer: data['producer'] ?? '',
      type: data['type'] ?? '',
      videoNumber: data['video'] ?? 0,
      startTime: (data['startTime'] != null) ? (data['startTime'] as Timestamp).toDate() : DateTime.now(),
      endTime: (data['endTime'] != null) ? (data['endTime'] as Timestamp).toDate() : DateTime.now(),
      playlist: List<String>.from(data['playlist'] ?? []),
      videoCategory: data['videoCategory'] ?? '',
      subType: data['subTyp'] ?? '',
      isWatched: data['isWatched'] ?? false,
    );
  }
}
