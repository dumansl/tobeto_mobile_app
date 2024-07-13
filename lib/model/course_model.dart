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
  final bool isCompleted;
  final String educationId;
  final String asyncEducationId;
  final bool isLiked;
  final bool isBookmarked;

  const Course({
    required this.id,
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
    required this.isWatched,
    required this.isCompleted,
    required this.educationId,
    required this.asyncEducationId,
    this.isLiked = false,
    this.isBookmarked = false,
  });

  @override
  List<Object?> get props => [
        id,
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
        isWatched,
        isCompleted,
        educationId,
        asyncEducationId,
        isLiked,
        isBookmarked,
      ];

  factory Course.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    return Course(
      id: doc.id,
      title: data['title'] ?? '',
      imageUrl: data['imageUrl'] ?? '',
      status: data['status'] ?? '',
      duration: data['duration'] ?? 0,
      points: data['points'] ?? 0,
      language: data['language'] ?? '',
      category: data['category'] ?? '',
      type: data['type'] ?? '',
      content: data['content'] ?? '',
      videoUrl: data['videoUrl'] ?? '',
      videoName: data['videoName'] ?? '',
      videoDuration: data['videoDuration'] ?? 0,
      videoPoints: data['videoPoints'] ?? 0,
      videoLanguage: data['videoLanguage'] ?? '',
      educationContent: data['educationContent'] ?? '',
      producer: data['producer'] ?? '',
      videoNumber: data['videoNumber'] ?? 0,
      startTime: (data['startTime'] != null) ? (data['startTime'] as Timestamp).toDate() : DateTime.now(),
      endTime: (data['endTime'] != null) ? (data['endTime'] as Timestamp).toDate() : DateTime.now(),
      playlist: List<String>.from(data['playlist'] ?? []),
      videoCategory: data['videoCategory'] ?? '',
      subType: data['subType'] ?? '',
      isWatched: data['isWatched'] ?? false,
      isCompleted: data['isCompleted'] ?? false,
      educationId: data['educationId'] ?? '',
      asyncEducationId: data['asyncEducationId'] ?? '',
      isLiked: data['isLiked'] ?? false,
      isBookmarked: data['isBookmarked'] ?? false,
    );
  }

  Course copyWith({
    String? id,
    String? title,
    String? imageUrl,
    String? status,
    int? duration,
    int? points,
    String? language,
    String? category,
    String? type,
    String? content,
    String? videoUrl,
    String? videoName,
    int? videoDuration,
    int? videoPoints,
    String? videoLanguage,
    String? educationContent,
    String? producer,
    int? videoNumber,
    DateTime? startTime,
    DateTime? endTime,
    List<String>? playlist,
    String? videoCategory,
    String? subType,
    bool? isWatched,
    bool? isCompleted,
    String? educationId,
    String? asyncEducationId,
    bool? isLiked,
    bool? isBookmarked,
  }) {
    return Course(
      id: id ?? this.id,
      title: title ?? this.title,
      imageUrl: imageUrl ?? this.imageUrl,
      status: status ?? this.status,
      duration: duration ?? this.duration,
      points: points ?? this.points,
      language: language ?? this.language,
      category: category ?? this.category,
      type: type ?? this.type,
      content: content ?? this.content,
      videoUrl: videoUrl ?? this.videoUrl,
      videoName: videoName ?? this.videoName,
      videoDuration: videoDuration ?? this.videoDuration,
      videoPoints: videoPoints ?? this.videoPoints,
      videoLanguage: videoLanguage ?? this.videoLanguage,
      educationContent: educationContent ?? this.educationContent,
      producer: producer ?? this.producer,
      videoNumber: videoNumber ?? this.videoNumber,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      playlist: playlist ?? this.playlist,
      videoCategory: videoCategory ?? this.videoCategory,
      subType: subType ?? this.subType,
      isWatched: isWatched ?? this.isWatched,
      isCompleted: isCompleted ?? this.isCompleted,
      educationId: educationId ?? this.educationId,
      asyncEducationId: asyncEducationId ?? this.asyncEducationId,
      isLiked: isLiked ?? this.isLiked,
      isBookmarked: isBookmarked ?? this.isBookmarked,
    );
  }
}
