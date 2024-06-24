class Lesson {
  final String id;
  final String title;
  final String instructor;
  final DateTime date;
  final String startTime;
  final String endTime;
  final String? color;

  Lesson({
    required this.id,
    required this.title,
    required this.instructor,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.color,
  });

  factory Lesson.fromMap(Map<String, dynamic> data, String documentId) {
    return Lesson(
      id: documentId,
      title: data['title'] ?? '',
      instructor: data['instructor'] ?? '',
      date: DateTime.parse(data['date']),
      startTime: data['start_time'] ?? '',
      endTime: data['end_time'] ?? '',
      color: data['color'] ?? '',
    );
  }
}
