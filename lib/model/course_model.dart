import 'package:equatable/equatable.dart';

class Course extends Equatable {
  final String title;
  final String image;

  const Course({required this.title, required this.image});

  @override
  List<Object?> get props => [title, image];
}
