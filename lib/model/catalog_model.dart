class CatalogCourse {
  final String courseName;
  final String courseTeacher;
  final String imagePath;
  final double rank;
  final String? time;
  final String? language;
  final String? certification;
  final String videoUrl;
  final String? description;

  CatalogCourse({
    required this.courseName,
    required this.courseTeacher,
    required this.imagePath,
    required this.rank,
    this.time,
    this.language,
    this.certification,
    required this.videoUrl,
    this.description,
  });

  factory CatalogCourse.fromMap(Map<String, dynamic> data) {
    return CatalogCourse(
      courseName: data['courseName'] ?? '',
      courseTeacher: data['courseTeacher'] ?? '',
      imagePath: data['imagePath'] ?? '',
      rank: data['rank']?.toDouble() ?? 0.0,
      time: data['Time'] ?? '',
      language: data['language'] ?? '',
      certification: data['certification'] ?? '',
      videoUrl: data['VideoUrl'] ?? '',
      description: data['description'] ?? '',
    );
  }
  @override
  String toString() {
    return 'BlogPost{id: $courseName, date: $time, description: $description, imageUrls: $imagePath, title: $courseTeacher}';
  }
}
