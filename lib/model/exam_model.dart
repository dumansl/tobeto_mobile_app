class Exam {
  final String exam;
  final dynamic examId;

  Exam({required this.exam, required this.examId});

  factory Exam.fromJson(Map<String, dynamic> json) {
    return Exam(
      exam: json['exam'],
      examId: json['exam_id'].toString(),
    );
  }
}
