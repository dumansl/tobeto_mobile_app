class SurveyModel {
  final String question;
  final List<String> options;
  String? selected;
  final String title;

  SurveyModel({
    required this.question,
    required this.options,
    this.selected,
    required this.title,
  });

  factory SurveyModel.fromMap(Map<String, dynamic> data) {
    return SurveyModel(
      question: data['question_text'] ?? '',
      options: List<String>.from(data['options'] ?? []),
      title: data['title'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'question_text': question,
      'options': options,
    };
  }
}
