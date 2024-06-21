import 'package:equatable/equatable.dart';

class Course extends Equatable {
  final String title;
  final String image;
  final String status;
  final int duration;
  final int points;
  final String language;
  final String content;

  const Course({
    required this.title,
    required this.image,
    required this.status,
    required this.duration,
    required this.points,
    required this.language,
    required this.content,
  });

  @override
  List<Object?> get props => [title, image];

  static fromFirestore(Map<String, dynamic> data) {}
}
