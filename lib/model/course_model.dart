import 'package:equatable/equatable.dart';

class Course extends Equatable {
  final String title;
  final String image;
  final String status;

  const Course({required this.title, required this.image, required this.status});

  @override
  List<Object?> get props => [title, image];
}
