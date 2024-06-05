class ExamModel {
  final String exam;
  final int examId;

  ExamModel({required this.exam, required this.examId});

  factory ExamModel.fromJson(Map<String, dynamic> json) {
    return ExamModel(
      exam: json['exam'] ?? '',
      examId: json['exam_id'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    data['exam'] = exam;
    data['exam_id'] = examId;

    return data;
  }
}
