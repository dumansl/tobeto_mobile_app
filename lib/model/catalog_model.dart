class CatalogCourse {
  final String courseName;
  final String courseTeacher;
  final String imagePath;
  final double rank;
  final String? time;
  final String? language;
  final String? certification;

  CatalogCourse({
    required this.courseName,
    required this.courseTeacher,
    required this.imagePath,
    required this.rank,
    this.time,
    this.language,
    this.certification,
  });

  factory CatalogCourse.fromMap(Map<String, dynamic> data) {
    return CatalogCourse(
        courseName: data['courseName'] ?? '',
        courseTeacher: data['courseTeacher'] ?? '',
        imagePath: data['imagePath'] ?? '',
        rank: data['rank']?.toDouble() ?? 0.0,
        time: data['Time'] ?? '',
        language: data['language'] ?? '',
        certification: data['certification'] ?? '');
  }
}
