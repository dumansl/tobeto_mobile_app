import 'package:equatable/equatable.dart';

class EducatorAnnouncement extends Equatable {
  final String id;
  final String header;
  final String content;

  const EducatorAnnouncement(
      {required this.id, required this.header, required this.content});

  factory EducatorAnnouncement.fromMap(Map<String, dynamic> data, String id) {
    return EducatorAnnouncement(
      id: id,
      header: data['header'] ?? '',
      content: data['content'] ?? '',
    );
  }

  @override
  List<Object?> get props => [id, header, content];
}
